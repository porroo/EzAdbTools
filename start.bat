@echo off
:: Notes
rem Added colors!
color 0c

:: This is the main script of EzAdbTools
:: ========================================
:: |   EzAdbTools, Made by Ricky Cheung   |
:: |      For adb and fastboot noobs      |
:: |        XDA: tiny.cc/ezatxda          |
:: ========================================

cls
goto int

rem Selection 0 - Initialization

:int
title EzAdbTools - Initialization
echo Initializing...

rem Delete working.bat
if exist working.bat goto delworking

rem Restart Adb
cd bin
adb.exe kill-server
adb.exe start-server
cd ..

rem Empty all variables
set M=
set pressanykey=
set adb_install_app=
set sideload_zip=
set backupfirst=
set backuptimes=
set root_mode=
set sideload_zip=

rem Set variables
set productnamever=EzAdbTools Unstable Builds
set productnamever=%productnamever:"=% 

rem adb.exe check
echo Checking for adb.exe...
if not exist "%CD%\bin\adb.exe" (
echo Unable to find adb.exe. Redownload this application.
choice /d y /t 2 > nul
exit
) else (
echo Found adb.exe
)

rem fastboot.exe check
echo Checking for fastboot...
if not exist "%CD%\bin\fastboot.exe" (
echo Unable to find fastboot.exe. Redownload this application.
choice /d y /t 2 > nul
exit
)
echo Found fastboot.exe
goto :menu

rem End of Selection 0 - Initialization

rem Selection 1 - Start Menu

:menu
title EzAdbTools - Start Menu
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
echo 3 - Links
echo 4 - Command Line
echo X - Exit
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb
if %M%==2 GOTO fastboot
if %M%==3 GOTO links
if %M%==4 GOTO cmd
if %M%==L GOTO elic
if %M%==X GOTO exit
if %M%==x GOTO exit
if not %M%==1 GOTO wrgintm
if not %M%==2 GOTO wrgintm
if not %M%==3 GOTO wrgintm
if not %M%==X GOTO wrgintm
if not %M%==x GOTO wrgintm

:wrgintm
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto menu

rem End of Selection 1 - Start Menu

rem Selection 2 - adb Related

:wrginta
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto adb

:adb
title EzAdbTools - adb Related
cls
if %root_mode%==1 goto adb_root_mode
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
echo 5 - Full Backup
echo 6 - Sideload flashable zip file
echo R - Enable Root Mode
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb_app_install
if %M%==2 GOTO adb_root_shell_ask
if %M%==3 GOTO adb_devices
if %M%==4 GOTO adb_reboot
if %M%==5 GOTO adb_full_backup
if %M%==6 GOTO adb_sideload
if %M%==R GOTO adb_root_mode_on
if %M%==r GOTO adb_root_mode_on
if %M%==X GOTO menu
if %M%==x GOTO menu
if not %M%==1 GOTO wrginta
if not %M%==2 GOTO wrginta
if not %M%==3 GOTO wrginta
if not %M%==4 GOTO wrginta
if not %M%==5 GOTO wrginta
if not %N%==6 GOTO wrginta
if not %M%==R GOTO wrginta
if not %M%==r GOTO wrginta
if not %M%==X GOTO wrginta
if not %M%==x GOTO wrginta

:adb
title EzAdbTools - adb Related
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo adb Related (Root Mode)
echo ==============================
echo.
echo 1 - Application Manager
echo 2 - Android Shell
echo 3 - Check connected devices
echo 4 - Reboot Menu
echo 5 - Full Backup
echo R - Disable Root Mode
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb_appman
if %M%==2 GOTO adb_root_shell_ask
if %M%==3 GOTO adb_devices
if %M%==4 GOTO adb_reboot
if %M%==5 GOTO adb_full_backup
if %M%==R GOTO adb_root_mode_off
if %M%==r GOTO adb_root_mode_off
if %M%==X GOTO menu
if %M%==x GOTO menu
if not %M%==1 GOTO wrginta
if not %M%==2 GOTO wrginta
if not %M%==3 GOTO wrginta
if not %M%==4 GOTO wrginta
if not %M%==5 GOTO wrginta
if not %M%==R GOTO wrginta
if not %M%==r GOTO wrginta
if not %M%==X GOTO wrginta
if not %M%==x GOTO wrginta

