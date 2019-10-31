@echo off
set "time_name=%TIME::=_%"
set "filename=List_%date%__%time_name%.txt"
echo Write to file "%filename%"
echo Press any key to continue
pause
REM echo dir /b >> List_%date%__%time_name%.txt
dir /b >> "%filename%"
pause
pause
start "" "%filename%"