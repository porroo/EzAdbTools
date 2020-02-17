@echo off
:: ==============================
:: Ez Adb Tools
:: Script 1 - Remove working.bat
:: ==============================
  echo delworkingbat
  echo ====================
  echo Removing working.bat...
  cd ..
  del "working.bat"
  set delworkingbat=0
  call start.bat
