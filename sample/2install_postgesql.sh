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
echo "host postgres scalelite IPSCALE/32 trust"
echo "host postgres scalelite IPREIDIS/32 trust"
echo "host postgres scalelite IPBB1/32 trust"
echo "host postgres scalelite IPBB2/32 trust"
echo "host postgres scalelite IPBB3/32 trust"
echo "host postgres scalelite IPNFS/32 trust"
read -p "Press enter to continue"

echo "CREATE NEW DATABASE WITH OTHER SSH LOGIN"
echo "sudo -u postgres psql"
echo ""
echo "CREATE USER scalelite WITH PASSWORD 'ccf52c0aa69d1929';"
echo "CREATE DATABASE scalelite;"
echo "GRANT ALL PRIVILEGES ON DATABASE "scalelite" to scalelite;"
echo "ALTER ROLE scalelite SUPERUSER;"
echo ""
echo ""
read -p "Press enter to continue"
echo ""
echo ""
echo "sudo service postgresql restart"
sudo service postgresql restart
echo ""
ufw --force enable
ufw allow from 157.245.196.93
ufw allow from 157.245.192.5
ufw allow from 188.166.242.86
ufw allow from 143.198.82.130
ufw allow from 167.172.69.196
ufw allow from 143.198.89.90
sudo ufw allow 5432
sudo ufw allow 22
sudo ufw reload

echo "Allow IP of scalelite server"


