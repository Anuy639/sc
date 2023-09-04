#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://anuy639.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/Anuybazoelk639"
echo -e "${NC}${LIGHT}WhatsApp : https://wa.me/6285349326511"
echo -e "${NC}${LIGHT}WhatsApp : https://wa.me/6287728411949"
echo -e "${NC}${LIGHT}Youtube : youtube.com/@anuy63"
echo -e "${NC}${LIGHT}Telegram : https://t.me/anuybazoelk"
echo -e "${NC}${LIGHT}Telegram : https;//t.me/anuybazoelk639"
exit 0
fi
clear
echo "Checking VPS"
clear
domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m     ⇱ SSH PREMIUM BZ OFFICIAL STORE ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
#echo - #"❇️ IP/Host       : $IP"
echo -e "❇️ Domain        : ${domain}"
echo -e "❇️ Username      : $Login"
echo -e "❇️ Password      : $Pass"
echo -e "❇️ Dropbear      : 109, 143"
echo -e "❇️ SSL/TLS       : $ssl"
echo -e "❇️ Port Squid    : $sqd"
echo -e "❇️ OHP SSH       : 8181"
echo -e "❇️ OHP Dropbear  : 8282"
echo -e "❇️ OHP OpenVPN   : 8383"
echo -e "❇️ Ssh Ws SSL    : $ws"
echo -e "❇️ Ssh Ws No SSL : $ws2"
echo -e "❇️ Ovpn Ws       : 2086"
echo -e "❇️ Port TCP      : $ovpn"
echo -e "❇️ Port UDP      : $ovpn2"
echo -e "❇️ Port SSL      : 990"
echo -e "❇️ OVPN TCP      : http://$IP:89/tcp.ovpn"
echo -e "❇️ OVPN UDP      : http://$IP:89/udp.ovpn"
echo -e "❇️ OVPN SSL      : http://$IP:89/ssl.ovpn"
echo -e "❇️ BadVpn        : 7100-7200-7300"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m     ⇱ Payload Websocket Tls ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "GET ws://${domain}/chat HTTP/1.1[crlf]Keep-Alive-Connection-Close[crlf]Upgrade: Websocket[crlf]Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==[crlf]Sec-WebSocket-Version: 13[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Expect: 100-Continue[crlf]Content-Lenght: @anuybazoelk[crlf]Host: ${domain}[crlf]Connection: keep-alive[crlf]Proxy-Connection: keep-alive[crlf]X-Forwarded-For: ${domain}[crlf]X-Online-Host: ${domain}[crlf]X-Forward-Host: ${domain}[crlf][crlf]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m     ⇱ Payload Websocket No Tls ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Content-Lenght: @anuybazoelk639[crlf]Upgrade: Websocket[crlf][crlf]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m     ⇱ Created        : $hariini ⇲          \E[0m"
echo -e "\E[44;1;39m     ⇱ Expired        : $expi ⇲          \E[0m"
echo -e "\E[44;1;39m     ⇱ Whatsapp       : https://wa.me/6287728411949 ⇲          \E[0m"
echo -e "\E[44;1;39m     ⇱ Telegram       : https://t.me/anuybazoelk ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
