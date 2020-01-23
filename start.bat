@echo off

:: This is the main script of EzAdbTools
:: ========================================
:: |   EzAdbTools, Made by Ricky Cheung   |
:: |      For adb and fastboot noobs      |
:: |        XDA: tiny.cc/ezatxda          |
:: ========================================

cls
goto int
title EzAdbTools

rem Selection 0 - Initialization

:int
rem Delete working.bat
if exist working.bat (
  call delworking.bat
) else if %delworkingbat%==0 (
  call delworking.bat
) else (
  rem Restart Adb
  cd bin
  adb.exe kill-server
  adb.exe start-server
  cd ..
  
  rem Empty all variables
  set M=
  set pressanykey=
  set adb_install_app=
  
  rem Set variables
  set productnamever=Ez Adb Tools 2020.1.13
  set productnamever=%productnamever:"=% 
)

rem adb.exe check
echo Checking for adb.exe...
if not exist "%rf%\bin\adb.exe" (
echo Unable to find adb.exe. Redownload this application.
choice /d y /t 2 > nul
exit
) else (
echo Found adb.exe
)

rem fastboot.exe check
echo Checking for fastboot...
if not exist "%rf%\bin\fastboot.exe" (
echo Unable to find fastboot.exe. Redownload this application.
choice /d y /t 2 > nul
exit
)
echo Found fastboot.exe
goto :menu

rem End of Selection 0 - Initialization

rem Selection 1 - Start Menu

:menu
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Start Menu
echo ==============================
echo.
echo 1 - adb related
echo 2 - fastboot related
echo X - Exit
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO adb
if %M%==2 GOTO fastboot
if %M%==X GOTO exit
if %M%==x GOTO exit
if not %M%==1 GOTO wrgintm
if not %M%==2 GOTO wrgintm
if not %M%==X GOTO wrgintm
if not %M%==x GOTO wrgintm

:wrgintm
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto menu

rem End of Selection 1 - Start Menu

rem Selection 2 - adb Related

:wrginta
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto adb

:adb
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo adb Related
echo ==============================
echo.
echo 1 - Install Application
echo 2 - Android Shell
echo 3 - Check connected devices
echo 4 - Reboot Menu
echo X - Back
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO adb_app_install
if %M%==2 GOTO adb_android_shell
if %M%==3 GOTO adb_devices
if %M%==4 GOTO adb_reboot
if %M%==X GOTO menu
if %M%==x GOTO menu
if not %M%==1 GOTO wrginta
if not %M%==2 GOTO wrginta
if not %M%==3 GOTO wrginta
if not %M%==4 GOTO wrginta
if not %M%==X GOTO wrginta
if not %M%==x GOTO wrginta

rem End of Selection 2 - adb Related

rem Selection 2.1 - Install Application

:adb_app_install
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Install Application
echo ==============================
echo.
set /P adb_install_app="Drag and drop the apk file into this window then hit enter: "
if exist %adb_install_app% (
set delworkingbat=0

rem Creating working.bat
    (
	echo cd bin
	echo adb.exe install %adb_install_app%
	echo cd ..
        echo call delworking.bat
)>"working.bat"
call working.bat
) else (
    echo Error! File doesn't exist!
	choice /d y /t 2 > nul
	goto adb_app_install
)

rem End of Selection 2.1 - Install Application

rem Selection 2.2 - Android Shell

:adb_android_shell
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Android Shell
echo ==============================
echo.
echo This will stop EzAdbTools, restart this program if you need it later.
cd bin 
call adb.exe shell

rem End of Selection 2.2 - Android Shell

rem Selection 2.3 - Check Connected Devices

:adb_devices
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Check Connected Devices
echo ==============================
echo.
echo Remember to authorize your computer before you do anything!
cd bin
adb.exe devices
cd ..
set /p pressanykey="Press any key to return to the menu..."
goto adb

rem End of Selection 2.3 - Check Connected Devices

rem Selection 2.4 - Reboot Menu

:adb_reboot
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Start Menu
echo ==============================
echo.
echo 1 - Reboot device
echo 2 - Reboot into Fastboot Mode
echo 3 - Reboot into Recovery Mode
echo 4 - Reboot into Emergency Download Mode
echo 5 - Reboot into Download Mode
echo 6 - Reboot into Safe Mode (ROOT)
echo X - Back
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO adb_reboot_device
if %M%==2 GOTO adb_reboot_fastboot
if %M%==3 GOTO adb_reboot_recovery
if %M%==4 GOTO adb_reboot_edl
if %M%==5 GOTO adb_reboot_download
if %M%==6 GOTO adb_reboot_safemode_root
if %M%==X GOTO adb
if %M%==x GOTO adb
if not %M%==1 GOTO wrgintar
if not %M%==2 GOTO wrgintar
if not %M%==3 GOTO wrgintar
if not %M%==4 GOTO wrgintar
if not %M%==5 GOTO wrgintar
if not %M%==6 GOTO wrgintar
if not %M%==X GOTO wrgintar
if not %M%==x GOTO wrgintar

