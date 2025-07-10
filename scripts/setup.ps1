iwr -Uri "https://raw.githubusercontent.com/oloruntolaallbert/public/refs/heads/main/ConfigureWinRM.ps1" -OutFile "C:\Windows\Temp\ConfigureWinRM.ps1";
& "C:\Windows\Temp\ConfigureWinRM.ps1";
Set-MpPreference -DisableRealtimeMonitoring $true;
Set-MpPreference -DisableIOAVProtection $true;
Set-MpPreference -DisableBehaviorMonitoring $true;
Set-MpPreference -PUAProtection 0;
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f;
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f;
Add-MpPreference -ExclusionPath "C:\Tools";

New-Item -ItemType Directory -Force -Path "C:\Windows\Temp" ;
New-Item -ItemType Directory -Force -Path "C:\Tools\Sysmon";
iwr -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "C:\Windows\Temp\Sysmon.zip";
Expand-Archive -Path "C:\Windows\Temp\Sysmon.zip" -DestinationPath "C:\Tools\Sysmon" -Force;
iwr -Uri "https://raw.githubusercontent.com/smashtitle/sysmon-modular/refs/heads/master/sysmonconfig-with-filedelete.xml" -OutFile "C:\Tools\Sysmon\sysmonconfig-research.xml";
iwr -Uri "https://raw.githubusercontent.com/smashtitle/sysmon-modular/refs/heads/master/sysmon-null.xml" -OutFile "C:\Tools\Sysmon\sysmonconfig-null.xml";


iwr -Uri "https://raw.githubusercontent.com/smashtitle/EventLog-Baseline-Guide/refs/heads/main/bat/ASD-Servers.bat" -OutFile "C:\Windows\Temp\ASD-Servers.bat";
Start-Process -FilePath "C:\Windows\Temp\ASD-Servers.bat" -Wait;

iwr -Uri "https://github.com/zeronetworks/rpcfirewall/releases/download/v2.2.5/RPCFW_2.2.5.zip" -OutFile "C:\Windows\Temp\rpcfirewall.zip";
Expand-Archive "C:\Windows\Temp\rpcfirewall.zip" -DestinationPath "C:\Tools" -Force; 
iwr -Uri "https://raw.githubusercontent.com/zeronetworks/rpcfirewall/master/Configuration_templates/RpcFw.conf.AuditOnly" -OutFile "C:\Tools\RPCFW_2.2.5\RpcFw.conf";
copy "C:\Tools\RPCFW_2.2.5\rpcFireWall.dll" "C:\Windows\System32\rpcFireWall.dll";
copy "C:\Tools\RPCFW_2.2.5\rpcMessages.dll" "C:\Windows\System32\rpcMessages.dll";
& "C:\Tools\RPCFW_2.2.5\rpcFwManager.exe" /install fw;
iwr -Uri "https://www.python.org/ftp/python/3.13.5/python-3.13.5-amd64.exe" -OutFile "C:\Windows\Temp\python-3.13.5-amd64.exe";
Start-Process -FilePath "C:\Windows\Temp\python-3.13.5-amd64.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
