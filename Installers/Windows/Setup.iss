; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Beacon"
#if defined(arm64)
  #define MyAppVersion Trim(GetFileProductVersion("..\..\Project\Builds - Beacon\Windows ARM 64 bit\Beacon\Beacon.exe"))
#elif defined(x64)
  #define MyAppVersion Trim(GetFileProductVersion("..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\Beacon.exe"))
#else
  #define MyAppVersion Trim(GetFileProductVersion("..\..\Project\Builds - Beacon\Windows\Beacon\Beacon.exe"))
#endif
#define MyAppPublisher "The ZAZ Studios"
#define MyAppURL "https://usebeacon.app/"
#define MyAppExeName "Beacon.exe"
#define MyAppResources "Beacon Resources"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E58BA263-A23C-484E-99DF-319D5BD1399F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=Install_{#MyAppName}
Compression=lzma2
SolidCompression=no
MinVersion=6.1sp1
ChangesAssociations=yes
#ifndef x86
  ArchitecturesInstallIn64BitMode=x64 arm64
#endif
#if defined(arm64)
  ArchitecturesAllowed=arm64
  OutputDir=Output\{#MyAppVersion}\arm64
  #define installARM64 1
#elif defined(x64)
  OutputDir=Output\{#MyAppVersion}\x64
  #define installX64 1
#elif defined(x86)
  OutputDir=Output\{#MyAppVersion}\x86
  #define installX86 1
#else
  OutputDir=Output\{#MyAppVersion}\arm64_x64_x86
  #define x64 1
  #define x86 1
  #define arm64 1
#endif
SignTool=TheZAZ /d $qBeacon$q /du $qhttps://usebeaon.app$q $f
SignToolRunMinimized=true
SignedUninstaller=yes
WizardStyle=modern
SetupIconFile=../../Artwork/App.ico
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
AppMutex=com.thezaz.beacon
SetupMutex=com.thezaz.beacon.setup

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
#if defined(x64)
Source: "..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\*.exe"; DestDir: "{app}"; Check: defined(installX64) Or (Is64BitInstallMode And IsX64); Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\*.dll"; DestDir: "{app}"; Check: defined(installX64) Or (Is64BitInstallMode And IsX64); Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\*"; Excludes: "*.exe,*.dll"; DestDir: "{app}"; Check: defined(installX64) Or (Is64BitInstallMode And IsX64); Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Files\VC_redist.x64.exe"; DestDir: "{tmp}"; Check: IsAdminInstallMode And (defined(installX64) Or (Is64BitInstallMode And IsX64));
Source: "Files\windows6.1-kb3140245-x64.msu"; DestDir: "{tmp}"; Check: IsAdminInstallMode And (defined(installX64) Or (Is64BitInstallMode And IsX64));
#endif
#if defined(arm64)
Source: "..\..\Project\Builds - Beacon\Windows ARM 64 bit\Beacon\*.exe"; DestDir: "{app}"; Check: defined(installARM64) Or (Is64BitInstallMode And IsARM64); Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows ARM 64 bit\Beacon\*.dll"; DestDir: "{app}"; Check: defined(installARM64) Or (Is64BitInstallMode And IsARM64); Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows ARM 64 bit\Beacon\*"; Excludes: "*.exe,*.dll"; DestDir: "{app}"; Check: defined(installARM64) Or (Is64BitInstallMode And IsARM64); Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Files\VC_redist.arm64.exe"; DestDir: "{tmp}"; Check: IsAdminInstallMode And (defined(installARM64) Or (Is64BitInstallMode And IsARM64));
#endif
#if defined(x86)
Source: "..\..\Project\Builds - Beacon\Windows\Beacon\*.exe"; DestDir: "{app}"; Check: defined(installX86) Or (Not Is64BitInstallMode); Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows\Beacon\*.dll"; DestDir: "{app}"; Check: defined(installX86) Or (Not Is64BitInstallMode); Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows\Beacon\*"; Excludes: "*.exe,*.dll"; DestDir: "{app}"; Check: defined(installX86) Or (Not Is64BitInstallMode); Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Files\vc_redist.x86.exe"; DestDir: "{tmp}"; Check: IsAdminInstallMode And (defined(installX86) Or (Not Is64BitInstallMode));
Source: "Files\windows6.1-kb3140245-x86.msu"; DestDir: "{tmp}"; Check: IsAdminInstallMode And (defined(installX86) Or (Not Is64BitInstallMode));
#endif
Source: "..\..\Artwork\BeaconDocument.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion
Source: "..\..\Artwork\BeaconIdentity.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion
Source: "..\..\Artwork\BeaconPreset.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion
Source: "..\..\Artwork\BeaconAuth.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion
Source: "..\..\Artwork\BeaconData.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKA; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp"; ValueType: dword; ValueName: "DefaultSecureProtocols"; ValueData: 2560; OnlyBelowVersion: 6.3
Root: HKA; Subkey: "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp"; ValueType: dword; ValueName: "DefaultSecureProtocols"; ValueData: 2560; OnlyBelowVersion: 6.3

Root: HKA; Subkey: "Software\Classes\.beacon"; ValueData: "BeaconDocument"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconDocument"; ValueData: "{#MyAppName} Document"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconDocument\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconDocument.ico,0"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconDocument\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKA; Subkey: "Software\Classes\.beaconidentity"; ValueData: "BeaconIdentity"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconIdentity"; ValueData: "{#MyAppName} Identity"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconIdentity\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconIdentity.ico,0"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconIdentity\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKA; Subkey: "Software\Classes\.beaconpreset"; ValueData: "BeaconPreset"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconPreset"; ValueData: "{#MyAppName} Preset"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconPreset\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconPreset.ico,0"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconPreset\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKA; Subkey: "Software\Classes\.beaconauth"; ValueData: "BeaconAuth"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconAuth"; ValueData: "{#MyAppName} Preset"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconAuth\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconAuth.ico,0"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconAuth\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKA; Subkey: "Software\Classes\.beacondata"; ValueData: "BeaconData"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconData"; ValueData: "{#MyAppName} Preset"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconData\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconData.ico,0"; ValueType: string; ValueName: ""
Root: HKA; Subkey: "Software\Classes\BeaconData\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKA; Subkey: "Software\Classes\beacon"; ValueType: "string"; ValueData: "URL:Beacon"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\beacon"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\beacon\DefaultIcon"; ValueType: "string"; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\beacon\shell\open\command"; ValueType: "string"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "/NOSETUPCHECK"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Check: not CmdLineParamExists('/NOLAUNCH'); Flags: nowait postinstall
#if defined(x64)
Filename: "{tmp}\VC_redist.x64.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 64-bit runtime..."; Check: IsAdminInstallMode And (defined(installX64) Or (Is64BitInstallMode And IsX64)); Flags: waituntilterminated
Filename: "wusa.exe"; Parameters: "{tmp}\windows6.1-kb3140245-x64.msu /quiet /norestart"; StatusMsg: "Installing KB3140245..."; Flags: waituntilterminated; OnlyBelowVersion: 6.2; Check: IsAdminInstallMode And (defined(installX64) Or (Is64BitInstallMode And IsX64)) And IsKBNeeded('KB3140245')
#endif
#if defined(arm64)
Filename: "{tmp}\VC_redist.arm64.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 64-bit runtime..."; Check: IsAdminInstallMode And (defined(installARM64) Or (Is64BitInstallMode And IsARM64)); Flags: waituntilterminated
#endif
#if defined(x86)
Filename: "{tmp}\VC_redist.x86.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 32-bit runtime..."; Check: IsAdminInstallMode And (defined(installX86) Or (Not Is64BitInstallMode)); Flags: waituntilterminated
Filename: "wusa.exe"; Parameters: "{tmp}\windows6.1-kb3140245-x86.msu /quiet /norestart"; StatusMsg: "Installing KB3140245..."; Flags: waituntilterminated; OnlyBelowVersion: 6.2; Check: IsAdminInstallMode And (defined(installX86) Or (Not Is64BitInstallMode)) And IsKBNeeded('KB3140245')
#endif

[Code]
var
  RestartRequired: Boolean;

function IsKBNeeded(KB: string): Boolean;
var
  WbemLocator: Variant;
  WbemServices: Variant;
  WQLQuery: string;
  WbemObjectSet: Variant;
begin
  WbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  WbemServices := WbemLocator.ConnectServer('', 'root\CIMV2');

  WQLQuery := 'select * from Win32_QuickFixEngineering where HotFixID = ''' + KB + '''';

  WbemObjectSet := WbemServices.ExecQuery(WQLQuery);
  Result := (VarIsNull(WbemObjectSet)) or (WbemObjectSet.Count = 0);
end;

function InitializeSetup(): Boolean;
begin
  RestartRequired := (GetWindowsVersion < $06020000) And IsKBNeeded('KB3140245');
  Result := True;
  if RestartRequired then begin
	  if MsgBox('A restart will be required when finished. Continue?', mbConfirmation, MB_YESNO) = IDNO then begin
	    Result := False;
	  end;
  end;
end;

function NeedRestart(): Boolean;
begin
  Result := RestartRequired;
end;

function CmdLineParamExists(const Value: string): Boolean;
var
  I: Integer;  
begin
  Result := False;
  for I := 1 to ParamCount do
    if CompareText(ParamStr(I), Value) = 0 then
    begin
      Result := True;
      Exit;
    end;
end;
