@echo off
cls
REM verify other 2>nul & setlocal enableextensions & if errorlevel 1 ( echo. & echo Status: Vcliuchenie rasshirenii` komandnogo protcessora nevozmozhno ) else ( echo. & echo Status: OK with expansion )
REM <<<<<<< HEAD
REM =======
REM https://stackoverflow.com/questions/8688846/resize-command-prompt-through-commands
mode con: cols=160
REM =======
:: WinAVR path-fail fix
set "path=C:\windows\;%path%"
set "path=%system32%;%path%"
set "path=%windir%\System32\;%path%"
::echo "path=%windir%\System32\;%path%"
REM >>>>>>> 865722ecfc2cf0faa1917f1255c1c472c3d8740d
setlocal enabledelayedexpansion
REM pause

Set "preset= _f ΅_, Ά_d £_u ¤_l ¥_t ρ_` ¦_; §_p ¨_b ©_q ª_r «_k ¬_v ­_y ®_j ―_g ΰ_h α_c β_n γ_e δ_a ε_[ ζ_w η_x θ_i ι_o κ_] λ_s μ_m ν_' ξ_. ο_z €_F _, ‚_D ƒ_U „_L …_T π_~ †_: ‡_P _B ‰_Q _R ‹_K _V _Y _J _G _H ‘_C ’_N “_E ”_A •_{ –_W —_X _I ™_O _} ›_S _M _' _. _Z"
REM REM "= _> _< <- it's problem
REM echo preset="%preset%"

REM pause

set "First_input=%~1"
set "Second_input=%~2"
set "Third_input=%~3"

REM echo "First_input=%1"
REM echo "Second_input=%2"
REM echo "Third_input=%3"

REM Try to find more
REM if "%First_input%"=="" set "First_input=."
REM if "%Second_input%"=="" set "Second_input=."
REM if "%Third_input%"=="" set "Third_input=."

REM pause
REM <<<<<<< HEAD
REM cd /d "%~dp0"
REM cd /d "D:\data\info\[datasheets]"
REM =======
REM echo on && echo Now will be mistake && pause
REM cd /d "%~dp0"
REM echo mistake was && pause

set me_dir=%~dp0
call set me_dir=%me_dir:"=&REM %
cd /d "%me_dir%"

REM echo mistake was && pause

REM echo me_dir=%me_dir%
REM cd /d "%me_dir,"=%"
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


for /f "tokens=1,2,3 delims=_ " %%i in ("%to_find%") do (
	set "to_find=%%i"
	set "Second_input=%%j"
	set "Third_input=%%k"
)


rem Fix for true finding
if "%Second_input%"=="" set "Second_input=."
if "%Third_input%"=="" set "Third_input=."

REM ___________________________________________________________________________________________________

if "%to_find%"=="dir" (
	REM start "" "explorer.exe %~dp0"
	start "" "explorer.exe" "%me_dir%"
)

if "%to_find%"=="edit" (
	REM start "" "C:\Program Files\Notepad++\notepad++.exe" "%me_dir%\VT.bat"
	set "NotepadPath=%ProgramFiles%\Notepad++\notepad++.exe"      && if exist "!NotepadPath!" start "" "!NotepadPath!" "%me_dir%\VT.bat"
	set "NotepadPath=%ProgramW6432%\Notepad++\notepad++.exe"      && if exist "!NotepadPath!" start "" "!NotepadPath!" "%me_dir%\VT.bat"
	set "NotepadPath=%ProgramFiles(x86)%\Notepad++\notepad++.exe" && if exist "!NotepadPath!" start "" "!NotepadPath!" "%me_dir%\VT.bat"
	set "to_find=."
)

if "%to_find%"=="rpadedit" (
	set "rpadpath=%windir%\rpad32.exe"
	if exist "!rpadpath!" (
		start "" "!rpadpath!" "%me_dir%\VT.bat"
		set "to_find=."
	) else  (
		echo Rpad dos editor not found or access denied
	)
)

if "%to_find%"=="exit" (
	exit /b
	goto :really_end
)

if "%to_find%"=="cmd" (
	start "" "cmd.exe"
)

if "%to_find%"=="search" (
	REM Setlocal EnableDelayedExpansion
	set /P TextToSearch=TextToSearch=
	set TextToSearch=!TextToSearch: =%%^20!
	REM echo "TextToSearch=!TextToSearch!"
	
	REM set "LocationPath=%~dp0"
	set "LocationPath=!me_dir!"
	REM echo "LocationPath=!LocationPath!"
	set "LocationPath=!LocationPath::=%%3A!"
	set "LocationPath=!LocationPath:\=%%5C!"
	REM echo "LocationPathAfterAdaptive=!LocationPath!"
	
	REM search-ms:displayname=Some%20search%20in%20"[datasheets]"&crumb=θμÿτΰιλΰ%3A~~*irfp%20LTL%20System.Generic.String%3A*irfp&crumb=location:H%3A%5Cdata%5C[datasheets]
	REM set "ExplorerFindString=search-ms^:displayname=Some%%^20search%%^20in%%^20^"^[datasheets^]^"^&crumb^=θμÿτΰιλΰ%%^3A^~^~^*!TextToSearch!%%^20LTL%%^20System.Generic.String%%^3A^*!TextToSearch!^&crumb^=location^:!LocationPath!"

		REM set "ExplorerFindString=search-ms^:crumb^=filename%%^3A^~^~^*!TextToSearch!%%^20OR%%^20System.Generic.String%%^3A^*!TextToSearch!^&crumb^=location^:!LocationPath!"
		set "ExplorerFindString=search-ms^:displayname^=¥§γ«μβ βλ%%^20―®¨αª %%^20Ά%%^20^[datasheets^]&crumb^=¨¬οδ ©« %%^3A^~^~^*!TextToSearch!^*^*%%^20‹%%^20System.Generic.String%%^3A^*!TextToSearch!^*^*^&crumb^=location^:!LocationPath:~0,-3!"
		rem 					search-ms:displayname=¥§γ«μβ βλ%20―®¨αª %20Ά%20"[datasheets]"&crumb=¨¬οδ ©« %3A~~*6009%20‹%20System.Generic.String%3A*6009&crumb=location:H%3A%5Cdata%5C[datasheets]
		REM search-ms:displayname=??????????%20??????%20?%20"[datasheets]"&crumb=????????%3A~~*6009**%20???%20System.Generic.String%3A*6009**&crumb=location:H%3A%5Cdata%5C[datasheets]
		REM search-ms:displayname=??????????%20??????%20?%20[datasheets]&crumb=????????%3A~~*6009**%20???%20System.Generic.String%3A*6009**&crumb=location:H%3A%5Cdata%5C[datasheets]%5C

REM search-ms:displayname=??????????%20??????%20?%20[datasheets]  &crumb=????????%3A~~*547**%20???%20System.Generic.String%3A*547**&crumb=location:H%3A%5Cdata%5C[datasheets]
REM search-ms:displayname=??????????%20??????%20?%20"[datasheets]"&crumb=????????%3A~~*547**%20???%20System.Generic.String%3A*547**&crumb=location:H%3A%5Cdata%5C[datasheets]

	REM echo "search-ms^:displayname=Some%%^20search%%^20in%%^20^"^[datasheets^]^"^&crumb^=θμÿτΰιλΰ%%^3A^~^~^*!TextToSearch!%%^20LTL%%^20System.Generic.String%%^3A^*!TextToSearch!^&crumb^=location^:!LocationPath!"
		REM echo ExplorerFindString=!ExplorerFindString!
	REM set ExplorerFindString=!ExplorerFindString:"="""!
	REM echo ExplorerFindString=!ExplorerFindString!
	
	REM pause
	
	REM echo start "" explorer.exe "!ExplorerFindString!"
	start "" /max explorer.exe "!ExplorerFindString!"
	
	set "to_find=!TextToSearch!"
	
	REM Endlocal
)

REM echo.
REM echo. && echo.
REM echo to_find="%to_find%"
REM echo to_replace="%to_replace%"
REM echo.
REM for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find%" /c') do (
REM echo for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find%" ^| find /i "%Second_input%" ^| find /i "%Third_input%" /c') do (
REM pause
for /f "tokens=*" %%i in ( 'dir /b ^| find /i "%to_find%" ^| find /i "%Second_input%" ^| find /i "%Third_input%" /c') do (
	if "%%i"=="0" (
		echo. && echo Nothing_founded for "%to_find%" "%Second_input%" "%Third_input%" && set "nothing=true"
	) else (
		echo. && set "nothing=false" && echo Something founded for "%to_find%" "%Second_input%" "%Third_input%" [%%i]
	)
)

REM if ( ("%nothing%"=="true") && ("%to_find%"!="") ) (
REM echo if "%to_find%"!="" (
if not "%to_find%"=="" (
	if "%nothing%"=="true" (
		REM make only if russian symbols
		echo Maybe need to try change keyboard layout
		REM Call :_notranslit "%to_find%"
		Call :_notranslit "%to_find%_%Second_input%_%Third_input%"
		REM echo Result="!Result!"
		REM pause
		set "to_find_new=!Result!"
		REM for /f "tokens=*" %%i in ( 'dir /b ^| find /i "!to_find_new!" /c') do (
		
		REM echo echo for /f "tokens=1,2,3 delims=_ " %%i in ("!to_find_new!") do
		for /f "tokens=1,2,3 delims=_ " %%i in ("!to_find_new!") do (
			set "to_find_new=%%i"
			set "Second_input=%%j"
			set "Third_input=%%k"
		)
		
		REM echo to_find_new=!to_find_new!
		REM echo Second_input=!Second_input!
		REM echo Third_input=!Third_input!
		
		REM for /f "tokens=*" %%i in ( 'dir /b ^| find /i "!to_find_new!" /c') do (
		for /f "tokens=*" %%i in ( 'dir /b ^| find /i "!to_find_new!" ^| find /i "!Second_input!" ^| find /i "!Third_input!" /c') do (
			if "%%i"=="0" (
				REM echo. && echo Nothing_founded for "!to_find_new!" && set "nothing=true"
				echo. && echo Nothing_founded for "!to_find_new!" "!Second_input!" "!Third_input!" && set "nothing=true"
			) else (
				REM echo. && set "nothing=false" && echo Something founded for "!to_find_new!" [%%i]
				echo. && set "nothing=false" && echo Something founded for "!to_find_new!" "!Second_input!" "!Third_input!" [%%i]
				set "to_find=!to_find_new!_!Second_input!_!Third_input!"
				set "Second_input=."
				set "Third_input=."
			)
		)
		
		for /f "tokens=1,2,3 delims=_ " %%i in ("!to_find!") do (
			set "to_find=%%i"
			set "Second_input=%%j"
			set "Third_input=%%k"
		)	
	)
)

echo.



REM for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%"') do (
REM for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%" ^| find /v ".rar"') do (
Setlocal EnableDelayedExpansion
set CN=0
REM for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%" ^| find /v ".rar" ^| find /v ".lnk"') do (
REM for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%" ^| find /i "%Second_input%" ^| find /i "%Third_input%" ^| find /v ".rar" ^| find /v ".lnk"') do (
for /f "tokens=*" %%i in ('dir /b ^| find /i "%to_find%" ^| find /i "%Second_input%" ^| find /i "%Third_input%" ^| find /v ".rar" ^| find /v ".lnk"') do (
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
		REM if "!IsStart!"=="" start "" "chrome.exe" "https://www.google.com/search?q=%to_find% pdf"
			REM if "!IsStart!"=="" start "" "chrome.exe" "https://www.chipfind.ru/datasheet/search.htm?s=%to_find%"
			if "!IsStart!"=="" start "" "chrome.exe" "https://www.chipdip.ru/search/library?searchtext=%to_find%"
		REM if "!IsStart!"=="" start "" "chrome.exe" "https://datasheetspdf.com/datasheet/search.php?sWord=%to_find%"
		REM if "!IsStart!"=="" start "" "chrome.exe" "https://datasheet-pdf.com/Search-Datasheet-PDF/%to_find%"
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
REM "%0" "INPUT" "!Second_input!" "!Third_input!"
set "to_find=!to_find!_!Second_input!_!Third_input!"
"%0" "INPUT" "!Second_input!" "!Third_input!"
REM ___________________________________________________________________________________________________
REM todo:
REM moved to external todo.txt file
REM ___________________________________________________________________________________________________
:really_end
cmd "exit /b"
exit /b
rem ________________________________________________________________
REM http://www.cyberforum.ru/cmd-bat/thread805294.html#post4238052
REM keyboard layout
:_notranslit
REM pause
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