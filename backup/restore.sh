#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0;37m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
clear
echo "Fitur Ini Hanya Bisa Digunakan Sesuai Data Vps Dengan Autoscript Ini"
echo "Silakan masukkan tautan ke file cadangan data vps Anda "
echo "Anda dapat memeriksanya di email Anda jika Anda menjalankan backup data vps sebelumnya "
echo " "
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring passwd data..."
sleep 1
cp /root/backup/passwd /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring group data..."
sleep 1
cp /root/backup/group /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp /root/backup/shadow /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp /root/backup/gshadow /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring chap-secrets data..."
sleep 1
cp /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring passwd1 data..."
sleep 1
cp /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring ss.conf data..."
sleep 1
cp /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restoring admin data..."
sleep 1
cp -r /root/backup/akbarstorevpn /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/akbarstorevpn /etc/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -rf /root/backup &> /dev/null
rm -rf /root/backup
echo -e "$COLOR1│${NC}  [ ${GREEN}INFO${NC} ] • Done... Successfully"
rm -f backup.zip
echo Done
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
