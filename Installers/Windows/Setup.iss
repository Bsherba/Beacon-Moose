; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Beacon"
#ifdef x64
  #define MyAppVersion Trim(GetFileProductVersion("..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\Beacon.exe"))
#else
  #define MyAppVersion Trim(GetFileProductVersion("..\..\Project\Builds - Beacon\Windows\Beacon\Beacon.exe"))
#endif
#define MyAppPublisher "The ZAZ Studios"
#define MyAppURL "https://beaconapp.cc/"
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
DefaultDirName={commonpf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=Install_{#MyAppName}
Compression=lzma2
SolidCompression=no
MinVersion=6.1.7601
ChangesAssociations=yes
#ifdef x64
  ArchitecturesAllowed=x64
  OutputDir={#MyAppVersion}\x64
#else
  #ifdef x86
    ArchitecturesAllowed=x86
    OutputDir={#MyAppVersion}\x86
  #else
    ArchitecturesAllowed=x86 x64
    OutputDir={#MyAppVersion}\Combo
    #define x64 1
    #define x86 1
  #endif
#endif
#ifdef x64
  ArchitecturesInstallIn64BitMode=x64
#endif
SignTool=TheZAZ /d $qBeacon$q /du $qhttps://beaconapp.cc$q $f
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[InstallDelete]
#ifdef x64
Type: filesandordirs; Name: "{commonpf32}\Beacon"; Check: Is64BitInstallMode;
#endif

[Files]
#ifdef x64
Source: "..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\*.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\*.dll"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows 64 bit\Beacon\*"; Excludes: "*.exe,*.dll"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Files\VC_redist.x64.exe"; DestDir: "{tmp}"; Check: Is64BitInstallMode;
Source: "Files\windows6.1-kb3140245-x64.msu"; DestDir: "{tmp}"; Check: Is64BitInstallMode;
#endif
#ifdef x86
Source: "..\..\Project\Builds - Beacon\Windows\Beacon\*.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows\Beacon\*.dll"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: ignoreversion recursesubdirs createallsubdirs signonce
Source: "..\..\Project\Builds - Beacon\Windows\Beacon\*"; Excludes: "*.exe,*.dll"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Files\vc_redist.x86.exe"; DestDir: "{tmp}"; Check: not Is64BitInstallMode;
Source: "Files\windows6.1-kb3140245-x86.msu"; DestDir: "{tmp}"; Check: not Is64BitInstallMode;
#endif
Source: "..\..\Artwork\BeaconDocument.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion
Source: "..\..\Artwork\BeaconIdentity.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion
Source: "..\..\Artwork\BeaconPreset.ico"; DestDir: "{app}\{#MyAppResources}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp"; ValueType: dword; ValueName: "DefaultSecureProtocols"; ValueData: 2560; OnlyBelowVersion: 6.2
Root: HKLM; Subkey: "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp"; ValueType: dword; ValueName: "DefaultSecureProtocols"; ValueData: 2560; OnlyBelowVersion: 6.2
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client"; ValueType: dword; ValueName: "DisabledByDefault"; ValueData: 0; OnlyBelowVersion: 6.2
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"; ValueType: dword; ValueName: "DisabledByDefault"; ValueData: 0; OnlyBelowVersion: 6.2

Root: HKCR; Subkey: ".beacon"; ValueData: "BeaconDocument"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconDocument"; ValueData: "{#MyAppName} Document"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconDocument\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconDocument.ico,0"; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconDocument\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKCR; Subkey: ".beaconidentity"; ValueData: "BeaconIdentity"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconIdentity"; ValueData: "{#MyAppName} Identity"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconIdentity\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconIdentity.ico,0"; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconIdentity\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKCR; Subkey: ".beaconpreset"; ValueData: "BeaconPreset"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconPreset"; ValueData: "{#MyAppName} Preset"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconPreset\DefaultIcon"; ValueData: "{app}\{#MyAppResources}\BeaconPreset.ico,0"; ValueType: string; ValueName: ""
Root: HKCR; Subkey: "BeaconPreset\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string; ValueName: ""

Root: HKCR; Subkey: "beacon"; ValueType: "string"; ValueData: "URL:Beacon"; Flags: uninsdeletekey
Root: HKCR; Subkey: "beacon"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "beacon\DefaultIcon"; ValueType: "string"; ValueData: "{app}\{#MyAppExeName},0"
Root: HKCR; Subkey: "beacon\shell\open\command"; ValueType: "string"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
#ifdef x64
Filename: "{tmp}\VC_redist.x64.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 64-bit runtime..."; Check: Is64BitInstallMode; Flags: waituntilterminated
Filename: "wusa.exe"; Parameters: "{tmp}\windows6.1-kb3140245-x64.msu /quiet /norestart"; StatusMsg: "Installing KB3140245..."; Flags: waituntilterminated; OnlyBelowVersion: 6.2; Check: Is64BitInstallMode And IsKBNeeded('KB3140245')
#endif
#ifdef x86
Filename: "{tmp}\VC_redist.x86.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 32-bit runtime..."; Check: not Is64BitInstallMode; Flags: waituntilterminated
Filename: "wusa.exe"; Parameters: "{tmp}\windows6.1-kb3140245-x86.msu /quiet /norestart"; StatusMsg: "Installing KB3140245..."; Flags: waituntilterminated; OnlyBelowVersion: 6.2; Check: not Is64BitInstallMode And IsKBNeeded('KB3140245')
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
