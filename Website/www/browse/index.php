<?php
require(dirname(__FILE__, 3) . '/framework/loader.php');
BeaconTemplate::SetTitle('Browse Projects');
BeaconTemplate::AddStylesheet(BeaconCommon::AssetURI('generator.css'));

$search_keys = array(
	'public' => true
);

$sort_order = 'download_count DESC';
$limit = 25;
$offset = 0;
$selected_maps = \Ark\Map::CombinedMask(\Ark\Map::GetAll());
$map_operator = 'any';
if (array_key_exists('maps_operator', $_GET) && $_GET['maps_operator'] === 'all') {
	$map_operator = 'all';
}
if (array_key_exists('maps', $_GET)) {
	if (is_array($_GET['maps'])) {
		$map_mask = 0;
		foreach ($_GET['maps'] as $mask) {
			$map_mask = $map_mask | intval($mask);
		}
		$search_keys['map_' . $map_operator] = $map_mask;
		$selected_maps = $map_mask;
	} elseif (is_string($_GET['maps'])) {
		$search_keys['map_' . $map_operator] = intval($_GET['maps']);
		$selected_maps = intval($_GET['maps']);
	}
}
if (array_key_exists('sort', $_GET)) {
	switch ($_GET['sort']) {
	case 'recently_updated':
		$sort_order = 'last_update DESC';
		break;
	case 'most_downloaded':
		$sort_order = 'download_count DESC';
		break;
	}
}
if (array_key_exists('offset', $_GET)) {
	$offset = intval($_GET['offset']);
}
if (array_key_exists('console_safe', $_GET)) {
	$search_keys['console_safe'] = boolval($_GET['console_safe']);
}

$start_time = microtime(true);
$project_count = \Ark\Project::Search($search_keys, $sort_order, $limit, $offset, true);
$projects = \Ark\Project::Search($search_keys, $sort_order, $limit, $offset, false);
$end_time = microtime(true);

$maps = \Ark\Map::GetAll();
$map_checkboxes = [];
foreach ($maps as $map) {
	$map_checkboxes[] = '<div><label class="checkbox"><input type="checkbox" name="maps[]" value="' . $map->Mask() . '" id="map_checkbox_' . $map->Mask() . '"' . (($selected_maps & $map->Mask()) == $map->Mask() ? ' checked' : '') . '><span></span>' . htmlentities($map->Name()) . '</label></div>';
}

?><h1>Browse Projects</h1>
<div id="search_form" class="separator-color">
	<form action="" method="get">
		<table id="options_table">
			<tr>
				<td class="label">Maps</td>
				<td>
					<div class="option_group">
						<?php echo implode("\n", $map_checkboxes); ?>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Require</td>
				<td>
					<div class="option_group">
						<div class="input-radio"><input type="radio" name="maps_operator" value="any" id="map_operator_radio_any"<?php if ($map_operator === 'any') { echo ' checked'; } ?>><label for="map_operator_radio_any">Any Selected Map</label></div>
						<div class="input-radio"><input type="radio" name="maps_operator" value="all" id="map_operator_radio_all"<?php if ($map_operator === 'all') { echo ' checked'; } ?>><label for="map_operator_radio_all">All Selected Maps</label></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Compatibility</td>
				<td>
					<label class="checkbox"><input type="checkbox" name="console_safe" value="true" id="console_checkbox"<?php if (isset($search_keys['console_safe']) && boolval($search_keys['console_safe'])) { echo ' checked'; } ?>><span></span>Show only console-compatible projects</label>
				</td>
			</tr>
			<tr>
				<td class="label"><label for="sort_menu">Sort By</label></td>
				<td>
					<div class="select"><span></span>
						<select name="sort" id="sort_menu">
							<option value="most_downloaded"<?php if ($sort_order === 'download_count DESC') { echo ' selected'; } ?>>Most Downloaded</option>
							<option value="recently_updated"<?php if ($sort_order === 'last_update DESC') { echo ' selected'; } ?>>Recently Updated</option>
						</select>
					</div>
				</td>
			</tr>
		</table>
		<p class="text-center"><input type="submit" value="Search"></p>
	</form>
</div>
<?php

if ($project_count == 0) {
	echo '<p class="text-center">No projects found</p>';
	exit;
}

if (count($projects) > 0) {
	echo '<table id="browse_results" class="generic">';
	echo '<thead><tr><th>Name</th><th class="low-priority">Downloads</th><th class="low-priority">Updated</th><th class="low-priority">Revision</th></thead><tbody>';
	foreach ($projects as $project) {
		echo '<tr>';
		echo '<td><a href="' . urlencode($project->ProjectID()) . '?map_filter=' . $selected_maps . '" class="document_name">' . htmlentities($project->Title()) . '</a><br><span class="document_description">' . htmlentities($project->Description()) . '</span><div class="row-details"><span class="detail">Updated: ' . $project->LastUpdated()->format('M jS, Y g:i A') . ' UTC</span></div></td>';
		echo '<td class="text-right low-priority">' . number_format($project->DownloadCount()) . '</td>';
		echo '<td class="nowrap text-center low-priority"><time datetime="' . $project->LastUpdated()->format('c') . '">' . $project->LastUpdated()->format('M jS, Y g:i A') . ' UTC</time></td>';
		echo '<td class="text-right low-priority">' . number_format($project->Revision()) . '</td>';
		echo '</tr>';
	}
	echo '</tbody></table>';
}

if ($project_count > count($projects)) {
	// navigation
	if ($offset > 0) {
		$prev = $_GET;
		$prev['offset'] = max($offset - $limit, 0);
		$prev_link = '<a href="?' . http_build_query($prev) . '">&laquo; Previous</a>';
	} else {
		$prev_link = '&laquo; Previous';
	}
	
	if ($offset + $limit < $project_count) {
		$next = $_GET;
		$next['offset'] = $offset + $limit;
		$next_link = '<a href="?' . http_build_query($next) . '">More &raquo;</a>';
	} else {
		$next_link = 'More &raquo;';
	}
	
	echo '<p class="text-center">' . $prev_link . ' ' . $next_link . '</p>';
}

?>