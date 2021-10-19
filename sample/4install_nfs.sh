#!/bin/bash

sudo apt-get update
apt-get install -y nfs-server nfs-kernel-server

echo "/mnt/scalelite-recordings    *(rw,sync,no_root_squash)" > /etc/exports
cat /etc/exports

sudo /etc/init.d/nfs-kernel-server restart
sudo systemctl status nfs-server


read -p "Enter domain of scalelite server: " dmnamescal
echo "Data received"

echo "/mnt/scalelite-recordings \ " > /etc/exports
echo "$dmnamescal(rw,sync,no_root_squash,no_subtree_check) " > /etc/exports

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
sudo ufw enable

sudo ufw status verbose
sudo ufw app list

udo ufw show added
sudo ufw reload

echo "Firewall Config Completed"