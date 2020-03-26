IF EXIST "%~dp0\bin" SET PATH=%PATH%;"%~dp0\bin"
title EzAdbTools - Port Recovery.img
cls
set M=
echo.
type logo.ASART
type startprint
echo Port Recovery.img
echo ==============================
echo.
set /p M="Please drag and drop recovery.img into this window: "
call unpack_img.bat recovery.img %M% 0
