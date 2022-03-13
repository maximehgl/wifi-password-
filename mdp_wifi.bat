CHCP 65001
SETLOCAL EnableDelayedExpansion
echo MOT DE PASSE WIFI >mdp_wifi.txt

echo                                                                    .>>mdp_wifi.txt
echo -------------------------------------------------------------------->>mdp_wifi.txt
echo                                                                    .>>mdp_wifi.txt
set command=%netsh wlan show profiles


set /a counter=0
for /f %%a in ('%command%') do set /a counter+=1


netsh wlan show profiles
set /a count=%counter%+1
:y

for /f "skip=%count% tokens=2 delims=:" %%a in ('%command%') do (
set Num[%count%]=%%a
goto x
)
:x

set /a count+=1
set /a lim=9+%counter%-6
if %count% LSS %lim% goto :y
echo %Num[9]%
echo %Num[10]%

set c=0
:z

set /a l=9+%c%
call set numi=%%Num[%l%]%%
set num=%numi:~1%

echo !num! >> mdp_wifi.txt
set /a c+=1
set /a n=%counter%-6
echo %n%
netsh wlan show profiles name= "%num%" key=clear | findstr "Key" >> mdp_wifi.txt
echo                                                                    .>>mdp_wifi.txt
echo -------------------------------------------------------------------->>mdp_wifi.txt
echo                                                                    .>>mdp_wifi.txt
if %c% LSS 2 goto :z