:wrgintar
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_device
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot device
echo ==============================
echo.
cd bin
adb.exe reboot
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_fastboot
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot into Fastboot Mode
echo ==============================
echo.
cd bin
adb.exe reboot bootloader
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_recovery
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot into Recovery Mode
echo ==============================
echo.
cd bin
adb.exe reboot recovery
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_edl
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot into 
echo Emergency Download Mode
echo ==============================
echo.
cd bin
adb.exe reboot edl
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_download
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot into Download Mode
echo ==============================
echo.
cd bin
adb.exe reboot download
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_safemode_root
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot into Safe Mode (ROOT)
echo ==============================
echo.
cd bin
adb.exe shell su & adb.exe shell echo "1" > /data/property/persist.sys.safemode
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

rem End of Selection 2.4 - Reboot Menu

rem Selection 3 - fastboot Related

:fastboot
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo fastboot Related
echo ==============================
echo.
echo 1 - Reboot device
echo 2 - Bootloader unlocking menu
echo X - Back
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO fastboot_reboot
if %M%==2 GOTO fastboot_unlock
if %M%==X GOTO menu
if %M%==x GOTO menu
if not %M%==1 GOTO wrgintf
if not %M%==2 GOTO wrgintf
if not %M%==X GOTO wrgintf
if not %M%==x GOTO wrgintf

:wrgintf
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto fastboot

rem End of Selection 3 - fastboot Related

rem Selection 3.1 - Reboot Device

:fastboot_reboot
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot Device
echo ==============================
echo.
echo Rebooting device in fastboot mode in 5 seconds...
choice /d y /t 5 > nul
cd bin
fastboot.exe reboot
cd ..
echo Done!
choice /d y /t 2 > nul
goto fastboot

rem End of Selection 3.1 - Reboot Device

rem Selection 3.2 - Bootloader unlocking related

:fastboot_unlock
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Bootloader unlocking menu
echo ==============================
echo.
echo 1 - Bootloader Unlock Status
echo 2 - Bootloader Unlock (No code)
echo 3 - Bootloader Unlock (Code needed)
echo X - Back
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO fastboot_unlock_stat
if %M%==2 GOTO fastboot_unlock_nocode
if %M%==3 GOTO fastboot_unlock_code
if %M%==X GOTO menu
if %M%==x GOTO menu
if not %M%==1 GOTO wrgintfu
if not %M%==2 GOTO wrgintfu
if not %M%==2 GOTO wrgintfu
if not %M%==X GOTO wrgintfu
if not %M%==x GOTO wrgintfu

:wrgintfu
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto fastboot_unlock

rem End of Selection 3.2 - Bootloader unlocking related

rem Selection 3.2.1 - Bootloader Unlock Status

:fastboot_unlock_stat
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Bootloader Unlock Status
echo ==============================
echo.
echo True means unlocked, False means not unlocked
cd bin 
fastboot.exe oem device-info
cd ..
choice /d y /t 2 > nul
goto fastboot_unlock

rem End ofSelection 3.2.1 - Bootloader Unlock Status

rem Selection 3.2.2 - Bootloader Unlock (No code)

:fastboot_unlock_nocode
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Bootloader Unlock (No code)
echo ==============================
echo.
cd bin
fastboot.exe oem unlock
cd ..
echo Done!
choice /d y /t 2 > nul
goto fastboot_unlock

rem End of Selection 3.2.2 - Bootloader Unlock (No Code)

rem Selection 3.2.3 - Bootloader Unlock (Code)

:fastboot_unlock_code
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Unlock Bootloader (Code needed)
echo ==============================
echo.
set /P unlock_key="Input the code you got for unlocking your device: "
set delworkingbat=0

rem Creating working.bat
    (
	echo cd bin
	echo fastboot.exe oem-unlock %unlock_key%
	echo cd ..
        echo call delworking.bat
)>"working.bat"
call working.bat

rem End of Selection 3.2.3 - Bootloader Unlock (Code)

rem Selection 4 - Exit

:exit
cls
set M=
set pressanykey=
set adb_install_app=
set productnamever=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Exit
echo ==============================
echo.
echo Exiting in 2 seconds...
choice /d y /t 2 > nul
exit

rem End of Selection 4 - Exit
