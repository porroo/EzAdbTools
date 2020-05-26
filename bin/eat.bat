@echo off
:: ==============================
:: EzAdbTools
:: Script 2 - Start batch script
:: after using the command line
:: ==============================
echo Restarting EzAdbTools...
choice /d y /t 2 > nul
adb kill-server
cd ..
call start.bat
