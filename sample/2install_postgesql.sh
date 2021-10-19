#!/bin/bash

echo "Update and Install Postgesql"
sudo apt-get update
sudo apt-get install postgresql
sudo apt-get install -y postgresql postgresql-contrib


echo "Manual edit"
echo "vi /etc/postgresql/12/main/postgresql.conf"
echo "listen_addresses = '*' # what IP address(es) to listen on;"
echo ""

echo -n "Please edit with command with other login SSH, then press N to continue? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, Next step.!"
fi



echo "vi /etc/postgresql/12/main/pg_hba.conf"
echo "ipv4 local connections"
echo "host	all 	all		0.0.0.0/0	md5"
echo "Change authentication method to "md5" so that it will use encrypted password to authenticate users."

echo "Add all IP address of system to allow at /etc/postgresql/12/main/pg_hba.conf"
echo "vi /etc/postgresql/12/main/pg_hba.conf"
echo "With Format below"
echo "host postgres scalelite 157.230.44.12/32 trust"
echo "host postgres scalelite 165.22.107.61/32 trust"

echo -n "Please edit more in pg_hba.conf with other login SSH, then press N to continue? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, Next step.!"
fi


echo "Password for PostgeSQL"
openssl rand -hex 8
echo "Save it"
echo ""
echo "Open new connect ssh and do command below create SQL"
echo ""
echo "sudo -u postgres psql"
echo "CREATE USER scalelite WITH PASSWORD 'PASS_FROM_HEX8';"
echo "CREATE DATABASE scalelite;"
echo "GRANT ALL PRIVILEGES ON DATABASE "scalelite" to scalelite;"
echo "ALTER ROLE scalelite SUPERUSER;"
echo "\q to EXIT SQL"

echo -n "Please compplete create SQL other login SSH, then press N to continue? (y/n) "
read yesno < /dev/tty

if [ "x$yesno" = "y" ];then
   # Yes
else
   # No
   echo "Ok, Next step.!"
fi



echo ""
echo "sudo service postgresql restart"
sudo systemsctl restart postgesql
echo ""
echo "Allow IP of scalelite server"
read -p "Enter IP of Scalelite server: " IPSCALELITE
echo "Data received"
echo ""

ufw allow from $IPSCALELITE
sudo ufw allow 5432
sudo ufw allow 22

sudo ufw reload

echo "All done for Postgesql"
echo "Please allow all IP of system to firewall"
echo "sudo ufw allow from IP"




