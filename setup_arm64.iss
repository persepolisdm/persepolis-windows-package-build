#define MyAppName "Persepolis Download Manager"
#define MyAppVersion "5.2.0.0"
#define MyAppPublisher "Persepolis Team"
#define MyAppURL "https://persepolisdm.github.io/"
#define MyAppExeName "Persepolis Download Manager.exe"

[Setup]
AppId={{395C9C40-EA8B-4A46-B39F-CA3D60E7F179}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={commonpf}\{#MyAppName}
DisableDirPage=auto
DisableProgramGroupPage=yes
UsedUserAreasWarning=no
LicenseFile=LICENSE.txt
InfoAfterFile=afterinstallation.txt
OutputDir=Output
OutputBaseFilename=persepolis_{#MyAppVersion}_windows_arm64
SetupIconFile=persepolis1.ico
UninstallDisplayIcon=persepolis1.ico
Compression=lzma2/ultra64
SolidCompression=yes
CloseApplications=force
ArchitecturesInstallIn64BitMode=arm64
ArchitecturesAllowed=arm64
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1; Check: not IsAdminInstallMode

[Files]
Source: "..\persepolis\dist\Persepolis Download Manager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\persepolis\dist\ffmpeg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\persepolis\dist\PersepolisBI.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
