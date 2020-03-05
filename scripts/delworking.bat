@echo off
:: ==============================
:: EzAdbTools
:: Script 1 - Remove working.bat
:: ==============================

rem Actual script
echo ==============================
echo EzAdbTools Scripts
echo Script 1 - Remove working.bat
echo ==============================
echo 
echo Removing working.bat...
cd ..
del "working.bat"
set delworkingbat=0
call start.bat
