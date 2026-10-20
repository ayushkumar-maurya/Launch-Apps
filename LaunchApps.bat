@echo off

pause

set "APP_LIST=%~dp0AppList.txt"
set DELAY=3

if not exist "%APP_LIST%" (
	echo.
	echo [ERROR] App List not found!
	echo.
	pause
	exit
)

for /f "usebackq delims=" %%A in ("%APP_LIST%") do call :launch "%%A"

echo.
echo All apps are launched!
echo.
pause
exit

:launch
echo Launching: %~nx1
start "" %1
timeout /t %DELAY% /nobreak >nul
exit /b
