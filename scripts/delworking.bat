@echo off
rem ==============================
rem Ez Adb Tools
rem Script 1 - Remove working.bat
rem and call start.bat
rem ==============================
  echo delworkingbat
  echo ====================
  echo Removing working.bat...
  cd ..
  del "working.bat"
  set delworkingbat=0
  call start.bat
