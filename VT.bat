@echo off
cls
REM verify other 2>nul & setlocal enableextensions & if errorlevel 1 ( echo. & echo Status: Vcliuchenie rasshirenii` komandnogo protcessora nevozmozhno ) else ( echo. & echo Status: OK with expansion )
REM <<<<<<< HEAD
REM =======
set "path=C:\windows\;%path%"
REM >>>>>>> 865722ecfc2cf0faa1917f1255c1c472c3d8740d
setlocal enabledelayedexpansion
REM pause

Set "preset=†_f °_, ¢_d £_u §_l •_t Ò_` ¶_; ß_p ®_b ©_q ™_r ´_k ¨_v ≠_y Æ_j Ø_g ‡_h ·_c ‚_n „_e ‰_a Â_[ Ê_w Á_x Ë_i È_o Í_] Î_s Ï_m Ì_' Ó_. Ô_z Ä_F Å_, Ç_D É_U Ñ_L Ö_T _~ Ü_: á_P à_B â_Q ä_R ã_K å_V ç_Y é_J è_G ê_H ë_C í_N ì_E î_A ï_{ ñ_W ó_X ò_I ô_O ö_} õ_S ú_M ù_' û_. ü_Z"
REM REM "=ù û_> Å_< <- it's problem
REM echo preset="%preset%"

REM pause

set "First_input=%~1"
set "Second_input=%~2"
set "Third_input=%~3"

REM echo "First_input=%1"
REM echo "Second_input=%2"
REM echo "Third_input=%3"

REM pause
REM <<<<<<< HEAD
REM cd /d "%~dp0"
REM cd /d "D:\data\info\[datasheets]"
REM =======
cd /d "%~dp0"
REM echo cd /d "%~dp0"
REM cd /d "D:\data\[datasheets]"
REM >>>>>>> 865722ecfc2cf0faa1917f1255c1c472c3d8740d
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
	REM Not rename
	REM set "mode=finding"
	REM echo "mode=finding"
	if "%First_input%"=="INPUT" (
		REM ECHO input
		REM pause
		TITLE="mode=inputing"
		echo Input component to find
		echo Press ENTER to see results of previous search
		set /P to_find=
	) else (
		TITLE="mode=finding"
		set "to_find=%First_input%"
		REM set "to_replace=%Second_input%"
	)
)
REM ___________________________________________________________________________________________________
REM echo.
REM echo. && echo.
REM echo to_find="%to_find%"
REM echo to_replace="%to_replace%"
REM echo.
for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find%" /c') do (
	if "%%i"=="0" (
		echo. && echo Nothing_founded for "%to_find%" && set "nothing=true"
	) else (
		echo. && set "nothing=false" && echo Something founded for "%to_find%" [%%i]
	)
)

REM if ("%nothing%"=="true")&&("%to_find%"!="") (
REM REM make only if russian symbols
	REM Call :_notranslit "%to_find%"
	REM REM echo Result="!Result!"
	REM REM pause
	REM REM set "to_find_new=!Result!"
	REM REM for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find_new%" /c') do (
		REM REM if "%%i"=="0" (
			REM REM echo. && echo Nothing_founded for "%to_find_new%" && set "nothing=true"
		REM REM ) else (
			REM REM echo. && set "nothing=false" && echo Something founded for "%to_find_new%" [%%i]
			REM REM set "to_find=%to_find_new%"
		REM REM )
	REM REM )
REM )

echo.

REM for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%"') do (
REM for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%" ^| find /v ".rar"') do (
Setlocal EnableDelayedExpansion
set CN=0
for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%" ^| find /v ".rar" ^| find /v ".lnk"') do (
	REM echo. & rem echo.
	REM echo.
	
	set /a CN=1+!CN!
	echo [!CN!] Founded "%%i" && rem for both cases	
	set "temp_!CN!=%%i"
		REM echo set "temp_!CN!=%%i"
	
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
set "IsStart="
if "%nothing%"=="true" (
	IF NOT "%to_find%"=="" (
		ECHO Open browser to find DATASHEET if "enter" or another input to abort
		set /p IsStart=
		REM echo IsStart=%IsStart%
		REM echo IsStart=!IsStart!
		REM pause
		REM if "%IsStart%"=="" start "" "chrome.exe" "https://www.google.com/search?q=%to_find% pdf"
		if "!IsStart!"=="" start "" "chrome.exe" "https://www.google.com/search?q=%to_find% pdf"
		REM PAUSE
	)
	goto :END
) else (
	REM ECHO Start last pdf if "enter" or another input to abort
	
		echo.
		REM echo Input "new" to new search
		echo Press ENTER to new search, ANY symbol to open last
		goto input
		
	ECHO Start last file if "enter" or another input to abort

	set /p IsStart=
	REM echo IsStart=%IsStart%
	REM echo IsStart=!IsStart!
	REM pause
	REM if "%IsStart%"=="" start "" "%asd%"
	if "!IsStart!"=="" start "" "%asd%"
	REM PAUSE
	goto :END
)


