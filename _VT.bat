@echo off
cls
REM verify other 2>nul & setlocal enableextensions & if errorlevel 1 ( echo. & echo Status: Vcliuchenie rasshirenii` komandnogo protcessora nevozmozhno ) else ( echo. & echo Status: OK with expansion )

set "First_input=%1"
set "Second_input=%2"
set "Third_input=%3"

REM echo "First_input=%1"
REM echo "Second_input=%2"
REM echo "Third_input=%3"

REM pause
REM cd /d "%~dp0"
cd /d "D:\data\[datasheets]"
REM echo Path="%~dp0"
REM pause
REM pause

set "mode=finding"

REM http://qaru.site/questions/224121/cmdexe-complex-conditions
REM if ("%First_input%"=="rename") or ("%First_input%"=="ren") (
set COND=
if "%First_input%"=="rename" set COND=1
if "%First_input%"=="ren" set COND=1
if defined COND (

	echo.
	echo RENAME MODE
	TITLE=RENAME MODE
	pause && echo Press any key
	set "mode=rename"
	set "to_find=%Second_input%"
	set "to_replace=%Third_input%"

	REM if ("%Second_input%"=="") or ("%Third_input%"=="") (
	set COND2=
	if "%Second_input%"=="" set COND2=1
	if "%Third_input%"=="" set COND2=1
	if "%Third_input%"=="%Second_input%" set COND2=1
	if "%First_input%"=="%Second_input%" set COND2=1
	if defined COND2 ( echo FUUUCK && GOTO :EOF )
) else (
	REM set "mode=finding"
	REM echo "mode=finding"
	TITLE="mode=finding"
	set "to_find=%First_input%"
	REM set "to_replace=%Second_input%"
)
REM ___________________________________________________________________________________________________
REM echo.
REM echo. && echo.
REM echo to_find="%to_find%"
REM echo to_replace="%to_replace%"
REM echo.
for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find%" /c') do (if "%%i"=="0" (echo. && echo Nothing_founded for "%to_find%" && set "nothing=true" ) else (echo. && set "nothing=false" && echo Something founded for "%to_find%" [%%i] ))
echo.

for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%"') do (
	REM echo. & rem echo.
	echo Founded "%%i" && rem for both cases
	REM echo.
	set "asd=%%i"
	REM call echo ren "%%asd%%" "%%asd:%to_find%=%to_replace%%%"

	REM echo on
	REM echo Found "%asd%" && rem for both cases
						REM if "%mode%"=="rename" (
							REM ECHO rename "%%asd%%" to "%%asd:%to_find%=%to_replace%%%"
							REM echo Rename now? (double tap to rename or CLOSE for exit)
							REM pause
							REM pause
							REM call ren "%%asd%%" "%%asd:%to_find%=%to_replace%%%"
						REM )
	REM )else(
		REM echo Found "asd"
	REM )
)

echo.
:EOF
echo END
pause
if "%nothing%"=="true" (
	start "" "chrome.exe" "https://www.google.com/search?q=%to_find% pdf"
) else (
	start "" "%asd%"
)
REM ___________________________________________________________________________________________________
REM todo:
REM * a lot of strings to search using ,
REM +* think about bad spaces
REM * fix with rename
REM * make menu for open via number
REM * a lot of input arguments to check
REM *+ literal formal for founding
REM * open browser-link with "%user_text% pdf" link

REM in command line use:
REM cls && set "to_replace=1234__"  && set "to_find=VT_MN_" && setlocal enabledelayedexpansion && for /f "tokens=*" %i in ('dir /b ^| find /i "%to_find%"') do ( echo. & echo. && echo Founded "%i" && echo. && set "asd=%i" && call echo ren "%asd%" "%asd:%to_find%=%to_replace%%" )

