:: =====================================
:: ==== Launch Arma3 Server Instance ====
:: ==== Author: Mark Chang
:: ==== Author Email: acidburn11@me.com
:: ==== License: MIT License
:: =====================================

:: Echo Code for Debug - default off
@ECHO off

:: All Parameters are in local scope
SETLOCAL
cls

:: Window Title
TITLE Launch Arma3Server Instance

:: General Params
:: Adjust below Params or use Input
set scriptVersion=0.0.1
set gamePort=2302
set instanceName=Arma3 Public Server
set "installRootDir=C:\Arma3Server"
:: Sets executable either normal or new 64bit
:: Default: arma3server.exe
:: 64-bit Version: arma3server_x64.exe
set arma3Exec=arma3server_x64.exe
:: No spaces in serverName!
set serverName=Public_Server

:: Paths to Profile, Server Config, Network Config
set pathToProfile=%installRootDir%\TADST\%serverName%
set pathToConfig=%installRootDir%\TADST\%serverName%\TADST_config.cfg
set pathToNetworkConfig=%installRootDir%\TADST\%serverName%\TADST_basic.cfg

:: Additional Startup Params
set "startupParams=-filePatching -netlog -hugePages -maxMem=10240 -noSound -cpuCount=4"

:: Modlist (Copy paste from generated TADST Config)
set "modList=curator;kart;mark;heli;jets;C:\Arma3ServerMods\@CBA_A3"

:: ============================
:: ==== DO NOT EDIT BELOW =====
:: ============================

:: Check if Server was installed
if not exist "%installRootDir%\%arma3Exec%" ^
GOTO :exit_script

:: Go to the Arma3Server Root Directory
:: allows to drop the batch file anywhere on the server
cd %installRootDir%

:: Observer of executable
:observer
cls
echo (%time%) %instanceName% started.

:: Launch Instance
start "%instanceName%" /wait /high "arma3Exec" -port=%gamePort% "-config=%pathToConfig%" "-cfg=%pathToNetworkConfig%" "-profiles=%pathToProfile%" -name=%serverName% %startupParams% "-mod=%modList%"

:: If server instance crashed or closed
:: Window needs to stay open for it to work
echo (%time%) %instanceName% closed or crashed, restarting.
goto observer

:exit_script
echo "Exiting Script!"
ENDLOCAL
TIMEOUT /t 5
GOTO :EOF
