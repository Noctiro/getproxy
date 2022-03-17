@echo off
:: call:rm filename
call:rm temp_all.txt
call:rm temp_http.txt
call:rm temp_https.txt
call:rm temp_socks4.txt
call:rm temp_socks5.txt
:: call:get filename/type url
:: http
call:dl http https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-http.txt
call:dl http https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/http.txt
call:dl http https://www.proxyscan.io/api/proxy?format=txt%26type=http
:: https
call:dl https https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-https.txt
call:dl https https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/https.txt
call:dl https https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/HTTPS_RAW.txt
call:dl https https://www.proxyscan.io/api/proxy?format=txt%26type=https
:: socks4
call:dl socks4 https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks4.txt
call:dl socks4 https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/socks4.txt
call:dl socks4 https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks4.txt
call:dl socks4 https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS4_RAW.txt
call:dl socks4 https://www.proxyscan.io/api/proxy?format=txt%26type=socks4
:: sock5
call:dl socks5 https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks5.txt
call:dl socks5 https://fastly.jsdelivr.net/gh/hookzof/socks5_list@master/proxy.txt
call:dl socks5 https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/socks5.txt
call:dl socks5 https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks5.txt
call:dl socks5 https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS5_RAW.txt
call:dl socks5 https://www.proxyscan.io/api/proxy?format=txt%26type=socks5
del temp_last.txt
cd.>all.txt
for /f "delims=" %%i in (temp_all.txt) do (
find /i "%%i" all.txt||echo %%i>>all.txt
)
del temp_all.txt
echo Done!
pause
exit

:dl
if exist "temp_%1.txt" (del temp_%1.txt)
curl -o temp_%1.txt "%2"
(for /f "delims=" %%i in (temp_%1.txt) do (
    echo %1://%%i
))>temp_%1url.txt
del temp_%1.txt
type temp_%1url.txt>>%1.txt
type temp_%1url.txt>>temp_all.txt
goto:eof
:rm
if exist %1 (del %1)
goto:eof