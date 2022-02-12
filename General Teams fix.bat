@echo off
TITLE MS Teams Common issues fix

net session >nul 2>&1
if not %errorLevel% == 0 (
	echo.
	echo ####### ERROR. ADMINISTRATOR PRIVILEGES REQUIRED #########
	echo This script must be run as administrator to work properly!  
	echo Run this script as administrator. "Run As Administrator".
	echo ##########################################################
	echo.
	pause
	exit /b 1
) else (
	echo Success. Administrative permissions confirmed.
	echo.
)
echo.
echo.
echo Performing operations. Please wait...
echo.
echo.
SET path_to_teams_cache="%userprofile%\AppData\Roaming\Microsoft\Teams\Cache"
::To hard reset Teams uncomment below line.
::SET path_to_teams_cache="%userprofile%\AppData\Roaming\Microsoft\Teams"

echo Listing teams running instances.
echo.
echo.
tasklist /fi "IMAGENAME eq Teams.exe"
echo.
echo.
SET /p input="If you see Teams.exe listed above then save and close Teams and exit Teams even from the notification area at right bottom of the screen, else this script will force close Teams and Outlook. Do you want to continue?(Press n to exit) [y/n]. "
echo.
if NOT %input%==y (
	echo.
	echo Exiting...
	echo.
	pause
	exit /b 0
)
echo.

TASKKILL /F /fi "IMAGENAME eq OUTLOOK.exe" 1>nul 2>nul
TASKKILL /F /fi "IMAGENAME eq Teams.exe" 1>nul 2>nul
TIMEOUT 3 /nobreak > nul
DEL /F /S /Q %path_to_teams_cache% > nul
echo.
echo.
echo.
echo Teams fix success!!
echo.
echo.
echo If you see Access Denied anywhere then please close teams fully or restart the pc and run again else you are good to go.
echo.
echo.
pause
echo.
echo.
