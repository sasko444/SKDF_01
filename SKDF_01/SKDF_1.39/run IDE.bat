@echo off
set JAVA_HOME=%~dp0\jdk-7u67
set PATH=%~dp0\jdk-7u67\bin;%PATH%
java -version
Java  -jar "SKDF_IDE.jar" ide
pause