@echo off
mode con:cols=30 lines=10
set cos=4
set czasWylogowania_w_sec=120
:start
cls
if %cos% equ 0 goto :zmienna2
color 09
set/p "Nazwa=Login:"

set "psCommand=powershell -Command "$pword = read-host 'Podaj haslo' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set haslo=%%p
)
if %Nazwa%==Admin (
if %haslo%==test123 goto :Tak
)
goto :2

:Wyl
echo Czas minol wylgowano automatycznie %czasWylogowania_w_sec%
timeout /t %czasWylogowania_w_sec%
goto :start

:2
set/a cos-=1
echo.
@echo on
@echo off
color 04
echo Bledne haslo lub login
if %cos% lss 4 echo Posiadasz jeszcze %cos% proby
pause
goto start

:Tak
echo haslo poprawne!
color 0A
pause
goto menu

:menu
mode con:cols=190 lines=90
cls
color 09
echo Sub
echo obserwacja
echo i
echo serduszko
echo.
pause>nul
goto menu