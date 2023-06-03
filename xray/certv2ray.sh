#bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain="$(cat /etc/xray/domain)"
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill

cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install >/dev/null 2>&1
bash acme.sh --register-account -m anuybazoelk639@gmail.com
wget https://get.acme.sh >/dev/null 2>&1 | sh -s email=anuybazoelk639@gmail.com
/root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
/root/.acme.sh/acme.sh --issue -d $domain --standalone --force --keylength ec-256
/root/.acme.sh/acme.sh --installcert -d $domain --ecc --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
clear
clear
neofetch
