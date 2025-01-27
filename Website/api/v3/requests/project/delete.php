<?php

BeaconAPI::Authorize();
	
function handle_request(array $context): void {
	$project_id = $context['path_parameters']['project_id'];
	if (\BeaconCommon::IsUUID($project_id) === false) {
		BeaconAPI::ReplyError('Specify one project by UUID.', null, 400);
	}
	
	$user_id = BeaconAPI::UserID();
	$success = false;
	$database = \BeaconCommon::Database();
	
	try {
		$results = $database->Query('SELECT role FROM ' . \BeaconAPI\Project::SchemaName() . '.' . \BeaconAPI\Project::AllowedTableName() . ' WHERE project_id = $1 AND user_id = $2;', $project_id, $user_id);
		if ($results->RecordCount() !== 1) {
			BeaconAPI::ReplyError('Project not found.', null, 404);
		}
		
		$role = $results->Field('role');
		
		// When a file is deleted, if it is shared with another user, ownership transfers to another user. Which user
		// is not particularly important.
		switch ($role) {
		case 'Owner':
		case 'Team':
			$database->BeginTransaction();
			$guest_results = $database->Query('SELECT user_id FROM ' . \BeaconAPI\Project::SchemaName() . '.' . \BeaconAPI\Project::GuestTableName() . ' WHERE project_id = $1 AND user_id != $2;', $project_id, $user_id);
			if ($guest_results->RecordCount() == 0) {
				// There are no other guests, so delete it
				$database->Query('UPDATE ' . \BeaconAPI\Project::SchemaName() . '.' . \BeaconAPI\Project::TableName() . ' SET deleted = TRUE WHERE project_id = $1;', $project_id);
			} else {
				// There is at least one guest, transfer ownership
				$guest_user_id = $guest_results->Field('user_id');
				$database->Query('UPDATE ' . \BeaconAPI\Project::SchemaName() . '.' . \BeaconAPI\Project::TableName() . ' SET user_id = $1 WHERE project_id = $2;', $guest_user_id, $project_id);
				$database->Query('DELETE FROM ' . \BeaconAPI\Project::SchemaName() . '.' . \BeaconAPI\Project::GuestTableName() . ' WHERE project_id = $2 AND user_id IN ($1, $3);', $guest_user_id, $project_id, $user_id);
			}
			$database->Commit();
			$success = true;
			break;
		case 'Guest':
			$database->BeginTransaction();
			$database->Query('DELETE FROM ' . \BeaconAPI\Project::SchemaName() . '.' . \BeaconAPI\Project::GuestTableName() . ' WHERE project_id = $1 AND user_id = $2;', $project_id, $user_id);
			$database->Commit();
			$success = true;
			break;
		}
	} catch (Exception $e) {
	}
	
	if ($success) {
		BeaconAPI::ReplySuccess();
	} else {
		BeaconAPI::ReplyError('No project was deleted.');
	}
}

?>