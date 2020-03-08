 $srvName = "Tomcat8"
$servicePrior = Get-Service $srvName
"$srvName is now " + $servicePrior.status
Stop-Service $srvName
$serviceAfter = Get-Service $srvName
Set-Service $srvName -startuptype disabled
"$srvName is now " + $serviceAfter.status
   Remove-Item C:\lakshman\apache-tomcat-8.5.51\webapps\helloworld-1.0-SNAPSHOT.war -Recurse -Force
   Write-Host "remove existing war file"
   Copy-Item "C:\Windows\system32\config\systemprofile\.m2\repository\com\example\helloworld\1.0-SNAPSHOT\helloworld-1.0-SNAPSHOT.war" "C:\lakshman\apache-tomcat-8.5.51\webapps"
   Write-Host "deploy new war file"
   $srvName = "Tomcat8"
$servicePrior = Get-Service $srvName
"$srvName is now " + $servicePrior.status
Set-Service $srvName -startuptype manual
Start-Service $srvName
$serviceAfter = Get-Service $srvName
"$srvName is now " + $serviceAfter.status