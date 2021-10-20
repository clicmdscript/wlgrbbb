#!/bin/bash
# allow all ip address of Scalelite and BBB
# read -p "Press enter to continue"


sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install -y redis-server
sudo systemctl enable redis-server.service

echo "Set bind in /etc/redis/redis.conf"
sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0/g' /etc/redis/redis.conf

echo "done edit redis.conf"
echo "Restaring redis service"
sudo service redis-server restart

Echo "enable Firewall"

echo "PLEASE allow IP of SCALELITE"
echo "ufw allow from IP"
echo "sudo ufw allow 6379"
sudo ufw allow 22

sudo ufw reload

echo "Done for REDIS server!"
