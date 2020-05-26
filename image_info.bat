@echo off
cd "%~dp0"
IF EXIST "%~dp0\bin" SET PATH=%PATH%;"%~dp0\bin"
Setlocal EnableDelayedExpansion
if "%~1" == "" goto noinput
set "file=%~nx1"
echo(
cecho Display the informations for{0E} %file%{#}.{\n}
echo(
imageinfo %file%
echo(
echo(
cecho Done. All informations are saved in{0E} %~n1.img-infos.txt{#}.{\n}
goto end
:noinput
echo(
echo(
cecho {0C}No image file selected. Exit script.{#}{\n}
echo(
echo(
:end
