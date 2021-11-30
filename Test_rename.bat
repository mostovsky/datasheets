@echo off
REM =======
:: WinAVR path-fail fix
set "path=C:\windows\;%path%"
set "path=%system32%;%path%"
set "path=%windir%\System32\;%path%"
::echo "path=%windir%\System32\;%path%"
REM =======
echo started in %DATE%_%TIME%
pause
REM verify other 2>nul & setlocal enableextensions & if errorlevel 1 ( echo. & echo Status: Vcliuchenie rasshirenii` komandnogo protcessora nevozmozhno ) else ( echo. & echo Status: OK with expansion )

set "to_replace=RELAY_2ch"
set "to_find=RELAY_2p"

if not "%~1"=="" (	set "to_find=%~1" & echo 1 not empty ) else ( echo FUUUCK because 1 is empty and goto end &	goto :ENDING )
if not "%~2"=="" ( set "to_replace=%~2" & echo 2 not empty ) else ( echo FUUUCK because 2 is empty and goto end && goto :ENDING )
if "%~1"=="%~2" ( echo FUUUCK and goto end because 1 and 2 is equal && GOTO :ENDING ) else echo 1 and 2 not equal, we continuing

cd /d "%~dp0"
echo Path="%~dp0"

echo. && echo to_find_old="%to_find%" & echo to_replace_old="%to_replace%"

REM pause
REM pause

for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find%" /c') do (if "%%i"=="0" (echo. && echo Nothing_founded ) else (echo. && echo Something founded [%%i] ))

REM cls
setlocal enabledelayedexpansion
echo.
echo.

for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%"') do (
echo. & echo.
echo Founded "%%i"
echo.
set "asd=%%i"
REM call echo ren "%%asd%%" "%%asd:%to_find%=%to_replace%%%"

REM echo on
call set "new_name=%%asd:%to_find%=%to_replace%%%"
echo Rename now
echo "%%i" && echo. && echo to && echo. && echo "!new_name!"
echo. && echo Do it? Press any key to continue
pause
color F0
REM pause
REM call set "new_name_to_ren=%%asd:%to_find%=%to_replace%%%"
REM echo new_name_to_ren="!new_name_to_ren!"
REM call ren "%%asd%%" "%%asd:%to_find%=%to_replace%%%"
REM ren "%asd%" "!new_name_to_ren!"
ren "!asd!" "!new_name!"
if exist "!new_name!" ( echo Renamed sussefully or file was be already exist && COLOR 20 && title=OK ) else ( echo New file NOT finding - rename mistake && color 40 && title=bad )
REM echo off
)

:ENDING
echo END NOW
pause

REM TODO:
REM * do not open secondary IDE
REM * when rename check for old file exist, (because may be old and new exist and we have ren-mistake)
REM * 


REM in command line use:
REM cls && set "to_replace=1234__"  && set "to_find=VT_MN_" && setlocal enabledelayedexpansion && for /f "tokens=*" %i in ('dir /b ^| find /i "%to_find%"') do ( echo. & echo. && echo Founded "%i" && echo. && set "asd=%i" && call echo ren "%asd%" "%asd:%to_find%=%to_replace%%" )