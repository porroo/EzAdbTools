@echo off
cls
goto int

rem Selection 0 - Initialization

rem Restart Adb
adb kill-server
adb start-server

rem Empty all variables
set M=""
set pressanykey=""
set adb_install_app=""

rem End of Selection 0 - Initialization

rem Selection 1 - Start Menu
:menu
cls
set M=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.11
echo ==============================
echo Start Menu
echo ==============================
echo.
echo 1 - Adb related
echo 2 - Fastboot related
echo X - Exit
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO adb
if %M%==2 GOTO fastboot
if %M%==X GOTO exit
if not %M%==1 GOTO wrgintm
if not %M%==2 GOTO wrgintm
if not %M%==X GOTO wrgintm

:wrgintm
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto menu

rem End of Selection 1 - Start Menu

rem Selection 2 - Adb Related
:wrginta
cls
echo You have entered a wrong input, try again.
choice /d y /t 2 > nul
goto adb

:adb
cls
set M=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Adb Related
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
if %M%==X GOTO exit
if not %M%==1 GOTO wrginta
if not %M%==2 GOTO wrginta
if not %M%==3 GOTO wrginta
if not %M%==4 GOTO wrginta
if not %M%==X GOTO wrginta

rem Selection 2.1 - Install Application

:adb_app_install
cls
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Install Application
echo ==============================
echo.
set /P adb_install_app="Drag and drop the apk file in this window then hit enter: "
if exist %adb_install_app% (
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
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Android Shell
echo ==============================
echo.
echo This will stop EzAdbTools, restart this program if you need it.
cd bin 
call adb.exe shell

rem End of Selection 2.2 - Android Shell

rem Selection 2.3 - Check Connected Devices

:adb_devices
cls
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
set M=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
if not %M%==1 GOTO wrgintm
if not %M%==2 GOTO wrgintm
if not %M%==3 GOTO wrgintm
if not %M%==4 GOTO wrgintm
if not %M%==5 GOTO wrgintm
if not %M%==6 GOTO wrgintm
if not %M%==X GOTO wrgintm

:adb_reboot_device
cls
set pressanykey=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
set pressanykey=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
set pressanykey=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
set pressanykey=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
set pressanykey=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
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
set pressanykey=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Reboot into Safe Mode (ROOT)
echo ==============================
echo.
cd bin
adb.exe shell echo "1" > /data/property/persist.sys.safemode
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

rem End of Selection 2.4 - Reboot Menu

rem Selection 3 - Fastboot Related

:fastboot
cls
set M=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Fastboot Related
echo ==============================
echo.
echo 1 - Reboot device
echo X - Back
echo.
set /P M="Type options on screen then press ENTER: "
if %M%==1 GOTO fastboot_reboot
if %M%==X GOTO adb
if not %M%==1 GOTO wrgintm
if not %M%==X GOTO wrgintm

rem End of Selection 3 - Fastboot Related

rem Selection 3.1 - Reboot Device
cls
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Reboot Device
echo ==============================
echo.
echo Rebooting device in fastboot mode in 5 seconds...
choice /d y /t 5 > nul
fastboot reboot
echo Done!
choice /d y /t 2 > nul
goto fastboot

rem End of Selection 3.1 - Reboot Device

rem Selection 4 - Exit

cls
set M=""
set pressanykey=""
set adb_install_app=""
echo.
echo ==============================
echo Ez Adb Tools 2020.1.0
echo ==============================
echo Exit
echo ==============================
echo.
echo Exiting in 2 seconds...
choice /d y /t 2 > nul
exit

rem End od Selection 4 - Exit
