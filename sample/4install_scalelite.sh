#!/bin/bash
echo "install DOCKER"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce


read -p "Enter Domain of this server: " DOMAINBBBX
echo "Data received"
sudo hostname $DOMAINBBBX

echo "Install Docker completed"
echo ""

echo "Install Nginx"
sudo apt-get install -y nginx
echo "......................................................................"
echo "Install Nginx Done"
echo "......................................................................"
echo "Install letsencrypt"
sudo apt-get install -y letsencrypt
echo "Install letsencrypt Done"
echo "......................................................................"
echo "Instsall Certbot"
sudo apt-get -y install -y certbot
echo "Instsall Certbot Done"
echo "......................................................................"
echo "Create SSL key"
sudo mkdir -p /etc/nginx/ssl

read -p "Enter domain of scalelite scalilte.domain.com:" scalelitedomain
read -p "Enter Email for SSL generate:" emailssl

sudo certbot --webroot -w /var/www/html/ -d $scalelitedomain certonly --agree-tos --email $emailssl --no-eff-email

echo "Key store in /etc/letsencrypt/live/$scalelitedomain/privkey.pem"
echo "Key store in /etc/letsencrypt/live/$scalelitedomain/fullchain.pem"
echo "......................................................................"
echo "Done ssl"

cd /etc/nginx/ssl
mkdir live
cd live/
mkdir $scalelitedomain
cd $scalelitedomain/
cp /etc/letsencrypt/live/$scalelitedomain/fullchain.pem fullchain.pem
cp /etc/letsencrypt/live/$scalelitedomain/privkey.pem privkey.pem
         
echo "Copy key to /root"
cd /root
cp /etc/letsencrypt/live/$scalelitedomain/fullchain.pem fullchain.pem
cp /etc/letsencrypt/live/$scalelitedomain/privkey.pem privkey.pem


echo "Done, Now will remove nginx from this server"
apt-get remove nginx nginx-common

echo "Remove nginx done"

echo "MAKE SURE FIREWALL OF DO ALLOW ALL FOR ALL IP"
read -p "Press enter to continue"

echo "NFS config"
sudo apt-get update
sudo apt-get install -y nfs-common
sudo mkdir -p /mnt/scalelite-recordings
echo "sudo mount serverIP:/mnt/scalelite-recordings /mnt/scalelite-recordings"

echo "FROM BBB AND SCALE RUN CMD MOUNT ABOVE >>>"
echo "==============================Scalelite server"

read -p "Press enter to continue"

echo "......................................................................"
echo "Start Install Scalelite"

echo "Starting wget file scalelite in /etc/default"
cd /etc/default
rm -rf scalelite
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/scalelite
echo "Download scalelite complete"

echo "mkdir /mnt/scalelite-recordings"
sudo mkdir -p /mnt/scalelite-recordings
cd /mnt
chmod -R 0777 scalelite-recordings/
echo "done"
# Create the spool directory for recording transfer from BigBlueButton
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/spool
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/spool
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/spool

# Create the temporary (working) directory for recording import
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/recording/scalelite
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/recording/scalelite
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/recording/scalelite

# Create the directory for published recordings
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/published
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/published
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/published

# Create the directory for unpublished recordings
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/unpublished
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/unpublished
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/unpublished

echo "Create network"
docker network create scalelite

echo "Download file .service to /etc/systemd/system"

cd /etc/systemd/system/
sudo rm -rf scalelite.target
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/systemd/scalelite.target
systemctl enable scalelite.target

sudo rm -rf scalelite-api.service
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/systemd/scalelite-api.service
systemctl enable scalelite-api.service
  
sudo rm -rf scalelite-nginx.service
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/systemd/scalelite-nginx.service
systemctl enable scalelite-nginx.service
  
sudo rm -rf scalelite-poller.service
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/systemd/scalelite-poller.service
systemctl enable scalelite-poller.service
  
sudo rm -rf scalelite-recording-importer.service
wget https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/systemd/scalelite-recording-importer.service
  
systemctl enable scalelite-recording-importer.service
systemctl restart scalelite.target

read -p "POSTGESQL HAS BEEN CREATED ? If Yes, Press ENTER to continue setup db from scale"

docker exec -it scalelite-api bin/rake db:setup
  
echo "Next, please run command to check again"
echo "systemctl status scalelite-api.service scalelite-nginx.service "
echo "systemctl status scalelite-recording-importer.service scalelite-poller.service"
echo ">>>"
read -p "RUN 2 CMN above then Press enter to continue"

echo " Try setting up database for scalelite"
docker exec -it scalelite-api bin/rake db:setup

echo "Fix DB error"
docker exec -it scalelite-api bin/rake db:setup -DISABLE_DATABASE_ENVIRONMENT_CHECK=1

echo "................................................"

echo "#CHANGE BEFORE USE This setting to mount folder scalelite to NFS server"
echo "vi /etc/fstab"
echo "--------------------------------------------------------------------------------"
echo "IPNFS:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0"
echo "and"
echo :sudo mount file.vconnect.greenlife-vn.com:/mnt/scalelite-recordings /mnt/scalelite-recordings"
echo "--------------------------------------------------------------------------------"
echo "verify with: df -h"
read -p "Press enter to continue"


echo "=================================================================="
cd /root/
echo "Add crontab for Checking mounting /mnt/scalelite-recordings. auto mount after startup"

wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/croncheckmount.sh
chmod +x croncheckmount.sh

#!/bin/bash

cron="@reboot sh /root/croncheckmount.sh"
(crontab -u root -l; echo "$cron" ) | crontab -u root -
echo "==============================DONE================================"



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
sudo ufw allow 22
sudo ufw reload
sudo ufw status verbose


echo "UPDATE DATABASE AFTER CONNECT ALL SERVER AND CONFIG IN CLIENT"
#read -p "Press enter to continue"

docker exec -it scalelite-api bin/rake db:setup
docker exec -t scalelite-api bundle exec rake db:migrate
docker exec -it scalelite-api bin/rake db:setup -DISABLE_DATABASE_ENVIRONMENT_CHECK=1
docker exec -i scalelite-api bundle exec rake poll:all

cd /root
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/adminscalelite.sh
chmod +x adminscalelite.sh
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/mscale.sh
chmod +x mscale.sh

wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/addserver.sh
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/enableserver.sh
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/removeserver.sh

chmod +x addserver.sh
chmod +x enableserver.sh
chmod +x removeserver.sh

echo "download and chomd for adminscalelite.sh, mscale.sh, addserver.sh, enableserver.sh, removeserver.sh completed"

echo ""

echo "INSTALL COMPLETED"

