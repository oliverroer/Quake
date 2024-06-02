@echo off
setlocal
cd /D "%~dp0"

call .\clean.bat

mkdir bin
call cl .\src\main.c /Z7 /Od /Fe".\bin\main.exe" /Fo".\bin\main.o" /link user32.lib
