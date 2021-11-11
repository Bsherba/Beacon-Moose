<?php

class BeaconAlgolia {
	private $requests = [];
	private $results = [];
	private $total_result_count = 0;
	
	public function SaveObject(string $object_id, bool $autocommit = true) {
		$database = BeaconCommon::Database();
		$rows = $database->Query('SELECT search_contents.id, search_contents.title, search_contents.body, search_contents.type, search_contents.subtype, search_contents.uri, search_contents.min_version, search_contents.max_version, mods.mod_id, mods.name AS mod_name FROM search_contents LEFT JOIN mods ON (search_contents.mod_id = mods.mod_id) WHERE (mods.confirmed = TRUE OR search_contents.mod_id IS NULL) AND search_contents.id = $1;', $object_id);
		if ($rows->RecordCount() === 0) {
			return false;
		}
		$this->SaveObjectRows($rows);
		if ($autocommit) {
			return $this->Commit();
		}
	}
	
	public function DeleteObject(string $object_id, bool $autocommit = true) {
		$this->requests[] = [
			'action' => 'deleteObject',
			'body' => [
				'objectID' => $object_id
			]
		];
		if ($autocommit) {
			return $this->Commit();
		}
	}
	
	private function SaveObjectRows(BeaconRecordSet $rows) {
		while ($rows->EOF() === false) {
			$this->requests[] = [
				'action' => 'updateObject',
				'body' => [
					'objectID' => $rows->Field('id'),
					'title' => trim($rows->Field('title')),
					'body' => trim($rows->Field('body')),
					'type' => $rows->Field('type'),
					'subtype' => $rows->Field('subtype'),
					'uri' => $rows->Field('uri'),
					'min_version' => intval($rows->Field('min_version')),
					'max_version' => intval($rows->Field('max_version')),
					'mod_id' => $rows->Field('mod_id'),
					'mod_name' => $rows->Field('mod_name')
				]
			];
			$rows->MoveNext();
		}
	}
	
	public function Rollback() {
		$this->requests = [];
	}
	
	public function Commit() {
		if (count($this->requests) === 0) {
			return true;
		}
		
		$app_id = BeaconCommon::GetGlobal('Algolia Application ID');
		$index = BeaconCommon::GetGlobal('Algolia Index Name');
		$api_key = BeaconCommon::GetGlobal('Algolia API Key');
		
		$url = 'https://' . urlencode($app_id) . '.algolia.net/1/indexes/' . urlencode($index) . '/batch';
		$handle = curl_init($url);
		curl_setopt($handle, CURLOPT_HTTPHEADER, [
			'Content-Type: application/json',
			'X-Algolia-Application-Id: ' . $app_id,
			'X-Algolia-API-Key: ' . $api_key
		]);
		curl_setopt($handle, CURLOPT_CUSTOMREQUEST, 'POST');
		curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($handle, CURLOPT_POSTFIELDS, json_encode(['requests' => $this->requests]));
		$body = curl_exec($handle);
		$status = curl_getinfo($handle, CURLINFO_HTTP_CODE);
		curl_close($handle);
		
		if ($status === 200) {
			$this->Rollback(); // Don't panic
			return true;
		}
		
		echo $body;
		
		return false;
	}
	
	public function Search(string $query, int $client_version, int $result_count) {
		$app_id = BeaconCommon::GetGlobal('Algolia Application ID');
		$index = BeaconCommon::GetGlobal('Algolia Index Name');
		$api_key = BeaconCommon::GetGlobal('Algolia API Key');
		
		$url = 'https://' . urlencode($app_id) . '.algolia.net/1/indexes/' . urlencode($index) . '?query=' . urlencode($query) . '&hitsPerPage=' . $result_count . '&filters=' . urlencode('min_version <= ' . $client_version . ' AND max_version >= ' . $client_version);
		$handle = curl_init($url);
		curl_setopt($handle, CURLOPT_HTTPHEADER, [
			'X-Algolia-Application-Id: ' . $app_id,
			'X-Algolia-API-Key: ' . $api_key
		]);
		curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
		$body = curl_exec($handle);
		$status = curl_getinfo($handle, CURLINFO_HTTP_CODE);
		curl_close($handle);
		
		if ($status !== 200) {
			echo $body;
			return [];
		}
		
		$response = json_decode($body, true);
		$this->results = $response['hits'];
		$this->total_result_count = $response['nbHits'];
		return $this->results;
	}
	
	public function Results() {
		return $this->results;
	}
	
	public function TotalResultCount() {
		return $this->total_result_count;
	}
	
	public function Sync() {
		$database = BeaconCommon::Database();
		$database->BeginTransaction();
		$rows = $database->Query('SELECT object_id FROM search_sync WHERE action = $1;', 'Delete');
		while ($rows->EOF() === false) {
			$this->DeleteObject($rows->Field('object_id'), false);
			$rows->MoveNext();
		}
		
		$rows = $database->Query('SELECT search_contents.id, search_contents.title, search_contents.body, search_contents.type, search_contents.subtype, search_contents.uri, search_contents.min_version, search_contents.max_version, mods.mod_id, mods.name AS mod_name FROM search_sync INNER JOIN search_contents ON (search_sync.object_id = search_contents.id) LEFT JOIN mods ON (search_contents.mod_id = mods.mod_id) WHERE (mods.confirmed = TRUE OR search_contents.mod_id IS NULL) AND search_sync.action = $1;', 'Save');
		$this->SaveObjectRows($rows);
		$database->Query('DELETE FROM search_sync;');
		
		if (count($this->requests) === 0) {
			$database->Rollback();
			return true;
		}
		
		if ($this->Commit() === true) {
			$database->Commit();
			return true;
		} else {
			$database->Rollback();
			return false;
		}
	}
}

?>
