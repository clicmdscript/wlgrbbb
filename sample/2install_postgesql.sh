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

echo "Save it"
echo ""

echo ""
echo "sudo service postgresql restart"
sudo service postgresql restart
echo ""
echo "Allow IP of scalelite server"


