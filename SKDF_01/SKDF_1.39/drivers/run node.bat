@echo off
set JAVA_HOME=C:\jdk-7u67
set PATH=C:/jdk-7u67/bin;%PATH%
set freePort=
set startPort=5555
set serverIp=localhost:4444
set browsers=

set browsers=%browsers% -browser browserName=firefox,version=ANY,maxInstances=1,platform=WINDOWS
set browsers=%browsers% -browser browserName="internet explorer",version=ANY,maxInstances=1,platform=WINDOWS -Dwebdriver.ie.driver=IEDriverServer.exe
set browsers=%browsers% -browser browserName=chrome,version=ANY,platform=WINDOWS,maxInstances=1 -Dwebdriver.chrome.driver=chromedriver.exe
set browsers=%browsers% -browser browserName="MicrosoftEdge",version=ANY,maxInstances=1,platform=WINDOWS -Dwebdriver.edge.driver=WhiteDriver.exe

:SEARCH
netstat -o -n -a | find "LISTENING" | find ":%startPort% " > NUL
if "%ERRORLEVEL%" equ "0" (
  echo - port %startPort% not available
  set /a startPort +=1
  GOTO :SEARCH
) ELSE (
  echo - port %startPort% available
  set freePort=%startPort%
)
cd %~dp0
java -jar "selenium-server-standalone.jar" -role node -port %freePort% -hub http://%serverIp%/grid/register %browsers%