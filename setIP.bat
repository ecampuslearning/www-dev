@echo off

::Check for command line options! If there is one, just set it as IP.

set dhcp=0
::Otherwise, :setIP's conditional will fail.
if "%~1" equ "" goto choice
echo Ok! Setting that IP.
set ipaddy="%~1"
goto setIP

::Ok, give user the menu since there's no cl arguments.

:choice
echo Hi! What IP scheme do you want me to set?
echo. 
echo [A] DHCP
echo [B] Oce (actually Laptop, 134.188.254.101)
echo [C] Canon's default fixed IP (172.16.1.50)
echo [D] Set your own static IP
echo. 

choice /C abcd /m "Pick one:"

if %errorlevel% equ 1 goto dhcp
if %errorlevel% equ 2 goto oce
if %errorlevel% equ 3 goto canon
if %errorlevel% equ 4 goto customstatic

:dhcp
echo Ok! DHCP it is.
set dhcp=1
echo Give me a sec for it to take..
goto setIP


:oce
echo Ok! Oce "laptop" scheme it is then.
set ipaddy="134.188.254.101 255.255.255.0 134.188.254.1"
goto setIP


:canon
echo Ok! Canon fixed IP mode it is, then.
set ipaddy="172.16.1.150 255.255.255.0 172.16.1.1"
goto setIP

:customstatic
echo Ok! Setting a custom static IP.
echo.
echo Give me an IP address.
set /P ipaddy=
goto setIP


:setIP
::If they said DHCP, do that, otherwise set a static.
if %dhcp% equ 1 (
netsh interface ipv4 set address name="Ethernet" dhcp
goto end
) else (
::Look, we can strip out quotations with sort of a lambda, %var:"=% !
netsh interface ipv4 set address name="Ethernet" static %ipaddy:"=%
goto end
)

:end
::First, stuff common to setting any IP.
timeout /t 7
ipconfig
echo.
echo Here you go!
echo.

:: If we invoked from command line, goto eof, otherwise exit instead.
if not "%~1" equ "" (
goto:eof 
)
:: Don't actually need an 'else' clause here; if user supplied a command line 
:: parameter, we've exited to eof, and if not, always do the following anyway.
echo Press any key to exit.
echo.
pause
exit