rem End of Selection 2 - adb Related

rem Selection 2.1 - Install Application

:adb_appman
title EzAdbTools - Application Manager
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Application Manager
echo ==============================
echo.
echo 1 - Install Application
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb_app_install
if %M%==X GOTO adb
if %M%==x GOTO adb
if not %M%==1 GOTO wrgintaam
if not %M%==X GOTO wrgintaam
if not %M%==x GOTO wrgintaam

:wrgintaam
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto adb_appman

:adb_app_install
title EzAdbTools - Install Application
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
set delworkingbat=1

rem Creating working.bat
    (
        echo echo ==============================
        echo echo %productnamever%
        echo echo ==============================
        echo echo Install Application
        echo echo ==============================
	echo cd bin
	echo adb.exe install %adb_install_app%
	echo cd ..
	echo cd scripts 
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

rem Ask for root shell
:adb_root_shell_ask
title EzAdbTools - Android Shell
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Android Shell
echo ==============================
echo.
echo Do you want to use Android Shell in root mode?
set /P M="Select an option (Y/N): "
if %M%==Y GOTO adb_su_android_shell
if %M%==N GOTO adb_android_shell
if %M%==y GOTO adb_su_android_shell
if %M%==n GOTO adb_android_shell
if not %M%==Y GOTO wrgintas
if not %M%==N GOTO wrgintas
if not %M%==y GOTO wrgintas
if not %M%==n GOTO wrgintas

:wrgintas
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto adb_root_shell_ask

:adb_android_shell
title EzAdbTools - Android Shell
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
adb.exe shell

:adb_su_android_shell
title EzAdbTools - Android Shell
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
adb.exe shell su
adb.exe shell

rem End of Selection 2.2 - Android Shell

rem Selection 2.3 - Check Connected Devices

:adb_devices
title EzAdbTools - Check Connected Devices
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
title EzAdbTools - Reboot Menu
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Reboot Menu
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
set /P M="Input options shown above then press ENTER: "
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
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto adb_reboot

:adb_reboot_device
title EzAdbTools - Reboot device
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
title EzAdbTools - Reboot into Fastboot Mode
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
title EzAdbTools - Reboot into Recovery Mode
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
title EzAdbTools - Reboot into Emergency Download Mode
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
title EzAdbTools - Reboot into Download Mode
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
title EzAdbTools - Reboot into Safe Mode (ROOT)
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

rem Selection 2.5 - Full Backup

:adb_full_backup
title EzAdbTools - Full Backup
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Full Backup
echo ==============================
echo.
echo This feature is not tested.
choice /d y /t 2 > nul
if %backupfirst%=="yes" (
SET backuptimes=1
SET backupfirst=no
set delworkingbat=1
) else if %backupfirst%=="no" (
SET /A backuptimes=%backuptimes% + 1
)
    (
        echo echo ==============================
        echo echo %productnamever%
        echo echo ==============================
	echo cd bin
	echo adb.exe backup -apk -shared -all -f %CD%/backups/backup%backuptimes%.ab
	echo cd ..
	echo cd scripts 
        echo call delworking.bat
)>"working.bat"
call working.bat

rem End of Selection 2.5 - Full Backup

rem Selection 2.R - Root Mode
:adb_root_mode_on
title EzAdbTools - Enable Root Mode
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Enable Root Mode
echo ==============================
echo.
cd bin
adb.exe root
cd ..
set root_mode=1
echo Root mode is enabled.
choice /d y /t 3 > nul

:adb_root_mode_off
title EzAdbTools - Disable Root Mode
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Disable Root Mode
echo ==============================
echo.
cd bin
adb.exe unroot
cd ..
set root_mode=0
echo Root mode is disabled.
choice /d y /t 3 > nul

rem End of Selection 2.R - Root Mode

rem Selection 2.6 - Sideload
:adb_sideload
title EzAdbTools - Sideload flashable zip file
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Sideload flashable zip file
echo ==============================
echo.
set /P sideload_zip="Drag and drop the flashable zip file you want to flash: "
set delworkingbat=1

rem Creating working.bat
    (
        echo echo ==============================
        echo echo %productnamever%
        echo echo ==============================
        echo echo Sideload flashable zip file
        echo echo ==============================
	echo cd bin
	echo adb.exe sideload %sideload_zip%
	echo cd ..
        echo call delworking.bat
)>"working.bat"
call working.bat


rem Selection 3 - fastboot Related

:fastboot
title EzAdbTools - fastboot Related
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
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO fastboot_reboot
if %M%==2 GOTO fastboot_unlock
if %M%==X GOTO menu
if %M%==x GOTO menu
if not %M%==1 GOTO wrgintf
if not %M%==2 GOTO wrgintf
if not %M%==X GOTO wrgintf
if not %M%==x GOTO wrgintf

:wrgintf
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto fastboot

rem End of Selection 3 - fastboot Related

rem Selection 3.1 - Reboot Device

:fastboot_reboot
title EzAdbTools - Reboot Device
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
title EzAdbTools - Bootloader unlocking menu
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
set /P M="Input options shown above then press ENTER: "
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
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
goto fastboot_unlock

rem End of Selection 3.2 - Bootloader unlocking related

rem Selection 3.2.1 - Bootloader Unlock Status

:fastboot_unlock_stat
title EzAdbTools - Bootloader Unlock Status
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
title EzAdbTools - Bootloader Unlock (No code)
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

rem Selection 3.2.3 - Bootloader Unlock (Code needed)

:fastboot_unlock_code
title EzAdbTools - Bootloader Unlock (Code needed)
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Unlock Bootloader (Code needed)
echo ==============================
echo.
set /P unlock_key="Input the code you got for unlocking your device: "
set delworkingbat=1

rem Creating working.bat
    (
        echo echo ==============================
        echo echo %productnamever%
        echo echo ==============================
        echo echo Unlock Bootloader (Code needed)
        echo echo ==============================
	echo cd bin
	echo fastboot.exe oem-unlock %unlock_key%
	echo cd ..
        echo call delworking.bat
)>"working.bat"
call working.bat

rem End of Selection 3.2.3 - Bootloader Unlock (Code)

rem Selection 4 - Exit

:exit
title EzAdbTools - Exit
cls
set M=
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

rem Selection 5 - Links
:links
title EzAdbTools - Links
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Links
echo ==============================
echo.
echo 1 - XDA Thread
echo 2 - GitHub Page
echo X - Exit
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 start https://forum.xda-developers.com/android/software/tools-ezadbtools-source-simple-adb-t4033297
if %M%==2 start https://github.com/TipzTeam/EzAdbTools
if %M%==X GOTO exit
if %M%==x GOTO exit
if not %M%==1 GOTO wrgintm
if not %M%==2 GOTO wrgintm
if not %M%==3 GOTO wrgintm
if not %M%==X GOTO wrgintm
if not %M%==x GOTO wrgintm

rem End of Selection 5 - Links

rem Selection 6 - Command Line

title EzAdbTools - Start Menu
cls
set M=
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo Command Line
echo ==============================
echo.
echo This will EzAdbTools, do 'call eat.bat' to start this program again.
cd bin
cmd

rem Selection O - Others

:delworking
cd scripts 
call delworking.bat

:elic
cls
echo.
echo ==============================
echo %productnamever%
echo ==============================
echo LICENSE
echo ==============================
type LICENSE
pause
goto menu

rem End of Selection O - Others
