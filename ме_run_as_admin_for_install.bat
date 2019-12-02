@echo off
cls

Setlocal EnableDelayedExpansion
REM "D:\[data]\[info]\[datasheets]\VT_on_the_nout.bat" %1 %2 %3 %4 %5 %6
rem ме

set "path_to_install=C:\Windows"
set "VTBAT_filename=VT.bat"

rem test for install
echo %~dp0 | find /i "Windows" > nul
if "!errorlevel!"=="1" (
	echo file not installed
	echo Do you want to install?
	set /p answer="y/n?"
	echo "!answer!" | find /i "y" > nul
	REM echo "!answer!" | find /i "y"
	REM echo !errorlevel!
	REM if "%answer%"=="y" (
	if "!errorlevel!"=="0" (
		REM echo %errorlevel%
		echo Install now (need admin rules)
		pause
		copy "%0" "%path_to_install%\ме.bat" || echo BAD COPY
		echo !errorlevel!
		copy "%0" "%path_to_install%\vt.bat" || echo BAD COPY
		echo !errorlevel!
		pause
	)
)

echo start now
REM pause
REM "D:\[data]\[info]\[datasheets]\VT_on_the_nout.bat" %1 %2 %3 %4 %5 %6
REM "D:\[data]\[info]\[datasheets]\VT_on_the_work.bat" %1 %2 %3 %4 %5 %6
set "nout_path=D:\[data]\[info]\[datasheets]"
if exist "%nout_path%\%VTBAT_filename%" (
	echo Exist in "%nout_path%"
	start "" "%nout_path%\%VTBAT_filename%"  %1 %2 %3 %4 %5 %6
)

set "onthe_work_path=H:\data\[datasheets]"
if exist "%onthe_work_path%\%VTBAT_filename%" (
	echo Exist in "%onthe_work_path%"
	start "" "%onthe_work_path%\%VTBAT_filename%" %1 %2 %3 %4 %5 %6
)