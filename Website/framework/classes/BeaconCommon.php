<?php

abstract class BeaconCommon {
	const DBKEY_READONLY = 'reader';
	const DBKEY_WRITABLE = 'writer';
	
	protected static ?BeaconDatabase $database = null;
	protected static array $globals = [];
	protected static int $min_version = -1;
	protected static array $versions = [];
	
	public static function GenerateUUID(): string {
		$data = random_bytes(16);
		$data[6] = chr(ord($data[6]) & 0x0f | 0x40); // set version to 0100
		$data[8] = chr(ord($data[8]) & 0x3f | 0x80); // set bits 6-7 to 10
		return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
	}
	
	public static function StartSession(): bool {
		switch (session_status()) {
		case PHP_SESSION_NONE:
			$session_name = 'beacon';
			session_name($session_name);
			session_set_cookie_params([
				'path' => '/account',
				'domain' => '.usebeacon.app',
				'secure' => true,
				'httponly' => true,
				'samesite' => 'Lax'
			]);
			if (session_start()) {
				$paths = ['/oauth', '/omni'];
				$session_id = session_id();
				foreach ($paths as $path) {
					setcookie($session_name, $session_id, [
						'path' => $path,
						'domain' => '.usebeacon.app',
						'secure' => true,
						'httponly' => true,
						'samesite' => 'Lax'
					]);
				}
			} else {
				return false;
			}
		case PHP_SESSION_ACTIVE:
			return true;
		default:
			return false;
		}
	}
	
	public static function EnvironmentName(): string {
		return self::GetGlobal('Environment_Name', 'bork');
	}
	
	public static function InProduction(): bool {
		return self::GetGlobal('Production', false);
	}
	
	public static function InDevelopment(): bool {
		return !self::InProduction();
	}
	
	public static function FrameworkPath(): string {
		return dirname(__FILE__, 2);
	}
	
	public static function WebRoot(): string {
		return dirname(__FILE__, 3) . '/www';
	}
	
	public static function MinVersion(): int {
		if (static::$min_version == -1) {
			if (static::InDevelopment()) {
				static::$min_version = 99999999;
			} else {
				static::$min_version = max(static::NewestVersionForStage(3), 0);
			}
		}
		return static::$min_version;
	}
	
	public static function NewestVersionForStage(int $stage): int {
		if (array_key_exists($stage, static::$versions) === false) {
			$database = static::Database();
			$builds = $database->Query('SELECT build_number FROM updates WHERE stage >= $1 ORDER BY build_number DESC LIMIT 1;', $stage);
			if ($builds->RecordCount() == 1) {
				static::$versions[$stage] = intval($builds->Field('build_number'));
			}
		}
		return static::$versions[$stage];
	}
	
	public static function NewestUpdateTimestamp(int $build = 99999999): DateTime {
		$database = static::Database();
		$results = $database->Query('SELECT MAX(stamp) AS stamp FROM ((SELECT MAX(objects.last_update) AS stamp FROM ark.objects INNER JOIN ark.mods ON (objects.mod_id = mods.mod_id) WHERE GREATEST(objects.min_version, mods.min_version) <= $1 AND mods.confirmed = TRUE) UNION (SELECT MAX(action_time) AS stamp FROM ark.deletions WHERE min_version <= $1) UNION (SELECT MAX(last_update) AS stamp FROM help_topics) UNION (SELECT MAX(last_update) AS stamp FROM ark.game_variables) UNION (SELECT MAX(last_update) AS stamp FROM ark.mods WHERE min_version <= $1 AND confirmed = TRUE AND include_in_deltas = TRUE) UNION (SELECT MAX(maps.last_update) AS stamp FROM ark.maps INNER JOIN ark.mods ON (maps.mod_id = mods.mod_id) WHERE mods.min_version <= $1 AND mods.confirmed = TRUE) UNION (SELECT MAX(last_update) AS stamp FROM ark.events) UNION (SELECT MAX(last_update) AS stamp FROM ark.colors) UNION (SELECT MAX(last_update) AS stamp FROM ark.color_sets)) AS merged;', $build);
		return new DateTime($results->Field('stamp'));
	}
	
