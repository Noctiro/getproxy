#!/bin/sh
del all.txt
dl () {
    del temp_$1.txt
    curl -o temp_$1.txt $2
    sed -i 's/^/'$1':\/\/&/g' temp_$1.txt
    echo >> temp_$1.txt
    cat temp_$1.txt >> temp_all.txt
    del temp_$1.txt
}
del () {
    if [ -d "$1" ]; then
        rm -f $1
    fi
}

# http
dl "http" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-http.txt"
dl "http" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/http.txt"
dl "http" "https://www.proxyscan.io/api/proxy?format=txt%26type=http"
# https
dl "https" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-https.txt"
dl "https" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/https.txt"
dl "https" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/HTTPS_RAW.txt"
dl "https" "https://www.proxyscan.io/api/proxy?format=txt%26type=https"
#socks4
dl "socks4" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks4.txt"
dl "socks4" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/socks4.txt"
dl "socks4" "https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks4.txt"
dl "socks4" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS4_RAW.txt"
dl "socks4" "https://www.proxyscan.io/api/proxy?format=txt%26type=socks4"
#socks5
dl "socks5" "https://fastly.jsdelivr.net/gh/jetkai/proxy-list@main/online-proxies/txt/proxies-socks5.txt"
dl "socks5" "https://fastly.jsdelivr.net/gh/hookzof/socks5_list@master/proxy.txt"
dl "socks5" "https://fastly.jsdelivr.net/gh/UserR3X/proxy-list@main/online/socks5.txt"
dl "socks5" "https://fastly.jsdelivr.net/gh/TheSpeedX/PROXY-List@master/socks5.txt"
dl "socks5" "https://fastly.jsdelivr.net/gh/roosterkid/openproxylist@main/SOCKS5_RAW.txt"
dl "socks5" "https://www.proxyscan.io/api/proxy?format=txt%26type=socks5"

cat temp_all.txt | sort -u > all.txt
del temp_all.txt

echo -e "\e[1;32mDone!\e[0m"