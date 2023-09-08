#!/bin/sh
del () {
if [ -f "$1" ]; then
rm -f $1
fi
}
proxy () {
del temp_$1.txt

curl -o temp_$1_original.txt $2
grep -Eo "(((\d{1,2})|(1\d{2})|(2[0-4]\d)|(25[0-5]))\.){3}((\d{1,2})|(1\d{2})|(2[0-4]\d)|(25[0-5]))" temp_$1_original.txt > temp_$1.txt
sed -i 's/^/'$1'://g' temp_$1.txt
del temp_$1_original.txt

cat temp_$1.txt >> $1.txt
cat temp_$1.txt >> all.txt

del temp_$1.txt
}

del all.txt
del http.txt
del https.txt
del socks4.txt
del socks5.txt

# http
proxy "http" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-http.txt"
proxy "http" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/http.txt"
proxy "http" "https://www.proxyscan.io/api/proxy?format=txt&type=http"
# https
proxy "https" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-https.txt"
proxy "https" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/https.txt"
proxy "https" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/HTTPS_RAW.txt"
proxy "https" "https://www.proxyscan.io/api/proxy?format=txt&type=https"
#socks4
proxy "socks4" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks4.txt"
proxy "socks4" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/socks4.txt"
proxy "socks4" "https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks4.txt"
proxy "socks4" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS4_RAW.txt"
proxy "socks4" "https://www.proxyscan.io/api/proxy?format=txt&type=socks4"
#socks5
proxy "socks5" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks5.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/hookzof/socks5_list@master/proxy.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/socks5.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks5.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS5_RAW.txt"
proxy "socks5" "https://www.proxyscan.io/api/proxy?format=txt&type=socks5"

echo -e "\e[1;32mDone!\e[0m"
