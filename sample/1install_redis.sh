#!/bin/bash
# allow all ip address of Scalelite and BBB
# read -p "Press enter to continue"

read -p "Enter Domain of HOSTNAME this server: " DOMAINBBBX
echo "Data received"
sudo hostname $DOMAINBBBX


sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install -y redis-server
sudo systemctl enable redis-server.service

echo "Set bind in /etc/redis/redis.conf"
sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0/g' /etc/redis/redis.conf

echo "done edit redis.conf"
echo "Restaring redis service"
sudo service redis-server restart

##CHANGE BEFORE USE
ufw --force enable
ufw allow from 157.245.196.93
ufw allow from 157.245.192.5
ufw allow from 188.166.242.86
ufw allow from 143.198.82.130
ufw allow from 143.198.89.91
ufw allow from 143.198.89.90
sudo ufw allow 6379
sudo ufw allow 22
sudo ufw reload
sudo ufw status verbose

cd /root
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/mredis.sh
chmod +x mredis.sh
echo "Done for REDIS server!"