	public static function AssetURI(string $asset_filename): string {
		$extension = pathinfo($asset_filename, PATHINFO_EXTENSION);
		$filename = substr($asset_filename, 0, (strlen($extension) + 1) * -1);
		
		$public_extension = $extension;
		$folders = [$extension];
		$in_production = null;
		switch ($extension) {
		case 'css':
			$folders = ['css'];
			break;
		case 'js':
			$folders = ['scripts'];
			break;
		case 'svg':
		case 'png':
		case 'gif':
		case 'ico':
			$folders = ['images', 'favicon'];
			break;
		case 'ttf':
		case 'otf':
		case 'woff2':
			$folders = ['fonts'];
			break;
		case 'json':
		case 'xml':
			$folders = ['favicon'];
			break;
		}
		
		foreach ($folders as $folder) {
			$asset_path = static::WebRoot() . '/assets/' . $folder . '/' . $asset_filename;
			if (file_exists($asset_path)) {
				$uri_path = '/assets/' . $folder . '/' . $filename . '.' . $public_extension;
				return $uri_path . '?mtime=' . filemtime($asset_path);
			}
		}
		
		if (is_null($in_production)) {
			$in_production = static::InProduction();
		}
		if ($in_production) {
			return '#';
		} else {
			return "/assets/missing/{$asset_filename}";
		}
	}
	
	public static function Database(): ?BeaconDatabase {
		return self::$database;
	}
	
	public static function SetupDatabase(BeaconDatabaseSettings $write_settings, BeaconDatabaseSettings $read_settings): void {
		self::$database = new BeaconPostgreSQLDatabase(BeaconDatabase::CONNECTION_READONLY, $write_settings, $read_settings);
	}
	
	public static function GenerateRandomKey(int $length = 12, string $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'): string {
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}
	
	public static function IsUUID(&$input): bool {
		if (!is_string($input)) {
			return false;
		}
		
		$cleaned = preg_replace('/\s+/', '', $input);
		if ($cleaned === '00000000-0000-0000-0000-000000000000') {
			return true;
		}
		
		if (preg_match('/^([0-9A-F]{8})-?([0-9A-F]{4})-?([0-9A-F]{4})-?([0-9A-F]{4})-?([0-9A-F]{12})$/i', $cleaned, $matches) === 1) {
			$input = strtolower($matches[1] . '-' . $matches[2] . '-' . $matches[3] . '-' . $matches[4] . '-' . $matches[5]);
			return true;
		} else {
			return false;
		}
	}
	
	public static function IsAssoc(array $arr): bool {
	    if (array() === $arr) return false;
	    return array_keys($arr) !== range(0, count($arr) - 1);
	}
	
	public static function Redirect(string $destination, bool $temp = true): void {
		header('Location: ' . $destination);
		if ($temp === true) {
			http_response_code(302);
			echo '<p>Please relocate to <a href="' . $destination . '">' . htmlentities($destination, ENT_COMPAT, 'UTF-8') . '</a>.</p>';
		} else {
			http_response_code(301);
			echo '<p>This page has moved to <a href="' . $destination . '">' . htmlentities($destination, ENT_COMPAT, 'UTF-8') . '</a>.</p>';
		}
		exit;
	}
	
	public static function Domain(): string {
		return self::GetGlobal('Web_Domain', '');
	}
	
	public static function APIDomain(): string {
		return self::GetGlobal('API_Domain', '');
	}
	
	public static function AbsoluteURL(string $path): string {
		return 'https://' . self::Domain() . $path;
	}
	
	public static function HasAllKeys(array $arr, ...$keys): bool {
		foreach ($keys as $key) {
			if (!array_key_exists($key, $arr)) {
				return false;
			}
		}
		return true;
	}
	
	public static function HasAnyKeys(array $arr, ...$keys): bool {
		foreach ($keys as $key) {
			if (array_key_exists($key, $arr)) {
				return true;
			}
		}
		return false;
	}
	
	public static function SetGlobal(string $key, mixed $value): void {
		self::$globals[$key] = $value;
	}
	
