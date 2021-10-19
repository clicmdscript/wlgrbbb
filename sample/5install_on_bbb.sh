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

read -p "Enter Domain of this BBB server: " DOMAINBBB1
echo "Data received"
read -p "Enter Email to generate ssl: " EMAILBBB1
echo "Data received"
read -p "Version BBB want to install 23 or 240: " BBBVER1
echo "Data received"
echo ""
wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -v bionic-$BBBVER1 -s $DOMAINBBB1 -e $EMAILBBB1 -w -g

echo "BBB DONE"
echo ""
echo "NFS COMMON INSTALL"
sudo apt-get install -y nfs-common

echo "Done"
echo "# Create a new group with GID 2000"
groupadd -g 2000 scalelite-spool
echo "# Add the bigbluebutton user to the group"
usermod -a -G scalelite-spool bigbluebutton

echo "# Create the spool directory for recording transfer from BigBlueButton"
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/spool
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/spool
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/spool

echo "# Create the temporary (working) directory for recording import"
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/recording/scalelite
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/recording/scalelite
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/recording/scalelite

echo "# Create the directory for published recordings"
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/published
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/published
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/published

echo "# Create the directory for unpublished recordings"
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/unpublished
chown 1000:2000 /mnt/scalelite-recordings/var/bigbluebutton/unpublished
chmod 0775 /mnt/scalelite-recordings/var/bigbluebutton/unpublished

echo "writing to /etc/fstab with scalelite domain/mnt/scalelite-recoring"
read -p "Enter Scalelite domain scalelite.scalelite.domain: " scaliltedomain
echo "Data received"
echo "$scaliltedomain:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0 " > /etc/fstab

echo "Edit .env file on BBB"

cd /root/greenlight
cp .env 1.env

read -p "Enter Scalelite keybase hex64: " keybasehex64
echo "Data received"
read -p "Enter Scalelite secret hex32: " keysecrethex32
echo "Data received"
read -p "Enter Scalelite domain scalelite.scalelite.domain: " scaliltedomain
echo "Data received"

echo "Replace data on .env file of Greenlight"
echo "Update key base of scalelite hex 64"
sed -i 's/SECRET_KEY_BASE=.*/SECRET_KEY_BASE=$keybasehex64/g' .env
sed -i 's/BIGBLUEBUTTON_ENDPOINT=.*/BIGBLUEBUTTON_ENDPOINT=https://$scaliltedomain/bigbluebutton/api/g' .env
sed -i 's/BIGBLUEBUTTON_SECRET=.*/BIGBLUEBUTTON_SECRET=$keysecrethex32/g' .env

echo "Done for .ENV"
echo "Next, add infomation of .env file with NEW POSTGESQL"
read -p "Enter Postgesql IP address: " DB_HOST1
echo "Data received"
read -p "Enter Postgesql DB_USERNAME: " DB_USERNAME1
echo "Data received"
read -p "Enter Postgesql DB_PASSWORD: " DB_PASSWORD1
echo "Data received"

sed -i 's/DB_HOST=.*/DB_HOST=$DB_HOST1/g' .env
sed -i 's/DB_USERNAME=.*/DB_HOST=$DB_USERNAME1/g' .env
sed -i 's/DB_PASSWORD=.*/DB_HOST=$DB_PASSWORD1/g' .env

echo "Done for PostgeSQL update in .ENV file"
echo ""
echo "Comment internal PostgreSQL in docker-compose.yml"
echo ""
sed -i 's/links:/#links:/g' docker-compose.yml
sed -i 's/- db/#- db:/g' docker-compose.yml
sed -i 's/ db:/# db:/g' docker-compose.yml
sed -i 's/image: postgres:9.5/#image: postgres:9.5/g' docker-compose.yml
sed -i 's/restart: unless-stopped/#restart: unless-stopped/g' docker-compose.yml
sed -i 's/ports:/#ports:/g' docker-compose.yml
sed -i 's/- 127.0.0.1:5432:5432/#- 127.0.0.1:5432:5432:/g' docker-compose.yml
sed -i 's/volumes:/#volumes:/g' docker-compose.yml
sed -i 's/- ./db/production:/var/lib/postgresql/data/#- ./db/production:/var/lib/postgresql/data/g' docker-compose.yml
sed -i 's/environment:/#environment:/g' docker-compose.yml
sed -i 's/- POSTGRES_DB=postgres/#- POSTGRES_DB=postgres/g' docker-compose.yml
sed -i 's/- POSTGRES_USER=postgres/#- POSTGRES_USER=postgres/g' docker-compose.yml
sed -i 's/- POSTGRES_PASSWORD=password/#- POSTGRES_PASSWORD=password/g' docker-compose.yml

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
bbb-conf --clean


echo "Infomation of this server"
echo "Domain of this server: $DOMAINBBB1"
echo "Secret KEY"
bbb-conf --secret



echo "Setting up record config with scalelite"

cd /root/
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/scale/setup-recordings.sh
chmod +x setup-recordings.sh
./setup-recordings.sh











