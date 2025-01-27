<?php
	
require(dirname(__FILE__, 3) . '/framework/loader.php');
header('Cache-Control: no-cache');

$session = BeaconSession::GetFromCookie();
if (is_null($session)) {
	BeaconTemplate::StartScript();
	?><script>
	window.location = `/account/login/?return=${encodeURIComponent(window.location.href)}`;
	</script><?php
	BeaconTemplate::FinishScript();
	exit;
}
$session->Renew();

$user = BeaconUser::GetByUserID($session->UserID());
BeaconTemplate::SetTitle('Account: ' . $user->Username());
BeaconTemplate::AddStylesheet(BeaconCommon::AssetURI('account.css'));

BeaconTemplate::StartScript(); ?>
<script>
const deviceId = <?php echo json_encode(BeaconCommon::DeviceID()); ?>;
const sessionId = <?php echo json_encode($session->SessionID()); ?>;
const apiDomain = <?php echo json_encode(BeaconCommon::APIDomain()); ?>;
</script><?php
BeaconTemplate::FinishScript();
	
BeaconTemplate::AddScript(BeaconCommon::AssetURI('account.js'));
BeaconTemplate::AddScript(BeaconCommon::AssetURI('moment.min.js'));

$teams_enabled = BeaconCommon::TeamsEnabled();

?><div id="account-user-header" class="header-with-subtitle" beacon-user-id="<?php echo htmlentities($user->UserID()); ?>" beacon-user-name="<?php echo htmlentities($user->Username()); ?>" beacon-user-suffix="<?php echo htmlentities($user->Suffix()); ?>">
	<h1><?php echo htmlentities($user->Username()); ?><span class="user-suffix">#<?php echo htmlentities($user->Suffix()); ?></span></h1>
	<span class="subtitle"><a href="/account/auth?return=<?php echo urlencode('/'); ?>" title="Sign Out">Sign Out</a></span>
</div>
<div class="page-panel" id="panel-account">
	<div class="page-panel-nav">
		<ul>
			<li class="page-panel-active"><a href="#projects" page="projects">Projects</a></li>
			<li><a href="#omni" page="omni">Omni</a></li>
			<li><a href="#profile" page="profile">Profile</a></li>
			<li><a href="#security" page="security">Security</a></li>
			<li><a href="#sessions" page="sessions">Sessions</a></li>
		</ul>
	</div>
	<div class="page-panel-pages">
		<div class="page-panel-page page-panel-visible" page="projects">
			<h1>Projects</h1>
			<?php include('includes/projects.php'); ?>
		</div>
		<div class="page-panel-page" page="omni">
			<h1>Beacon Omni</h1>
			<?php include('includes/omni.php'); ?>
		</div>
		<div class="page-panel-page" page="profile">
			<h1>Profile</h1>
			<?php include('includes/profile.php'); ?>
		</div>
		<div class="page-panel-page" page="security">
			<h1>Security</h1>
			<?php include('includes/security.php'); ?>
		</div>
		<div class="page-panel-page" page="sessions">
			<h1>Sessions</h1>
			<?php include('includes/sessions.php'); ?>
		</div>
	</div>
	<div class="page-panel-footer">&nbsp;</div>
</div>
