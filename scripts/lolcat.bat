:lolcat
title Seay Adbe Thing - Star Lis
cls
set M=
echo.
type logo.ASART
echo Seay Adbe Thing
echo ==============================
echo Star Lis
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
