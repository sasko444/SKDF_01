@echo off
set JAVA_HOME=C:\Java\jre-8u121
set PATH=C:\Java\jre-8u121\bin;%PATH%
java -version
cd %~dp0
Java -DPRJ= -DTS=TS001 -DTD=TD001 -DTAG=AutoTest001 -DTR=FF -DIP=local -jar "SKDF_IDE.jar" run
pause