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

read -p "Enter Domain of HOSTNAME this server: " DOMAINBBBX
echo "Data received"
sudo hostname $DOMAINBBBX

sudo apt-get update
apt install -y nfs-server
apt install nfs-kernel-server
echo ""
echo "Edit /etc/exports with content below"
echo "/mnt/scalelite-recordings    *(rw,sync,no_root_squash)"
echo "Then........."
echo "cat /etc/exports - ----- To check"

read -p "Press enter to Restart NFS server"


sudo /etc/init.d/nfs-kernel-server restart

sudo exportfs -a
sudo systemctl restart nfs-kernel-server


echo "CHANGE BEFORE USE - Manual add in /etc/exports"
echo "vi /etc/exports"
echo "--------------------------------------------------------------------------------"
echo "/mnt/scalelite-recordings \"
echo "157.245.196.93(rw,sync) \"
echo "157.245.192.5(rw,sync) \"
echo "188.166.242.86(rw,sync) \"
echo "143.198.82.130(rw,sync)"
echo "--------------------------------------------------------------------------------"
echo "verify with: sudo exportfs -a"


read -p "Press enter to continue"

echo "Check with command: exportfs"
echo "Create DIR for /mnt/scalelite-recordings"
mkdir -p /mnt/scalelite-recordings
mkdir -p /mnt/scalelite-recordings/var/bigbluebutton/spool
cd /mnt/scalelite-recordings/var/bigbluebutton
chmod -R 0777 spool/

exportfs -a

echo "Restart NFS server"
sudo /etc/init.d/nfs-kernel-server restart

echo "Start Firewall add domain and IP"

echo "ufw allow from IP4HERE"
# sudo ufw allow from 192.168.100/24 to any port nfs
# sudo ufw allow from 192.168.100/24 to any port nfs
# sudo ufw allow from 192.168.100/24 to any port nfs
ufw --force enable
ufw allow from 157.245.196.93 to any port nfs
ufw allow from 157.245.192.5 to any port nfs
ufw allow from 188.166.242.86 to any port nfs
ufw allow from 143.198.82.130 to any port nfs
ufw allow from 167.172.69.196 to any port nfs
ufw allow from 143.198.89.90 to any port nfs
sudo ufw allow 22
sudo ufw allow 2049
sudo ufw allow 111
sudo ufw reload
read -p "Press enter to continue"

echo "Firewall Config Completed"

cd /root
wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample/mnfs.sh
chmod +x mnfs.sh