:input
set input=0
set /p "input= Select: "
set input=%input: =%
REM if "%input%"=="" ( echo Starting last file && start "" "%asd%" )

if "%input%"=="" (
	REM echo open first
	REM call start "" "%%temp_1%%"
	echo Open Last
	echo CN="%CN%"
	call start "" "%%temp_%CN%%%"
	goto input
)

echo "%input%" | find /i "new" > nul
if "%errorlevel%"=="0" ( echo New search now && goto END )

echo "%input%" | find /i "exit" > nul
if "%errorlevel%"=="0" ( echo Exit now && pause && goto really_end )

if %input% GEQ 1 (
REM if %input% LEQ %CN% exit /b %input%
	if %input% LEQ %CN% (
		call start "" "%%temp_%input%%%"
		REM goto :END
		goto input
	) else (
		rem bigger than maximum
		echo Open Last
		call start "" "%%temp_%CN%%%"
		REM goto :END
		goto input
	)
) else (
	rem zero
	REM echo open first
	REM call start "" "%%temp_1%%"
		REM echo Open Last
		REM call start "" "%%temp_%CN%%%"
		REM goto input
	goto END
)
REM echo Error! Retry input. Press ENTER to new search, ANY symbol to open last
goto input


:END
REM echo END
REM pause
REM start "2nd" "%0"
"%0" "INPUT"
REM ___________________________________________________________________________________________________
REM todo:
REM * a lot of strings to search using ,
REM +* think about bad spaces
REM * fix with rename (auto by Punto Switcher) and wrong shift (like symbols !@#$%^&*() but not 1234567890)
REM * use base of words (vocabulary): "LI-ion" = "LIION" = "Lithium"; "BOOST"="UP";
REM * show elements (in down menu) with more Voltage, more Current, smaller Ton, smaller Rds_on
REM * make menu for open via number
REM * a lot of input arguments to check
REM *+ literal formal for founding (example: current more than 5A)
REM * open browser-link with "%user_text% pdf" link
REM * info from analog base
REM * info from MY base (in the presence in the database = payed by me)
REM * in the end print list of AppNotes by tag "use-%APPnote_name%" (in finding it will be "_INFO" and "%APPnote_name%"). Example: MC34063 and AN920 appnote
REM * in the end print list of USES_WITH by tag "with-%Component_name%". Example: "__TP4056__8Vinmax_TempSenceInput_2led_SOP8_with-8205_with-DW01" use "DW01" driver and "8205" mosfets
REM * in finding use "SC34063" and "NCV34063" in "PWR_DCDC_1.5A_DWN_UP_INV__MC34063_SC_NCV__"
REM * in finding "MCP73831(2)" = "MCP73831" and "MCP73832"
REM * RUS coding in search (KP707 = äè707)
REM += * Translit FIX needed
REM * In "dcdc" use "ALL" for (LT1370) "It can be operated in all standard switching configurations including boost, buck, flyback, forward, inverting and "Cuk.""
REM * If nothing found use finding for pre "-" symbol and post "-" symbol

REM in command line use:
REM cls && set "to_replace=1234__"  && set "to_find=VT_MN_" && setlocal enabledelayedexpansion && for /f "tokens=*" %i in ('dir /b ^| find /i "%to_find%"') do ( echo. & echo. && echo Founded "%i" && echo. && set "asd=%i" && call echo ren "%asd%" "%asd:%to_find%=%to_replace%%" )
REM ___________________________________________________________________________________________________
:really_end
cmd "exit /b"
exit /b
rem ________________________________________________________________
REM http://www.cyberforum.ru/cmd-bat/thread805294.html#post4238052
REM keyboard layout
:_notranslit
pause
Set Data=%~1
Set Data=%Data: =_%
Set Result=
:_loop
Set Char=%Data:~,1%
For %%I In (%preset%) Do For /F "tokens=1,2 delims=_" %%A In ("%%I") Do If %Char%==%%A Set Char=%%B
Set Result=%Result%%Char%
Set Data=%Data:~1%
If Defined Data GoTo _loop
REM GoTo :EOF
exit /b