@echo off
cd "E:\test"
setlocal
call :DateToMinutes %date:~-4% %date:~-10,2% %date:~-7,2% %time:~0,2% %time:~3,2% NowMins
for /f "delims=" %%a in ('dir * /a-d /b') do call :CheckMins "%%a" "%%~ta"
goto :EOF
:CheckMins
set File=%1
set TimeStamp=%2
call :DateToMinutes %timestamp:~7,4% %timestamp:~1,2% %timestamp:~4,2% %timestamp:~12,2% %timestamp:~15,2%%timestamp:~18,1% FileMins
set /a MinsOld=%NowMins%-%FileMins%
if %MinsOld% gtr 5 del %file%
goto :EOF
:DateToMinutes
setlocal
set yy=%1&set mm=%2&set dd=%3&set hh=%4&set nn=%5
if 1%yy% LSS 200 if 1%yy% LSS 170 (set yy=20%yy%) else (set yy=19%yy%)
set /a dd=100%dd%%%100,mm=100%mm%%%100
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
if 1%hh% LSS 20 set hh=0%hh%
if /i {%nn:~2,1%} EQU {p} if "%hh%" NEQ "12" set hh=1%hh%&set/a hh-=88
if /i {%nn:~2,1%} EQU {a} if "%hh%" EQU "12" set hh=00
if /i {%nn:~2,1%} GEQ {a} set nn=%nn:~0,2%
set /a hh=100%hh%%%100,nn=100%nn%%%100,j=j*1440+hh*60+nn
endlocal&set %6=%j%&goto :EOF