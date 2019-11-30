@set @x=0; /*
@echo off
ver |>NUL find "6." && if "%~1"=="" cscript.exe //nologo //e:jscript "%~f0"& exit /b
REM http://www.cyberforum.ru/post3934558.html
 
::
:: <--- Здесь код Вашей основной программы
::
"%~dp0\ме.bat"
 
pause
exit /B
 
:: Эту строку не трогать. Ниже ничего не писать!!!
*/new ActiveXObject('Shell.Application').ShellExecute (WScript.ScriptFullName,'Admin','','runas',1);