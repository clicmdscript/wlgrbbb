#!/bin/bash
# Cấu hình tương tự cho Scalelite server
# File Config server /etc/exports
# de mount dc tu server client, phai co domain trong file exports tren nfs server
# File config /etc/exports
# /etc/fstab: Để tự động mount một thư mục NFS trên hệ thống.
# cấu hình NFS server /etc/export để xác định các máy client nào có thể truy cập được file được chia sẽ trên NFS server bằng trình soạn thảo vi.
# Cú pháp như sau:
# /mnt/sharedfolder client1IP(rw,sync,no_root_squash,no_subtree_check)
# /mnt/sharedfolder client2IP(rw,sync,no_root_squash,no_subtree_check)
# sudo exportfs -a
# Finally, in order to make all the configurations take effect, restart the NFS Kernel server as follows:
# sudo systemctl restart nfs-kernel-server
# sudo ufw allow from 192.168.100/24 to any port nfs


################################
# sudo apt-get update
# sudo apt-get install nfs-common
######## Mount from client
######## sudo mkdir -p /mnt/sharedfolder_client
######## sudo mount 192.168.100.5:/mnt/sharedfolder /mnt/sharedfolder_client
######## If reboot lost, add to etc/fstab
######## file config: /etc/fstab
######## 192.168.1.22:/share      /access  nfs      defaults      0      0
# umount /access
# mount /access
# mount | tail -1
# 192.168.1.22:/share on /access type nfs (rw,addr=192.168.1.22)

sudo apt-get update
apt-get install -y nfs-server
apt-get install -y nfs-kernel-server

echo "/mnt/scalelite-recordings    *(rw,sync,no_root_squash)" > /etc/exports
cat /etc/exports

sudo /etc/init.d/nfs-kernel-server restart

#read -p "Enter domain of scalelite server: " dmnamescal
#echo "Data received"


sudo exportfs -a
sudo systemctl restart nfs-kernel-server


echo "Manual add in /etc/exports"
echo "/mnt/scalelite-recordings \" 
echo "domainscale.dm.com(rw,sync,no_root_squash,no_subtree_check) "

echo "Check with command: exportfs"
echo "Create DIR for /mnt/scalelite-recordings"
sudo mkdir -p /mnt/scalelite-recordings

echo "Restart NFS server"
sudo /etc/init.d/nfs-kernel-server restart

echo "Start Firewall add domain and IP"

echo "ufw allow from IP4HERE"
# sudo ufw allow from 192.168.100/24 to any port nfs
# sudo ufw allow from 192.168.100/24 to any port nfs
# sudo ufw allow from 192.168.100/24 to any port nfs

sudo ufw allow 22
echo "sudo ufw enable"
echo "sudo ufw reload"
echo "sudo ufw status"


echo "Firewall Config Completed"
