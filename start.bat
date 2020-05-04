@echo off
color 0a

:int
title EzAdbTools - Initialization
echo Initializing...

cd bin
adb.exe kill-server
adb.exe start-server
cd ..

set M=
set pressanykey=
set adb_install_app=
set sideload_zip=
set fastboot_flash_part=
set fastboot_flash_image=
set unlock_bin=
set unlock_key=

echo Checking for adb.exe...
if not exist "%CD%\bin\adb.exe" (
echo Unable to find adb.exe. Redownload this application.
choice /d y /t 2 > nul
exit
) else (
echo Found adb.exe
)

echo Checking for fastboot...
if not exist "%CD%\bin\fastboot.exe" (
echo Unable to find fastboot.exe. Redownload this application.
choice /d y /t 2 > nul
exit
)
echo Found fastboot.exe

goto :menu

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
echo 3 - Command Line
echo 4 - Scrcpy
echo X - Exit
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO adb
if %M%==2 GOTO fastboot
if %M%==3 GOTO cmd
if %M%==4 GOTO scrcpy
if %M%==X GOTO exit
if %M%==x GOTO exit
if %M%=show c GOTO elic
cls
title EzAdbTools - Wrong Input
cls
echo You typed a incorrect command, try again.
choice /d y /t 2 > nul
set M=
goto menu

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
echo 6 - Logcat
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
if %M%==6 GOTO adb_logcat
if %M%==X GOTO menu
if %M%==x GOTO menu
cls
title EzAdbTools - Wrong Input
cls
echo You typed a incorrect command, try again.
choice /d y /t 2 > nul
set M=
goto adb

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
echo You typed a incorrect command, try again.
choice /d y /t 2 > nul
set M=
goto adb_appman

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
    (
    echo type startprint
    echo echo Install Applications
    echo echo ==============================
	echo cd bin
	echo adb.exe install %adb_install_app%
	echo cd ..
    echo call delworking.bat
	echo cls
)>"working.bat"
call working.bat
) else (
    echo Error! File doesn't exist!
	choice /d y /t 2 > nul
	goto adb_app_install
)

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
echo You typed a incorrect command, try again.
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
adb shell su -c 'setprop persist.sys.safemode 1'
cd ..
echo Done!
choice /d y /t 2 > nul
goto adb_reboot

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
    echo call delworking.bat
	echo cls
)>"working.bat"
call working.bat

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

:adb_sideload
title EzAdbTools - Sideload flashable zip file
cls
set M=
echo.
type startprint
echo Sideload flashable zip file
echo ==============================
echo.
set /P sideload_zip="Drag and drop the flashable zip file you want to flash: "
set delworkingbat=1
    (
    echo type startprint
    echo echo Sideload flashable zip file
    echo echo ==============================
    echo cd bin
    echo adb.exe sideload %sideload_zip%
    echo cd ..
    echo call delworking.bat
    echo cls
)>"working.bat"
call working.bat

:adb_logcat
title EzAdbTools - fastboot Related
cls
set M=
echo.
type startprint
echo Logcat
echo ==============================
echo.
echo You will have to restart this application
echo to close to logcat.
pause
adb logcat

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
echo 4 - Flash image file
echo X - Back
echo.
set /P M="Input options shown above then press ENTER: "
if %M%==1 GOTO fastboot_reboot
if %M%==2 GOTO fastboot_unlock
if %M%==3 GOTO fastboot_device_id
if %M%==4 GOTO fastboot_flash
if %M%==X GOTO menu
if %M%==x GOTO menu
cls
title EzAdbTools - Wrong Input
cls
echo You typed a incorrect command, try again.
choice /d y /t 2 > nul
set M=
goto fastboot

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
echo You typed a incorrect command, try again.
choice /d y /t 2 > nul
set M=
goto fastboot_unlock

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
    (
    echo type startprint
    echo echo Unlock Bootloader (Code needed)
    echo echo ==============================
    echo cd bin
    echo fastboot.exe oem-unlock %unlock_key%
    echo cd ..
    echo call delworking.bat
    echo cls
)>"working.bat"
call working.bat

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
    (
    echo type type logo.ASART
    echo type startprint
    echo echo unlock.bin Unlock
    echo echo ==============================
    echo cd bin
    echo fastboot.exe flash unlock %unlock_bin%
    echo cd ..
    echo call delworking.bat
    echo cls
)>"working.bat"
call working.bat

:fastboot_relockbl
echo wait not yet

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

:fastboot_flash
title EzAdbTools - Flash image file
cls
echo.
type startprint
echo Flash image file
echo ==============================
echo.
set /P fastboot_flash_part="Type the partition you want to flash than press ENTER: "
set /P fastboot_flash_image="Drag and drop the image you want to flash than press ENTER: "
set delworkingbat=1
(
	echo type startprint
	echo echo unlock.bin Unlock
	echo echo ==============================
	echo echo.
	echo cd bin
	echo fastboot.exe flash %fastboot_flash_part% %fastboot_flash_image% 
	echo cd ..
	echo call delworking.bat
)>"working.bat"
call working.bat

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
taskkill /im /f adb.exe
taskkill /im /f fastboot.exe
del working.bat
exit

:cmd
title EzAdbTools - Command Line
cls
set M=
echo.
type startprint
echo Command Line
echo ==============================
echo.
echo This will EzAdbTools, do 'call eat.bat' to 
echo start this program again.
cd bin
cmd

:scrcpy
title EzAdbTools - Scrcpy
cls
set M=
echo.
type startprint
echo Scrcpy
echo ==============================
echo.
echo Launching scrcpy...
cd bin
scrcpy
cd ..
goto menu
