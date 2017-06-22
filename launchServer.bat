:: =====================================
:: ==== Launch Arma3 Server Instance ====
:: ==== Author: Mark Chang
:: ==== Author Email: acidburn11@me.com
:: ==== License: MIT License
:: =====================================

:: Echo Code for Debug - default off
@ECHO off

:: Window Title
TITLE Launch Arma3Server Instance

:: All Parameters are in local scope
SETLOCAL
:: Clear Screen
cls

:: General Params (can be replaced with userInput for more generic script)
set version=0.0.1
set instanceName=Arma3 Campaign Server
set installRootDir=C:\Arma3Server
set serverName=Campaign_Server
set gamePort=2302

:: Additional Startup Params
set "startupParams=-filePatching -netlog -hugePages -maxMem=10240 -noSound -cpuCount=4"

:: Modlist (Copy paste from generated TADST Config)
set "modList=curator;kart;mark;heli;jets;C:\Arma3ServerMods\@CBA_A3;C:\Arma3ServerMods\@ace;C:\Arma3ServerMods\@acex;C:\Arma3ServerMods\@AdvancedSlingLoading;C:\Arma3ServerMods\@bzly_no_bluf_radio;C:\Arma3ServerMods\@blastcore;C:\Arma3ServerMods\@CUP_Terrains_Core;C:\Arma3ServerMods\@task_force_radio;C:\Arma3ServerMods\@3cb_baf_equipment;C:\Arma3ServerMods\@3cb_baf_weapons;C:\Arma3ServerMods\@3cb_baf_vehicles;C:\Arma3ServerMods\@CUP_Terrains_Maps;C:\Arma3ServerMods\@TRYK;C:\Arma3ServerMods\@expbg_media;C:\Arma3ServerMods\@expbg_misc;C:\Arma3ServerMods\@expbg_tfar_labels_a3;C:\Arma3ServerMods\@expbg_equipment;C:\Arma3ServerMods\@expbg_weapons_pack;C:\Arma3ServerMods\@expbg_baf_units;C:\Arma3ServerMods\@immerse;C:\Arma3ServerMods\@immersioncigs;C:\Arma3ServerMods\@tfw_radios;C:\Arma3ServerMods\@expbg_vehicles;C:\Arma3ServerMods\@expbg_factions;C:\Arma3ServerONLYMods\@expbg_scripts"

:: Go to the Arma3Server Root Directory
:: allows to drop the batch file anywhere on the server
cd %installRootDir%

:observer
echo (%time%) %instanceName% started.
:: Launch Instance
start "%instanceName%" /wait /high "arma3server_x64.exe" -port=%gamePort% "-config=%installRootDir%\TADST\%serverName%\TADST_config.cfg" "-cfg=%installRootDir%\TADST\%serverName%\TADST_basic.cfg" "-profiles=%installRootDir%\TADST\Campaign_Server" -name=%serverName% %startupParams% "-mod=%modList%"
:: If server instance crashed or closed
:: Window needs to stay open for it to work
echo (%time%) %instanceName% closed or crashed, restarting.
goto observer

:exit_script
echo "Exiting Script!"
ENDLOCAL
TIMEOUT /t 5
GOTO :EOF
