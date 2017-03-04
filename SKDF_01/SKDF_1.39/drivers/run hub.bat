@echo off
set JAVA_HOME=C:\jdk-7u67
set PATH=C:\jdk-7u67/bin;%PATH%
cd %~dp0
java -jar "selenium-server-standalone.jar" -role hub -port 4444