	public static function GetGlobal(string $key, mixed $default = null): mixed {
		if (array_key_exists($key, self::$globals)) {
			return self::$globals[$key];
		} else {
			return $default;
		}
	}
	
	public static function PostSlackMessage(string $message): void {
		self::PostSlackRaw(json_encode(['text' => $message]));
	}
	
	public static function PostSlackRaw(string $raw): void {
		$url = self::GetGlobal('Slack_WebHook_URL');
		if (is_null($url)) {
			trigger_error('Config file did not specify Slack_WebHook_URL', E_USER_ERROR);
		}
	
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $raw);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
		curl_exec($ch);
		curl_close($ch);
	}
	
	public static function IsMacOS(): bool {
		return stristr($_SERVER['HTTP_USER_AGENT'], 'Macintosh') !== false;
	}
	
	public static function IsWindows(): bool {
		return stristr($_SERVER['HTTP_USER_AGENT'], 'Windows NT') !== false;
	}
	
	public static function IsWindows64(): bool {
		$agent = $_SERVER['HTTP_USER_AGENT'];
		$possibles = array('x86_64', 'x86-64', 'Win64', 'x64;', 'amd64', 'AMD64', 'WOW64', 'x64_64');
		foreach ($possibles as $possible) {
			if (strpos($agent, $possible) !== false) {
				return true;
			}
		}
		return false;
	}
	
	public static function IsLinux(): bool {
		return (stristr($_SERVER['HTTP_USER_AGENT'], 'Linux') !== false) && (stristr($_SERVER['HTTP_USER_AGENT'], 'Android') === false);
	}
	
	public static function IsiOS(): bool {
		return stristr($_SERVER['HTTP_USER_AGENT'], 'iPhone') !== false;
	}
	
	public static function IsAndroid(): bool {
		return stristr($_SERVER['HTTP_USER_AGENT'], 'Android') !== false;
	}
	
	public static function IsWindowsPhone(): bool {
		return stristr($_SERVER['HTTP_USER_AGENT'], 'Windows Phone OS') !== false;
	}
	
	public static function ArrayToEnglish(array $items, string $conjunction = 'and'): string {
		if (count($items) == 0) {
			return '';
		} elseif (count($items) == 1) {
			return $items[0];
		} elseif (count($items) == 2) {
			return $items[0] . ' ' . $conjunction . ' ' . $items[1];
		} else {
			$last = array_pop($items);
			return implode(', ', $items) . ', ' . $conjunction . ' ' . $last;
		}
	}
	
	public static function ResolveObjectIdentifier(string $object_id, int $workshop_id = 0): ?object {
		// $object_id could be a UUID or a class string. Only blueprints have class strings,
		// but if supplied with a UUID of a blueprint, we want the blueprint object back.
		// In fact, we always want the most specific class possible for the given input.
		
		$workshop_id = abs($workshop_id);
		
		$cache_key = $object_id;
		if ($workshop_id > 0) {
			$cache_key = $workshop_id . '|' . $cache_key;
		}
		
		$obj = BeaconCache::Get($cache_key);
		if (!is_null($obj)) {
			// Renew the cache
			BeaconCache::Set($cache_key, $obj, 3600);
			return $obj;
		}
		
		$database = static::Database();
		if (static::IsUUID($object_id)) {
			$results = $database->Query('SELECT objects.object_id, objects.tableoid::regclass AS tablename FROM ark.objects INNER JOIN ark.mods ON (objects.mod_id = mods.mod_id) WHERE objects.object_id = $1 AND mods.confirmed = TRUE;', $object_id);
		} elseif ($workshop_id > 0) {
			$results = $database->Query('SELECT blueprints.object_id, blueprints.tableoid::regclass AS tablename FROM ark.blueprints INNER JOIN ark.mods ON (blueprints.mod_id = mods.mod_id) WHERE blueprints.class_string = $1 AND mods.confirmed = TRUE AND ABS(mods.workshop_id) = $2 LIMIT 1;', $object_id, $workshop_id);
		} else {
			$results = $database->Query('SELECT blueprints.object_id, blueprints.tableoid::regclass AS tablename FROM ark.blueprints INNER JOIN ark.mods ON (blueprints.mod_id = mods.mod_id) WHERE blueprints.class_string = $1 AND mods.confirmed = TRUE;', $object_id);
		}
		if ($results->RecordCount() == 0) {
			return null;
		}
		
		$build_number = static::MinVersion();
		
		$objects = array();
		while (!$results->EOF()) {
			$id = $results->Field('object_id');
			$tablename = $results->Field('tablename');
			switch ($tablename) {
			case 'ark.creatures':
				$obj = \Ark\Creature::GetByObjectID($id, $build_number);
				break;
			case 'ark.diets':
				$obj = \Ark\Diet::GetByObjectID($id, $build_number);
				break;
			case 'ark.engrams':
				$obj = \Ark\Engram::GetByObjectID($id, $build_number);
				break;
			case 'ark.loot_sources':
				$obj = \Ark\LootSource::GetByObjectID($id, $build_number);
				break;
			case 'ark.presets':
				$obj = \Ark\Preset::GetByObjectID($id, $build_number);
				break;
			case 'ark.spawn_points':
				$obj = \Ark\SpawnPoint::GetByObjectID($id, $build_number);
				break;
			default:
				$obj = null;
				break;
			}
			if (!is_null($obj)) {
				$objects[] = $obj;
			}
			$results->MoveNext();
		}
		
		if (count($objects) == 0) {
			return null;
		} elseif (count($objects) == 1) {
			BeaconCache::Set($cache_key, $objects[0], 3600);
			return $objects[0];
		} else {
			foreach ($objects as $obj) {
				if ($obj instanceof \Ark\Blueprint) {
					BeaconCache::Set($obj->ModWorkshopID() . '|' . $obj->ClassString(), $obj, 3600);
				}
			}
			BeaconCache::Set($cache_key, $objects, 3600);
			return $objects;
		}
	}
	
	public static function CurrentContentType(): string {
		$headers = headers_list();
		foreach ($headers as $header) {
			if (stripos($header, 'Content-Type') !== false) {
				list($key, $value) = explode(':', $header, 2);
				return trim($value);
			}
		}
		return 'text/html';
	}
	
	public static function CurrentOmniVersion(): int {
		return 1;
	}
	
	public static function BestResponseContentType(mixed $supported_types = null): ?string {
		if (!isset($_SERVER['HTTP_ACCEPT'])) {
			if (is_array($supported_types) && count($supported_types) > 0) {
				return $supported_types[0];
			} else {
				return 'text/html';
			}
		}
		
		$selected_types = [];
		
		$client_types = explode(',', strtolower(str_replace(' ', '', $_SERVER['HTTP_ACCEPT'])));
		foreach ($client_types as $type) {
			$quality = 1;
			if (strpos($type, ';q=')) {
				list($type, $quality) = explode(';q=', $type, 2);
			}
			if ($quality > 0) {
				$selected_types[$type] = $quality;
			}
		}
		arsort($selected_types);
		
		if (is_null($supported_types) || is_array($supported_types) === false) {
			return $selected_types;
		}
		
		$supported_types = array_map('strtolower', (array)$supported_types);
		foreach ($selected_types as $type => $quality) {
			if ($quality && in_array($type, $supported_types)) {
				return $type;
			}
		}
		
		return null;
	}
	
	public static function BuildNumberToVersion(int $build_number): string {
		if ($build_number < 10000000) {
			$database = static::Database();
			$results = $database->Query('SELECT build_display FROM updates WHERE build_number = $1;', $build_number);
			if ($results->RecordCount() == 1) {
				return $results->Field('build_display');
			} else {
				return $build_number;
			}
		}
		
		$major_version = floor($build_number / 10000000);
		$build_number = $build_number - ($major_version * 10000000);
		$minor_version = floor($build_number / 100000);
		$build_number = $build_number - ($minor_version * 100000);
		$bug_version = floor($build_number / 1000);
		$build_number = $build_number - ($bug_version * 1000);
		$stage_code = floor($build_number / 100);
		$build_number = $build_number - ($stage_code * 100);
		$non_release_version = $build_number;
		
		if ($stage_code < 3) {
			switch ($stage_code) {
			case 2:
				$prerelease = 'b';
				break;
			case 1:
				$prerelease = 'a';
				break;
			case 0:
				$prerelease = 'pa';
				break;
			default:
				$prerelease = 'u';
				break;
			}
			$prerelease .= $non_release_version;
		} elseif ($non_release_version > 0) {
			$prerelease = '.' . $non_release_version;
		} else {
			$prerelease = '';
		}
		
		return $major_version . '.' . $minor_version . '.' . $bug_version . $prerelease;
	}
	
	public static function VersionToBuildNumber(string $version): int {
		if (preg_match('/^(\d+)\.(\d+)(\.(\d+))?(([ab\.]+)(\d+))?$/', $version, $matches) == 1) {
			$major_version = intval($matches[1]);
			$minor_version = intval($matches[2]);
			if (isset($matches[3])) {
				$bug_version = intval($matches[4]);
			} else {
				$bug_version = 0;
			}
			$stage_code = 3;
			$non_release_version = 0;
			if (isset($matches[5])) {
				$non_release_version = intval($matches[7]);
				switch ($matches[6]) {
				case 'a':
					$stage_code = 1;
					break;
				case 'b':
					$stage_code = 2;
					break;
				case '.':
					break;
				default:
					$stage_code = 0;
					break;
				}
			}
			return ($major_version * 10000000) + ($minor_version * 100000) + ($bug_version * 1000) + ($stage_code * 100) + $non_release_version;
		}
		
		return 0;
	}
	
	public static function BooleanValue(mixed $value): bool {
		if (is_bool($value) === true) {
			return $value;
		}
		
		$boolval = (is_string($value) ? filter_var($value, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE) : (bool) $value);
		return ($boolval === null ? false : $boolval);
	}
	
	public static function SecondsToEnglish(int $seconds, bool $short = false, int $largest_unit = 86400): string {
		$parts = array();
		if ($seconds > 86400 && $largest_unit >= 86400) {
			$days = floor($seconds / 86400);
			$seconds = $seconds - ($days * 86400);
			if ($short) {
				$parts[] = $days . 'd';
			} else {
				if ($days == 1) {
					$parts[] = '1 day';
				} else {
					$parts[] = $days . ' days';
				}
			}
		}
		if ($seconds > 3600 && $largest_unit >= 3600) {
			$hours = floor($seconds / 3600);
			$seconds = $seconds - ($hours * 3600);
			if ($short) {
				$parts[] = $hours . 'h';
			} else {
				if ($hours == 1) {
					$parts[] = '1 hour';
				} else {
					$parts[] = $hours . ' hours';
				}
			}
		}
		if ($seconds > 60 && $largest_unit >= 60) {
			$minutes = floor($seconds / 60);
			$seconds = $seconds - ($minutes * 60);
			if ($short) {
				$parts[] = $minutes . 'm';
			} else {
				if ($minutes == 1) {
					$parts[] = '1 minute';
				} else {
					$parts[] = $minutes . ' minutes';
				}
			}
		}
		if ($short) {
			if ($seconds > 0) {
				$parts[] = $seconds . 's';
			}
		} else {
			if ($seconds == 1) {
				$parts[] = '1 second';
			} elseif ($seconds > 0) {
				$parts[] = $seconds . ' seconds';
			}
		}
		
		if ($short) {
			return implode(' ', $parts);
		} else {
			if (count($parts) == 1) {
				return $parts[0];
			} elseif (count($parts) == 2) {
				return $parts[0] . ' and ' . $parts[1];
			} elseif (count($parts) > 2) {
				$last = 	array_pop($parts);
				return implode(', ', $parts) . ', and ' . $last;
			} else {
				return '';
			}
		}
	}
	
	public static function CreateGiftCode(): string {
		return BeaconCommon::GenerateRandomKey(9, '23456789ABCDEFGHJKMNPQRSTUVWXYZ');
	}
	
	public static function SignDownloadURL(string $url, int $expires = 21600): string {
		if (strtolower(substr($url, 0, 29)) === 'https://releases.beaconapp.cc') {
			$path = substr($url, 29);
		} elseif (strtolower(substr($url, 0, 30)) === 'https://releases.usebeacon.app') {
			$path = substr($url, 30);
		} else {
			return $url;
		}
		
		$key = static::GetGlobal('BunnyCDN_Signing_Key');
		if (is_null($key)) {
			return $url;
		}
		
		$expires += time();
		$token = str_replace('=', '', strtr(base64_encode(md5($key . $path . $expires, true)), '+/', '-_'));
		return 'https://releases.' . self::Domain() . $path . "?token=$token&expires=$expires&bcdn_filename=" . basename($url);
	}
	
	public static function IsCompressed(string $content, bool $path_mode = false): bool {
		if ($path_mode) {
			$path = $content;
			$handle = fopen($path, 'rb');
			$content = fread($handle, 2);
			fclose($handle);
		} else {
			$content = substr($content, 0, 2);
		}
		$arr = unpack('C*', $content);
		return count($arr) == 2 && $arr[1] == 0x1f && $arr[2] == 0x8b;
	}
	
	public static function FormatFloat(float $num, int $min_decimals = 1, int $max_decimals = 4): string {
		for ($i = $min_decimals; $i < $max_decimals; $i++) {
			$pow = pow(10, $i);
			$test = $num * $pow;
			if (floor($test) == $test) {
				break;
			}
		}
		return number_format($num, $i);
	}
	
	public static function IsHex($content): bool {
		if (!is_string($content)) {
			return false;
		}
		
		return (preg_match('/^[a-fA-F0-9]+$/', $content) === 1);
	}
	
	public static function CompressedResponseAllowed(): bool {
		return (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && stripos(strtolower($_SERVER['HTTP_ACCEPT_ENCODING']), 'gzip') !== false);
	}
	
	public static function AnonymizeIP(string $addr): string {
		$unknown_addr = str_contains($addr, ':') ? '::' : '0.0.0.0';
		
		$converted = @inet_pton($addr);
		if ($converted === false) {
			return $unknown_addr;
		}
		
		if (strlen($converted) === 4) {
			$converted = substr($converted, 0, 3) . "\0";
		} elseif (strlen($converted) === 16) {
			$converted = substr($converted, 0, 6) . "\0\0\0\0\0\0\0\0\0\0";
		} else {
			return $unknown_addr;
		}
		
		$anon = @inet_ntop($converted);
		if ($anon === false) {
			return $unknown_addr;
		}
		return $anon;
	}
	
	public static function RemoteAddr(bool $anonymous = true): string {
		$addr = '';
		if (empty($_SERVER['HTTP_CF_CONNECTING_IP']) === false) {
			$addr = $_SERVER['HTTP_CF_CONNECTING_IP'];
		} elseif (empty($_SERVER['HTTP_TRUE_CLIENT_IP']) === false) {
			$addr = $_SERVER['HTTP_TRUE_CLIENT_IP'];
		} elseif (empty($_SERVER['HTTP_X_FORWARDED_FOR']) === false) {
			$arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
			$addr = $arr[0];
		} else {
			$addr = $_SERVER['REMOTE_ADDR'];
		}
		if ($anonymous) {
			return self::AnonymizeIP($addr);
		} else {
			return $addr;
		}
	}
	
	public static function RemoteCountry(): string {
		if (empty($_SERVER['HTTP_CF_IPCOUNTRY']) === false) {
			return $_SERVER['HTTP_CF_IPCOUNTRY'];
		} else {
			return 'XX';
		}
	}
	
	public static function TeamsEnabled(): bool {
		return false;
		$enabled = self::GetGlobal('Teams Enabled', false);
		if ($enabled === false) {
			return false;
		}
		
		return isset($_SERVER['HTTP_HOST']) && substr($_SERVER['HTTP_HOST'], -13) === 'usebeacon.app';
	}
	
	public static function BeaconVersion(): int {
		$build_number = 0;
		
		if (static::IsBeacon()) {
			$pos = strpos($_SERVER['HTTP_USER_AGENT'], ' ', 7);
			$version = substr($_SERVER['HTTP_USER_AGENT'], 7, $pos - 7);
			$build_number = static::VersionToBuildNumber($version);
		}
		
		if ($build_number === 0) {
			$database = static::Database();
			$builds = $database->Query("SELECT build_number FROM updates WHERE stage >= 3 ORDER BY build_number DESC LIMIT 1;");
			if ($builds->RecordCount() == 1) {
				$build_number = intval($builds->Field('build_number'));
			}
		}
		
		return $build_number;
	}
	
	public static function IsBeacon(): bool {
		return (isset($_SERVER['HTTP_USER_AGENT']) && substr($_SERVER['HTTP_USER_AGENT'], 0, 7) === 'Beacon/');
	}
	
	public static function BuildDateForVersion(mixed $version): int {
		if (is_string($version)) {
			$version = self::VersionToBuildNumber($version);
		}
		
		$stage = floor(($version / pow(10, 2)) % 10);
		$minor = floor($version / 1000) * 1000;
		if ($stage < 3) {
			$min_stage = 0;
			$max_stage = 2;
			$stage = 0;
		} else {
			$min_stage = 3;
			$max_stage = 99;
		}
		$base = $minor + ($stage * 100);
		
		$database = self::Database();
		$results = $database->Query('SELECT EXTRACT(epoch FROM published) AS published FROM updates WHERE build_number >= $1 AND stage >= $2 AND stage <= $3 ORDER BY build_number LIMIT 1;', $base, $min_stage, $max_stage);
		if ($results->RecordCount() === 0) {
			return date('Y-m-d H:i:sO', time());
		} else {
			return date('Y-m-d H:i:sO', $results->Field('published'));
		}
	}
	
	public static function CreateUniqueSort(string $sort, array &$counters): string {
		if (array_key_exists($sort, $counters)) {
			$counter = $counters[$sort] + 1;
		} else {
			$counter = 0;
		}
		$counters[$sort] = $counter;
		return $sort . ':' . number_format($counter, 0, '.', '');
	}
	
	public static function SortInteger(int $value): string {
		return str_pad(number_format($value, 0, '', ''), 3, '0', STR_PAD_LEFT);
	}
	
	public static function SortDouble(float $value): string {
		return str_pad(number_format($value, 6, '.', ''), 10, '0', STR_PAD_LEFT);
	}
	
	public static function SortString(string $value): string {
		return strtolower($value);
	}
	
	public static function Base32Encode(string $value, bool $padding = false): string {
		$alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '='];
		$bytes = str_split($value);
		$byte_count = count($bytes);
		$binary = '';
		for ($i = 0; $i < $byte_count; $i++) {
			$binary .= str_pad(base_convert(ord($bytes[$i]), 10, 2), 8, '0', STR_PAD_LEFT);
		}
		
		$chunks = str_split($binary, 5);
		$base32 = '';
		$chunk_count = count($chunks);
		for ($i = 0; $i < $chunk_count; $i++) {
			$base32 .= $alphabet[base_convert(str_pad($chunks[$i], 5, '0'), 2, 10)];
		}
		
		$remainder = strlen($binary) % 40;
		if ($padding && $remainder !== 0) {
			if ($remainder === 8) {
				$base32 .= str_repeat($alphabet[32], 6);
			}
			if ($remainder === 16) {
				$base32 .= str_repeat($alphabet[32], 4);
			}
			if ($remainder === 24) {
				$base32 .= str_repeat($alphabet[32], 3);
			}
			if ($remainder === 32) {
				$base32 .= $alphabet[32];
			}
		}
		
		return $base32;
	}
	
	public static function Base32Decode(string $value): string {
		if (empty($value)) {
			return '';
		}
		
		$alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '='];
		$flipped = array_flip($alphabet);
		$value = strtoupper($value);
		$padding_count = substr_count($value, $alphabet[32]);
		$allowed_padding_counts = [6, 4, 3, 1, 0];
		if (in_array($padding_count, $allowed_padding_counts) === false) {
			throw new InvalidArgumentException('Invalid base32 padding');
		}
		
		if ($padding_count > 0) {
			if (substr($value, $padding_count * -1) !== str_repeat($alphabet[32], $padding_count)) {
				throw new InvalidArgumentException('Invalid base32 data');
			}
			$value = str_replace($alphabet[32], '', $value);
		}
		
		$chars = str_split($value);
		$binary = '';
		$char_count = count($chars);
		
		for ($i = 0; $i < $char_count; $i += 8) {
			$chunk = '';
			for ($j = 0; $j < 8; $j++) {
				if (isset($chars[$i + $j]) === false) {
					continue;
				}
				
				$char = $chars[$i + $j];
				$chunk .= str_pad(base_convert($flipped[$char], 10, 2), 5, '0', STR_PAD_LEFT);
			}
			
			$eight_bits = str_split($chunk, 8);
			$bit_count = count($eight_bits);
			
			for ($j = 0; $j < $bit_count; $j++) {
				$binary .= (($b = chr((int)base_convert($eight_bits[$j], 2, 10))) || ord($b) === 48) ? $b : '';
			}
		}
		
		return rtrim($binary, "\0");
	}
	
	public static function DeviceID(): string {
		if (isset($_COOKIE['beacon_device_id'])) {
			return $_COOKIE['beacon_device_id'];
		}
		
		$device_id = static::GenerateUUID();
		
		setcookie('beacon_device_id', $device_id, [
			'path' => '/account',
			'expires' => 2147483647,
			'secure' => true,
			'httponly' => true,
			'samesite' => 'Strict'
		]);
		$_COOKIE['beacon_device_id'] = $device_id;
		
		return $device_id;
	}
	
	public static function Base64UrlEncode(string $value): string {
		$base64 = base64_encode($value);
		if ($base64 === false) {
			return false;
		}
		return str_replace(['+', '/', '='], ['-', '_', ''], $base64);
	}
	
	public static function Base64UrlDecode(string $value): string {
		$value = str_replace(['-', '_'], ['+', '/'], $value);
		return base64_decode($value);
	}
	
	public static function NewestBuildForLicense(string $licenseId, bool $onlyPublished = false): int {
		$database = static::Database();
		$results = $database->Query('SELECT EXTRACT(epoch FROM expiration) AS expiration FROM public.licenses WHERE license_id = $1;', $licenseId);
		if ($results->RecordCount() === 0) {
			return 0;
		}
		return static::NewestBuildForExpiration($results->Field('expiration'), $onlyPublished);
	}
	
	public static function NewestBuildForExpiration(int $expiration, bool $onlyPublished = false): int {
		$database = static::Database();
		
		// Find the newest. If there is a beta running, that changes the answer.
		$results = $database->Query('SELECT build_number, stage FROM public.updates WHERE published IS NOT NULL ORDER BY build_number DESC LIMIT 1;');
		$latestBuild = $results->Field('build_number');
		$latestBuildBase = floor($latestBuild / 1000);
		$isBetaActive = $results->Field('stage') < 3;
		
		// Find the latest build the expiration allows.
		$results = $database->Query('SELECT build_number FROM public.updates WHERE published <= to_timestamp($1) AND stage >= $2 ORDER BY build_number DESC LIMIT 1;', $expiration, ($isBetaActive ? 0: 3));
		$allowedBuild = $results->Field('build_number');
		$allowedBuildBase = floor($allowedBuild / 1000);
		
		if ($isBetaActive && $allowedBuildBase === $latestBuildBase) {
			// User had access to at least one of the active betas, so they should have access to all betas until release
			$allowedBuild = ($allowedBuildBase * 1000) + 299;
		} else {
			$allowedBuild = ($allowedBuildBase * 1000) + 999;
		}
		
		if ($onlyPublished === false) {
			return $allowedBuild;
		}
		
		$results = $database->Query('SELECT MAX(build_number) AS newest_build FROM public.updates WHERE build_number <= $1;', $allowedBuild);
		return $results->Field('newest_build');
	}
}

?>
