#!/bin/bash
#NOTE
# Add all ipaddress of scalelite, BBB in firewall

echo "Update and Install Postgesql"
sudo apt-get update
sudo apt-get install postgresql
sudo apt-get install -y postgresql postgresql-contrib


echo "Manual edit"
echo "vi /etc/postgresql/12/main/postgresql.conf"
echo "listen_addresses = '*' # what IP address(es) to listen on;"
echo ""
read -p "Press enter to continue"

echo "vi /etc/postgresql/12/main/pg_hba.conf"
echo "ipv4 local connections"
echo "host	all 	all		0.0.0.0/0	md5"
echo "Change authentication method to "md5" so that it will use encrypted password to authenticate users."
read -p "Press enter to continue"


echo "Add all IP address of system to allow at /etc/postgresql/12/main/pg_hba.conf"
echo "vi /etc/postgresql/12/main/pg_hba.conf"
echo "With Format below"
echo "host postgres scalelite 157.230.44.12/32 trust"
echo "host postgres scalelite 165.22.107.61/32 trust"

read -p "Press enter to continue"


echo "Password for PostgeSQL"
openssl rand -hex 8
echo "Save it"
echo ""
echo "Open new connect ssh and do command below create SQL"
echo ""
echo "Password Generator is"
openssl rand -hex 8
echo "sudo -u postgres psql"
echo "CREATE USER scalelite WITH PASSWORD 'PASS_FROM_HEX8';"
echo "CREATE DATABASE scalelite;"
echo "GRANT ALL PRIVILEGES ON DATABASE "scalelite" to scalelite;"
echo "ALTER ROLE scalelite SUPERUSER;"
echo "\q to EXIT SQL"
read -p "Press enter to continue"


echo ""
echo "sudo service postgresql restart"
sudo service postgresql restart
echo ""
echo "Allow IP of scalelite server"
echo ""
echo "ufw allow from IP SCALELITE"
echo "sudo ufw allow 5432"
echo "sudo ufw allow 22"
echo "sudo ufw reload"

read -p "Press enter to continue"


echo "All done for Postgesql"
echo "Please allow all IP of system to firewall"
echo "sudo ufw allow from IP"
echo "enable firewall with command"
echo "sudo ufw enable"






