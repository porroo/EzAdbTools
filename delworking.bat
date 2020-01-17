@echo off
rem ==============================
rem Ez Adb Tools
rem Script 1 - Remove working.bat
rem and call start.bat
rem ==============================
if %delworkingbat%==0 (
  echo Why are you here, if you launched this not using the start.bat,
  echo Please don't do that please!
  pause
  call start.bat
) else (
  set delworkingbat=1
  echo Removing working.bat...
  del "working.bat"
  call start.bat
)
