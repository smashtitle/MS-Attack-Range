New-Item -ItemType Directory -Force -Path C:\Temp;
New-Item -ItemType Directory -Force -Path C:\MonitorTools\Sysmon;
iwr -Uri https://download.sysinternals.com/files/Sysmon.zip -OutFile C:\Temp\Sysmon.zip;
Expand-Archive -Path C:\Temp\Sysmon.zip -DestinationPath C:\MonitorTools\Sysmon -Force;
iwr -Uri https://raw.githubusercontent.com/smashtitle/sysmon-modular/refs/heads/master/sysmonconfig-research.xml -OutFile C:\MonitorTools\Sysmon\sysmonconfig-research.xml;

iwr -Uri https://raw.githubusercontent.com/smashtitle/EventLog-Baseline-Guide/refs/heads/main/bat/ASD-Servers.bat -OutFile C:\Temp\ASD-Servers.bat;
Start-Process -FilePath "C:\Temp\ASD-Servers.bat" -Wait

iwr -Uri https://github.com/zeronetworks/rpcfirewall/archive/refs/heads/master.zip -OutFile C:\Temp\rpcfirewall.zip;
Expand-Archive C:\Temp\rpcfirewall.zip -DestinationPath C:\MonitorTools -Force; 
iwr -Uri https://raw.githubusercontent.com/zeronetworks/rpcfirewall/master/Configuration_templates/RpcFw.conf.AuditOnly -OutFile C:\MonitorTools\rpcfirewall-master\RpcFw.conf;
& 'C:\MonitorTools\rpcfirewall-master\RpcFwManager.exe' /install fw;

iex (Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/oloruntolaallbert/public/refs/heads/main/ConfigureWinRM.ps1").Content
