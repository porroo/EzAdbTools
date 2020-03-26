IF EXIST "%~dp0\bin" SET PATH=%PATH%;"%~dp0\bin"
title EzAdbTools - Port Boot.img
cls
set M=
echo.
type logo.ASART
type startprint
echo Port Boot.img
echo ==============================
echo.
set /p M="Please drag and drop recovery.img into this window: "
call unpack_img.bat boot.img %M% 0
