@echo off
color 0a

:: ========================================
:: |**\EzAdbTools, Made by Ricky Cheung/**|
:: |***\__For adb and fastboot noobs__/***|
:: |****\___XDA: tiny.cc/ezatxda_____/****|
:: ========================================

:: LICENSE INFORMATION
:: --------------------
:: EzAdbTools  Copyright (C) 2020  Ricky Cheung (Tipz Team)
:: This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
:: This is free software, and you are welcome to redistribute it
:: under certain conditions; type `show c' for details.

rem Selection 0 - Initialization

:int
title EzAdbTools - Initialization
echo Initializing...

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
set root_mode=

rem Set variables
set productnamever=EzAdbTools Unstable Builds
set productnamever=%productnamever:"=%

rem Set first print
(
	echo echo ==============================
	echo echo %productnamever%
	echo echo ==============================
)>"startprint"

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
type startprint
echo Start Menu
echo ==============================
echo.
echo 1 - adb related
echo 2 - fastboot related
echo 3 - Links
echo 4 - Command Line
echo 5 - Install adb driver (Incomplete)
echo X - Exit
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb
if %M%==2 GOTO fastboot
if %M%==3 GOTO links
if %M%==4 GOTO cmd
if %M%==5 GOTO adb_driver_int
if %M%==L GOTO elic
if %M%==O GOTO lolcat
if %M%==asdf GOTO asdf
if %M%==X GOTO exit
if %M%==x GOTO exit
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto menu

rem End of Selection 1 - Start Menu

rem Selection 2 - adb Related

:adb
title EzAdbTools - adb Related
cls
set M=
echo.
type startprint
echo adb Related
echo ==============================
echo.
echo 1 - Install Application
echo 2 - Android Shell
echo 3 - Reboot Menu
echo 4 - Full Backup
echo 5 - Sideload flashable zip file
echo C - Connected devices
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb_app_install
if %M%==2 GOTO adb_root_shell_ask
if %M%==C GOTO adb_devices
if %M%==c GOTO adb_devices
if %M%==3 GOTO adb_reboot
if %M%==4 GOTO adb_full_backup
if %M%==5 GOTO adb_sideload
if %M%==X GOTO menu
if %M%==x GOTO menu
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto adb

rem End of Selection 2 - adb Related

rem Selection 2.1 - Application Manager

:adb_appman
title EzAdbTools - Application Manager
cls
echo.
type startprint
echo Application Manager
echo ==============================
echo.
echo 1 - Install Applications
echo 2 - Uninstall Applications (Incomplete)
echo 3 - List Applications
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb_app_install
if %M%==2 GOTO adb_app_uni
if %M%==3 GOTO adb_app_list
if %M%==X GOTO adb
if %M%==x GOTO adb
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto adb_appman

rem Selection 2.1.1 - Install Applications

:adb_app_install
title EzAdbTools - Install Applications
cls
echo.
type startprint
echo Install Applications
echo ==============================
echo.
set /P adb_install_app="Drag and drop the apk file into this window then hit enter: "
if exist %adb_install_app% (
set delworkingbat=1

rem Creating working.bat
    (
    echo type startprint
    echo echo Install Applications
    echo echo ==============================
	echo cd bin
	echo adb.exe install %adb_install_app%
	echo cd ..
	echo cd scripts 
    echo call delworking.bat
	echo cls
)>"working.bat"
call working.bat
) else (
    echo Error! File doesn't exist!
	choice /d y /t 2 > nul
	goto adb_app_install
)

rem End of Selection 2.1.1 - Install Applications

rem Selection 2.1.2 - Uninstall Applications

:adb_app_uni
title EzAdbTools - Uninstall Applications
cls
echo.
type startprint
echo Uninstall Applications
echo ==============================
echo.
echo Incomplete.
choice /d y /t 2 > nul
goto adb_appman

rem End of Selection 2.1.2 - Uninstall Applications

rem Selection 2.1.3 - List Applications

:adb_app_list
title EzAdbTools - List Applications
cls
echo.
type startprint
echo List Applications
echo ==============================
echo.
cd bin
adb shell pm list packages -f
cd ..
pause
goto adb_appman

rem End of Selection 2.1 - Application Manager

rem Selection 2.2 - Android Shell

rem Ask for root shell
:adb_root_shell_ask
title EzAdbTools - Android Shell
cls
echo.
type startprint
echo Android Shell
echo ==============================
echo.
echo Do you want to use Android Shell in root mode? 
echo (Root mode will only work with rooted devices)
set /P M="Select an option (Y/N): "
if %M%==Y GOTO adb_su_android_shell
if %M%==N GOTO adb_android_shell
if %M%==y GOTO adb_su_android_shell
if %M%==n GOTO adb_android_shell
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto adb_root_shell_ask

:adb_android_shell
title EzAdbTools - Android Shell
cls
echo.
type startprint
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
type startprint
echo Android Shell
echo ==============================
echo.
echo This will stop EzAdbTools, restart this program if you need it later.
cd bin 
adb.exe shell su
adb.exe shell

rem End of Selection 2.2 - Android Shell

rem Selection 2.3 - Connected devices

:adb_devices
title EzAdbTools - Connected devices
cls
echo.
type startprint
echo Connected devices
echo ==============================
echo.
echo Remember to authorize your computer before you do anything!
echo.
cd bin
adb.exe devices
cd ..
set /p pressanykey="Press any key to return to the menu..."
goto adb

rem End of Selection 2.3 - Connected devices

rem Selection 2.4 - Reboot Menu

:adb_reboot
title EzAdbTools - Reboot Menu
cls
set M=
echo.
type startprint
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
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto adb_reboot

:adb_reboot_device
title EzAdbTools - Reboot device
cls
echo.
type startprint
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
type startprint
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
type startprint
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
type startprint
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
type startprint
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
type startprint
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
type startprint
echo Full Backup
echo ==============================
echo.
echo This feature is not tested.
choice /d y /t 2 > nul
if %backupfirst%=="no" (
SET /A backuptimes=%backuptimes% + 1
) else (
SET backuptimes=1
SET backupfirst=no
set delworkingbat=1
)
    (
        echo type startprint
	echo echo Full Backup
	echo echo ==============================
	echo cd bin
	echo adb.exe backup -apk -shared -all -f %CD%/backups/backup%backuptimes%.ab
	echo cd ..
	echo cd scripts 
        echo call delworking.bat
		echo cls
)>"working.bat"
call working.bat

rem End of Selection 2.5 - Full Backup

rem Selection 2.R - Root Mode
:adb_root_mode_on
title EzAdbTools - Enable Root Mode
cls
set M=
echo.
type startprint
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
type startprint
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
    echo type startprint
    echo echo Sideload flashable zip file
    echo echo ==============================
    echo cd bin
    echo adb.exe sideload %sideload_zip%
    echo cd ..
    echo cd scripts
    echo call delworking.bat
    echo cls
)>"working.bat"
call working.bat


rem Selection 3 - fastboot Related

:fastboot
title EzAdbTools - fastboot Related
cls
set M=
echo.
type startprint
echo fastboot Related
echo ==============================
echo.
echo 1 - Reboot device
echo 2 - Bootloader unlocking related
echo 3 - Get device-id
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO fastboot_reboot
if %M%==2 GOTO fastboot_unlock
if %M%==3 GOTO fastboot_device_id
if %M%==X GOTO menu
if %M%==x GOTO menu
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto fastboot

rem End of Selection 3 - fastboot Related

rem Selection 3.1 - Reboot Device

:fastboot_reboot
title EzAdbTools - Reboot Device
cls
echo.
type startprint
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
title EzAdbTools - Bootloader unlocking related
cls
echo.
type startprint
echo Bootloader unlocking related 
echo ==============================
echo.
echo 1 - Bootloader Unlock Status
echo 2 - Bootloader Unlock (No code)
echo 3 - Bootloader Unlock (Code needed)
echo 4 - unlock.bin Unlock
echo R - Relock Bootloader
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO fastboot_unlock_stat
if %M%==2 GOTO fastboot_unlock_nocode
if %M%==3 GOTO fastboot_unlock_code
if %M%==4 GOTO fastboot_unlock_bin
if %M%==R GOTO fastboot_relockbl
if %M%==r GOTO fastboot_relockbl
if %M%==X GOTO menu
if %M%==x GOTO menu
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto fastboot_unlock

rem End of Selection 3.2 - Bootloader unlocking related

rem Selection 3.2.1 - Bootloader Unlock Status

:fastboot_unlock_stat
title EzAdbTools - Bootloader Unlock Status
cls
echo.
type startprint
echo Bootloader Unlock Status
echo ==============================
echo.
echo True means unlocked, False means not unlocked
cd bin 
fastboot.exe oem device-info
cd ..
choice /d y /t 2 > nul
goto fastboot_unlock

rem End of Selection 3.2.1 - Bootloader Unlock Status

rem Selection 3.2.2 - Bootloader Unlock (No code)

:fastboot_unlock_nocode
title EzAdbTools - Bootloader Unlock (No code)
cls
echo.
type startprint
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
set unlock_key=
cls
echo.
type startprint
echo Unlock Bootloader (Code needed)
echo ==============================
echo.
set /P unlock_key="Input the code you got for unlocking your device: "
set delworkingbat=1

rem Creating working.bat
    (
    echo type startprint
    echo echo Unlock Bootloader (Code needed)
    echo echo ==============================
    echo cd bin
    echo fastboot.exe oem-unlock %unlock_key%
    echo cd ..
    echo cd scripts
    echo call delworking.bat
    echo cls
)>"working.bat"
call working.bat

rem End of Selection 3.2.3 - Bootloader Unlock (Code)

rem Selection 3.2.4 - unlock.bin Unlock

:fastboot_unlock_bin
title EzAdbTools - unlock.bin Unlock
set unlock_bin=
cls
echo.
type startprint
echo unlock.bin Unlock
echo ==============================
echo.
set /P unlock_bin="Drag and drop the unlock.bin into our window and press ENTER: "
set delworkingbat=1

rem Creating working.bat
    (
    echo type startprint
    echo echo unlock.bin Unlock
    echo echo ==============================
    echo cd bin
    echo fastboot.exe flash unlock %unlock_bin%
    echo cd ..
    echo cd scripts
    echo call delworking.bat
    echo cls
)>"working.bat"
call working.bat

rem End of Selection 3.2.4 - unlock.bin Unlock

rem Selection 3.2.R - Relock Bootloader

:fastboot_relockbl
echo wait not yet

rem Selection 3.3 - Get device-id

:fastboot_device_id
title EzAdbTools - Get device-id
cls
echo.
type startprint
echo Get device-id
echo ==============================
echo.
cd bin
fastboot oem device-id
cd ..
pause
goto fastboot

rem End of Selection 3.3 - Get device-id

rem Selection 4 - Exit

:exit
title EzAdbTools - Exit
cls
set M=
echo.
type startprint
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
type startprint
echo Links
echo ==============================
echo.
echo 1 - XDA Thread
echo 2 - GitHub Page
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 start https://forum.xda-developers.com/android/software/tools-ezadbtools-source-simple-adb-t4033297
if %M%==2 start https://github.com/TipzTeam/EzAdbTools
if %M%==X GOTO menu
if %M%==x GOTO menu
cls
title EzAdbTools - Wrong Input
cls
echo You have inputted a wrong input, try again.
choice /d y /t 2 > nul
set M=
goto links

rem End of Selection 5 - Links

rem Selection 6 - Command Line

:cmd
title EzAdbTools - Command Line
cls
set M=
echo.
type startprint
echo Command Line
echo ==============================
echo.
echo This will EzAdbTools, do 'call eat.bat' to start this program again.
cd bin
cmd
rem End of Selection 6 - Command Line

rem Selection O - Others

:elic
cls
echo.
type startprint
echo LICENSE
echo ==============================
type LICENSE
echo Press to go back to menu.
pause
goto menu

:lolcat
title Seay Adbe Thing - Start List
cls
set M=
echo.
echo ==============================
echo Seay Adbe Thing
echo ==============================
echo Start List
echo ==============================
echo.
echo 1 - Adbe
echo 2 - fix your magic thing on your hand
echo 3 - things that make you go to stuff
echo 4 - magic monitor
echo 5 - put thing that loads your magic handtool
echo X - bye
echo.
set /P M="=Just use the typey thing to entur stuff: "
if %M%==1 GOTO lolcatrep
if %M%==2 GOTO lolcatrep
if %M%==3 GOTO lolcatrep
if %M%==4 GOTO lolcatrep
if %M%==5 GOTO lolcatrep
if %M%==O GOTO menu
if %M%==X GOTO lolcatrep
if %M%==x GOTO lolcatrep
cls
title Seay Adbe Thing - Not corrext stuff
cls
echo You have destoryed your typer, buy a new one lol.
choice /d y /t 2 > nul
set M=
goto lolcat

:lolcatrep
title Seay Adbe Thing - lol
cls
echo say lol
choice /d y /t 2 > nul
goto :lolcat

rem End of Selection O - Others

rem Driver Instller
:adb_driver_int
echo Incomplete feature.
cd bin
cd drivers
pnputil -i -a android_winusb.inf
pause
goto menu

rem asdf
:asdf
echo Mine turtle will expload on your pc lol 
choice /d y /t 2 > nul
goto menu
