@set @x=0; /*
@echo off
ver |>NUL find "6." && if "%~1"=="" cscript.exe //nologo //e:jscript "%~f0"& exit /b
REM http://www.cyberforum.ru/post3934558.html
 
::
:: <--- ����� ��� ��襩 �᭮���� �ணࠬ��
::
"%~dp0\��.bat"
 
pause
exit /B
 
:: ��� ��ப� �� �ண���. ���� ��祣� �� �����!!!
*/new ActiveXObject('Shell.Application').ShellExecute (WScript.ScriptFullName,'Admin','','runas',1);