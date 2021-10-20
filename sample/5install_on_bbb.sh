#!/bin/bash
# 

sudo apt-get update && sudo apt-get upgrade -y
cd /etc/apt/sources.list.d

curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
echo ""
echo "deb http://deb.nodesource.com/node_12.x bionic main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src http://deb.nodesource.com/node_12.x bionic main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
echo ""
sudo apt-get update
apt-get update && apt-get install
echo ""
#sudo -i
sudo apt-get update && sudo apt-get upgrade -y
echo "updating done, now start install BBB and Greenlight"
echo ""
echo ""

read -p "Enter Domain of this BBB server: " DOMAINBBB1
echo "Data received"
read -p "Enter Email to generate ssl: " EMAILBBB1
echo "Data received"
#read -p "Version BBB want to install 23 or 240: " BBBVER1
#echo "Data received"
echo ""
wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v bionic-23 -s $DOMAINBBB1 -e $EMAILBBB1 -w -g

echo "BBB DONE"
echo ""
echo "NFS COMMON INSTALL"
sudo apt-get install -y nfs-common

echo "Done"
echo "# Create a new group with GID 2000"
groupadd -g 2000 scalelite-spool
echo "# Add the bigbluebutton user to the group"
usermod -a -G scalelite-spool bigbluebutton

sudo mkdir -p /mnt/scalelite-recordings
#CHANGE BEFORE USE
echo "vi /etc/fstab"
echo "--------------------------------------------------------------------------------"
echo "143.198.82.130:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0"
echo "--------------------------------------------------------------------------------"
echo "verify with: df -h"



echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Edit .env file on BBB"
read -p "Press enter to continue"

cd /root/greenlight
cp .env 1.env

rm -rf docker-compose.yml
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/docker-compose.yml
echo ""
echo "Done update file docker-compose.yml"

echo "Restaring BBB and Greenlight"
docker stop greenlight-v2
docker rm greenlight-v2
docker-compose down
docker-compose up -d
bbb-conf --restart
systemctl restart nginx
systemctl restart nginx
#bbb-conf --clean

echo "Infomation of this server"
echo "Secret KEY"
bbb-conf --secret

#echo "Setting up record config with scalelite"

#cd /root/
#wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/setup-recordings.sh
#chmod +x setup-recordings.sh
#./setup-recordings.sh










