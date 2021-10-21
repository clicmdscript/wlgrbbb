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
sudo hostname $DOMAINBBB1
wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v bionic-23 -s $DOMAINBBB1 -e $EMAILBBB1 -w -g

echo "BBB DONE"
echo ""
echo "NFS COMMON INSTALL"
echo "NFS config"
sudo apt-get update
sudo apt-get install -y nfs-common
sudo mkdir -p /mnt/scalelite-recordings

echo "#CHANGE BEFORE USE This setting to mount folder scalelite to NFS server"
echo "vi /etc/fstab"
echo "--------------------------------------------------------------------------------"
echo "IPNFS:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0"
echo "and"
echo :sudo mount file.roauset.com:/mnt/scalelite-recordings /mnt/scalelite-recordings"
echo "--------------------------------------------------------------------------------"
echo "verify with: df -h"
read -p "Press enter to continue"

echo "FROM BBB AND SCALE RUN CMD MOUNT ABOVE"


echo "Done"
echo "# Create a new group with GID 2000"
groupadd -g 2000 scalelite-spool
echo "# Add the bigbluebutton user to the group"
usermod -a -G scalelite-spool bigbluebutton



echo "Edit .env file on BBB"
read -p "Press enter to continue"

cd /root/greenlight
cp .env 1.env

rm -rf docker-compose.yml
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/docker-compose.yml
echo ""
echo "Done update file docker-compose.yml"

echo "PLEASE EDIT .ENV WITH ENDPOINT, SECRET OF SCALELITE AND POSTGEPASSINFO 7DOWN"

read -p "Press enter to continue"
docker-compose down
./scripts/image_build.sh bigbluebutton/greenlight release-v2

echo "Restaring BBB and Greenlight"
docker stop greenlight-v2
docker rm greenlight-v2
docker-compose up -d
bbb-conf --restart
systemctl restart nginx
systemctl restart nginx
#bbb-conf --clean

echo "Infomation of this server"
echo "Secret KEY"
bbb-conf --secret

cd /root/greenlight
cp .env .env1
docker-compose down
cd ..
mv greenlight/ greenlight-old/
cd /root
git clone https://github.com/bigbluebutton/greenlight.git
cd greenlight/

git status
git remote add upstream https://github.com/bigbluebutton/greenlight.git
git remote -v
git fetch upstream
git checkout -b custom-changes upstream/v2
git status

cp ~/greenlight-old/.env1 ~/greenlight/.env
sudo cp -r ~/greenlight-old/db ~/greenlight/

cat ./greenlight.nginx | sudo tee /etc/bigbluebutton/nginx/greenlight.nginx
systemctl restart nginx
rm -rf docker-compose.yml
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/docker-compose.yml

docker-compose down
./scripts/image_build.sh bigbluebutton/greenlight release-v2

docker-compose up -d

docker run --rm --env-file .env bigbluebutton/greenlight:v2 bundle exec rake conf:check

bbb-conf --restart
systemctl restart nginx


#echo "Setting up record config with scalelite"
#cd /root/
#wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/setup-recordings.sh
#chmod +x setup-recordings.sh
#./setup-recordings.sh



#update file for BBB install with Batch record
cd /usr/local/bigbluebutton/core/scripts/post_publish
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/bigbluebutton/scalelite_post_publish.rb
cd /usr/local/bigbluebutton/core/scripts
rm -rf scalelite.yml
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/bigbluebutton/scalelite.yml

mkdir -p /mnt/scalelite-recordings/var/bigbluebutton

cd /usr/local/bigbluebutton/core/scripts
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/bigbluebutton/scalelite_batch_import.sh
chmod +x scalelite_batch_import.sh
./scalelite_batch_import.sh

cd /root
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/mbbb.sh
chmod +x mbbb.sh


ufw --force enable
ufw allow from 157.245.196.93
ufw allow from 157.245.192.5
ufw allow from 188.166.242.86
ufw allow from 143.198.82.130
ufw allow from 143.198.89.91
ufw allow from 143.198.89.90
ufw allow from 167.172.69.196
sudo ufw allow 16384:32768/udp
sudo ufw allow 6379
sudo ufw allow 5432
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw reload
sudo ufw status verbose

