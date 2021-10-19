#!/bin/bash
# file quan trong: vi /etc/exports
sudo apt-get update
apt-get install -y nfs-server 
apt-get install -y nfs-kernel-server

echo "/mnt/scalelite-recordings    *(rw,sync,no_root_squash)" > /etc/exports
cat /etc/exports

sudo /etc/init.d/nfs-kernel-server restart

#read -p "Enter domain of scalelite server: " dmnamescal
#echo "Data received"

echo "Manual add in /etc/exports"
echo "/mnt/scalelite-recordings \" 
echo "domainscale.dm.com(rw,sync,no_root_squash,no_subtree_check) "

echo "Create DIR for /mnt/scalelite-recordings"
sudo mkdir -p /mnt/scalelite-recordings

echo "Restart NFS server"
sudo /etc/init.d/nfs-kernel-server restart

echo "Start Firewall add domain and IP"

sudo apt update
sudo apt install -y nfs-kernel-server nfs-common

read -p "Enter IPv4 of scalelite server: " ip4scalelite
echo "Data received"

ufw allow from $ip4scalelite
sudo ufw allow 22
echo "sudo ufw enable"
echo "sudo ufw reload"

echo "Firewall Config Completed"
