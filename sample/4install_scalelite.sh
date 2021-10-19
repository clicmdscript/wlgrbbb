#!/bin/bash
echo "install DOCKER"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce

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

read -p "Enter domain of scalelite scalilte.domain.com" scalelitedomain
read -p "Enter Email for SSL generate" emailssl

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


echo "NFS config"
sudo apt-get install -y nfs-common
read -p "Enter NFS domain nfs.scalelite.domain: " nfsdomain
echo "$nfsdomain:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0" > /etc/fstab

echo "......................................................................"
echo "Start Install Scalelite"

echo "SECRET_KEY_BASE="
openssl rand -hex 64
echo ""
echo "LOADBALANCER_SECRET="
openssl rand -hex 32
echo ""

read -p "Enter scalelite URL_HOST=: " URLHOST1
echo "Data received"
read -p "Enter scalelite SECRET_KEY_BASE= (64): " SECRETKEYBASE
echo "Data received"
read -p "Enter scalelite LOADBALANCER_SECRET= (32): " LOADBLSECRET
echo "Data received"
read -p "Enter PostgeSQL DATABASE_NAME=: " DATABASE_NAME2
echo "Data received"
read -p "Enter PostgeSQL USER_NAME=: " USER_NAME2
echo "Data received"
read -p "Enter PostgeSQL PASSWORD (8)=: " PASS2
echo "Data received"
read -p "Enter PostgeSQL Domain Database postgesql.domain.com=: " DOMAINSQL2
echo "Data received"
read -p "Enter Redis URL redis.domain.com: " REDISURL3
echo "Data received"
echo "Starting create file scalelite in /etc/default"

cat > /etc/default/scalelite <<SCALECONF
URL_HOST=$URLHOST1
SECRET_KEY_BASE=$SECRETKEYBASE
LOADBALANCER_SECRET=$LOADBLSECRET
DATABASE_URL=postgresql://USER_NAME2:$PASS2@$DOMAINSQL2/$DATABASE_NAME2
REDIS_URL=redis://REDISURL3:6379
SCALELITE_TAG=v1.1
SCALELITE_RECORDING_DIR=/mnt/scalelite-recordings/var/bigbluebutton
NGINX_SSL=true
SCALELITE_NGINX_EXTRA_OPTS=--mount type=bind,source=/etc/nginx/ssl,target=/etc/nginx/ssl,readonly
SCALECONF
echo "Done"
echo "Review file scalelite created"
cat /etc/default/scalelite

echo -n "CHECK file /etc/default/scalte is OK? press N to continue? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, Next step.!"
fi



echo "Download file .service to /etc/systemd/system"

  cd /etc/systemd/system/
  sudo rm -rf scalelite.target
  wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/scalelite.target
  systemctl enable scalelite.target

  sudo rm -rf scalelite-api.service
  wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/scalelite-api.service
  systemctl enable scalelite-api.service
  
  sudo rm -rf scalelite-nginx.service
  wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/scalelite-nginx.service
  systemctl enable scalelite-nginx.service
  
  sudo rm -rf scalelite-poller.service
  wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/scalelite-poller.service
  systemctl enable scalelite-poller.service
  
  sudo rm -rf scalelite-recording-importer.service
  wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/scalelite-recording-importer.service
  
  systemctl enable scalelite-recording-importer.service
  systemctl restart scalelite.target
  
  echo "Next, please run command to check again"
  echo "systemctl status scalelite-api.service scalelite-nginx.service "
  echo "systemctl status scalelite-recording-importer.service scalelite-poller.service"


echo -n "Please compplete 2 command with other login SSH, then press N to continue? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, Next step.!"
fi



echo " Try setting up database for scalelite"
docker exec -it scalelite-api bin/rake db:setup


echo -n "if get error, PRESS Y to fix, if all ok, PRESS N to continue setup? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   docker exec -it scalelite-api bin/rake db:setup -DISABLE_DATABASE_ENVIRONMENT_CHECK=1
else
   # No
   echo "Ok, Next step.!"
fi



echo "Install NFS server to connect with BBB record"
apt-get install -y nfs-server nfs-kernel-server

sudo /etc/init.d/nfs-kernel-server restart



echo "vi /etc/exports"
echo "/mnt/scalelite-recordings \ "
echo "bbb1.roauset.com(rw,sync,no_root_squash,no_subtree_check) \ "
echo "bbb2.roauset.com(rw,sync,no_root_squash,no_subtree_check)"


echo -n "Please vi /etc/exports with other login SSH, then press N to continue? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, Next step.!"
fi


echo "Check with exportfs command"
sudo /etc/init.d/nfs-kernel-server restart


mkdir /mnt/scalelite-recordings
cd /mnt
chmod -R 0777 scalelite-recordings/

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


echo "vi /etc/exports"
echo "edit like below"
echo "................................................"
echo "/mnt/scalelite-recordings \ "
echo "bbb1.roauset.com(rw,sync,no_root_squash,no_subtree_check) \ "
echo "bbb2.roauset.com(rw,sync,no_root_squash,no_subtree_check) \ "
echo "bbb3.roauset.com(rw,sync,no_root_squash,no_subtree_check)"
echo "................................................"

echo -n "Wating (y/n), edit in /etc/exports in other SSH connect. press N to coutinue "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, NEXT step.!"
fi


echo "vi /etc/fstab"
echo "bbb1.roauset.com:/mnt/bbb           /mnt/bbb       nfs     defaults                0       0"
echo "bbb2.roauset.com:/mnt/bbb           /mnt/bbb       nfs     defaults                0       0"
echo "bbb3.roauset.com:/mnt/bbb           /mnt/bbb       nfs     defaults                0       0"


echo -n "Wating (y/n), edit in /etc/fstab in other SSH connect. press N to coutinue "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, NEXT step.!"
fi


read -p "Enter domain of NFS server for MOUNTING NOW: " NFSREADYMNT
echo "Data received"
echo "Mounting............."
sudo mount $NFSREADYMNT:/mnt/scalelite-recordings /mnt/scalelite-recordings
echo "done mount"
echo "restart nfs server"
sudo systemctl start nfs-kernel-server.service
getent group | grep scal
echo "Should showing like"
echo "scalelite-spool:x:2000:bigbluebutton"
echo "Check with DF -h"





