@ECHO OFF

:choice
set /P c=Are you sure you want to continue[Y/N]?
if /I "%c%" EQU "Y" goto :gotonext
if /I "%c%" EQU "N" goto :gotono
goto :choice

:gotonext

set /P inp=(Insert Here Randoom Trigger event (Example: yourservername)
goto :IronShield

:gotono

echo "Operation cancelled! bye bye "
pause
exit

:IronShield
replace.py "QBCore:Server:Additem" "QBCore:Server:Add%inp%item"
