#!/bin/sh
del () {
if [ -f "$1" ]; then
rm -f $1
fi
}
proxy () {
del temp_$1.txt

curl -o temp_$1.txt $2
sed -i '/^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}:[0-9]\{1,5\}$/!d' temp_$1.txt
cat temp_$1.txt >> $1.txt

sed -i 's/^/'$1':\/\/&/g' temp_$1.txt
cat temp_$1.txt >> $1_with_protocol.txt

cat temp_$1.txt >> all.txt
del temp_$1.txt
}

del all*.txt
del http*.txt
del socks*.txt

# http
proxy "http" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-http.txt"
# https
proxy "https" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-https.txt"
proxy "https" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/HTTPS_RAW.txt"
#socks4
proxy "socks4" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks4.txt"
proxy "socks4" "https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks4.txt"
proxy "socks4" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS4_RAW.txt"
#socks5
proxy "socks5" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks5.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/hookzof/socks5_list@master/proxy.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks5.txt"
proxy "socks5" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS5_RAW.txt"

echo -e "\e[1;32mDone!\e[0m"
