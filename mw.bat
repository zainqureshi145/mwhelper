@ echo off
color 0E
echo -------------------------------------------------------------
echo -------------------------------------------------------------
echo --------          Modern Warfare Network Tool         -------
echo --------                Zain Qureshi                  -------
echo -------------------------------------------------------------
echo -------------------------------------------------------------
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
echo Success: Administrative permissions confirmed.
goto start
) else (
echo Failure: Open the tool with Administrative Privilages. Closing in 5 seconds...
timeout 5
exit
)


:start
echo ---------------------------
echo ---------------------------
echo ---------------------------
echo 0 = Ping Your Router
echo 1 = Ping Huawei Router (192.168.100.1)
echo 2 = Ping Xiaomi Router (192.168.31.1)
echo ---------------------------
echo ---------------------------
echo 3 = Flush DNS Cache
echo 4 = Re Register DNS
echo 5 = Release IP
echo 6 = Renew IP
echo 7 = Reset Socket
echo 8 = Perform All Actions
echo 9 = Perform All Actions and Create a log.txt at current path
echo E or e = Exit
echo ---------------------------
echo ---------------------------
echo ---------------------------
echo Select an Action:

set /P Action=

if %Action%==0 (
echo Enter IP to Ping
set /P address=
ping "%address%"
echo ------------------------------------------------------------------------
echo ------------------------------------------------------------------------
echo ------------------------------------------------------------------------
echo ----    If your Ping is Higher than 10ms, You Have Interference.    ----
echo ----    Change the Router's Channel to an unused Channel.           ----
echo ----    Download Netspot to identify...                             ----
echo ------------------------------------------------------------------------
echo ------------------------------------------------------------------------
echo ------------------------------------------------------------------------
timeout 10
goto start
)

if %Action%==1 (
ping 192.168.100.1
timeout 2
goto start
)

if %Action%==2 (
ping 192.168.31.1
timeout 2
goto start
)
if %Action%==3 (
ipconfig /flushdns
timeout 2
goto start
)
if %Action%==4 (
ipconfig /registerdns
timeout 2
goto start
)

if %Action%==5 (
ipconfig /release
timeout 2
goto start
)

if %Action%==6 (
ipconfig /renew
timeout 2
goto start
)

if %Action%==7 (
netsh winsock reset
timeout 2
goto start
)

if %Action%==8 (
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
echo All Done... Closing in 3 Seconds....
goto start
)

if %Action%==9 > %~dp0\log.txt (
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
goto start
)
if %Action%==E || %Action%==e ( exit )
pause