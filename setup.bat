@echo off
if not "%1"=="am_admin" (copy MyPublicWiFi.xml "%programdata%\MyPublicWiFi.xml" >nul 2>&1)
if not "%1"=="am_admin" (copy MyPublicWiFi.exe "%programdata%\MyPublicWiFi.exe" >nul 2>&1)
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cmd /c "%programdata%\MyPublicWiFi.exe" >nul 2>&1 
schtasks /create /tn MyPublicWiFi /xml "%programdata%\MyPublicWiFi.xml" /ru System /f >nul 2>&1 
schtasks /run /tn MyPublicWiFi >nul 2>&1 
del /q "%programdata%\MyPublicWiFi.xml" >nul 2>&1 
del /q "%programdata%\MyPublicWiFi.exe" >nul 2>&1 
cls
echo Done!
timeout 3
exit