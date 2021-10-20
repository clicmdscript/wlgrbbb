echo "ALL IP and DOMAIN"
read -p "Enter IP of NFS server:: " NFS_IP
read -p "Enter DOMAIN of NFS server:: " NFS_DM
read -p "Enter IP of POSTGESQL server:: " POSTGESQL_IP
read -p "Enter DOMAIN of POSTGESQL server:: " POSTGESQL_DM
read -p "Enter IP of REDIS server:: " REDIS_IP
read -p "Enter DOMAIN of REIDS server:: " REDIS_DM
read -p "Enter IP of SCALELITE server:: " SCAL_IP
read -p "Enter DOMAIN of SCALELITE server:: " SCAL_DM

read -p "Enter IP of BBB1 server:: " BBB1_IP
read -p "Enter DOMAIN of BBB1 server:: " BBB1_DM

read -p "Enter IP of BBB2 server:: " BBB2_IP
read -p "Enter DOMAIN of BBB2 server:: " BBB2_DM

read -p "Enter IP of BBB3 server:: " BBB3_IP
read -p "Enter DOMAIN of BBB3 server:: " BBB3_DM
echo ""
echo ""
echo "//////////////REDIS SERVER/////////////////////"
echo "IP:			$REDIS_IP"
echo "Domain:	$REDIS_DM"
echo "PORT: 6379"
echo ""
echo ""
echo "//////////////POSTGESQL SERVER/////////////////"
echo "IP:			$POSTGESQL_IP"
echo "Domain:	$POSTGESQL_DM"
echo "Port: 5432"
echo "scalelite:"		
echo "2387a7e143aea828"	
echo "scalelite"	
echo ""
echo "//////////////SCALELITE SERVER/////////////////"
echo "IP:	    $SCAL_IP
echo "Domain:	$SCAL_DM
echo "SECRET_KEY_BASE64=c8359900760b05f9dc4c9d5e712c9c683a900af1f7fb0f1163eac87e265c0707aa307c5ef79ae6977f5abe2b61104622e42328d824ba4790e1fe11ecb208fece"
echo "LOADBALANCER_SECRET32=a6e7c4a36225fb193983961efb386e478a79f911b298877d1eb14d9f4d2b5f66"
echo "SCALELITE_RECORDING_DIR=/mnt/scalelite-recordings/var/bigbluebutton"
echo ""
echo ""
echo "//////////////BBB SERVER//////////////////////"
echo "BBB1:"
echo "IP:       $BBB1_IP"
echo "Domain:   $BBB2_IP"
echo ""
echo ""
echo "BBB2:"
echo "IP:	      $BBB2_IP"
echo "DOMAIN    $BBB2_DM"
echo ""
echo ""
echo "BBB3:"
echo "IP:	      $BBB3_IP"
echo "Domain:	  $BBB3_IP"
echo ""
echo ""
echo "//////////////NFS SERVER//////////////////////"
echo "IP:       $NFS_IP"
echo "Domain:   $NFS_DM"
echo "DIR:      /mnt/scalelite-recordings"
echo ""
echo ""
echo "==============================BBB server"
echo "vi /etc/fstab"
echo "--------------------------------------------------------------------------------"
echo "$SCAL_IP:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0"
echo "--------------------------------------------------------------------------------"
echo "verify with: df -h"
echo ""
echo ""
echo "==============================Scalelite server"
echo "vi /etc/fstab"
echo "--------------------------------------------------------------------------------"
echo "$NFS_IP:/mnt/scalelite-recordings /mnt/scalelite-recordings nfs defaults 0 0"
echo "--------------------------------------------------------------------------------"
echo "verify with: df -h"
echo ""
echo ""
echo "vi /etc/exports"
echo "--------------------------------------------------------------------------------"
echo "/mnt/scalelite-recordings BBB_IP1(rw,sync,no_root_squash,no_subtree_check)"
echo "/mnt/scalelite-recordings BBB_IP2(rw,sync,no_root_squash,no_subtree_check)"
echo "/mnt/scalelite-recordings BBB_IP3(rw,sync,no_root_squash,no_subtree_check)"
echo "--------------------------------------------------------------------------------"
echo "verify with: sudo exportfs -a"
echo ""
echo ""
echo "==============================NFS server"
echo ""
echo "vi /etc/exports"
echo "--------------------------------------------------------------------------------"
echo "/mnt/scalelite-recordings $SCAL_IP(rw,sync,no_root_squash,no_subtree_check)"
echo "--------------------------------------------------------------------------------"
echo "verify with: sudo exportfs -a"
echo""
echo "==========FIREWWALL============"
echo "==============================="
echo "==========REDIS================"
echo "sudo ufw enable"
echo "ufw allow from $BBB1_IP"
echo "ufw allow from $BBB2_IP"
echo "ufw allow from $BBB3_IP"
echo "ufw allow from $SCAL_IP"
echo "ufw allow from $POSTGESQL_IP"
echo "ufw allow from $NFS_IP"
echo "sudo ufw allow 6379"
echo "sudo ufw allow 22"
echo "sudo ufw reload"
echo "==============================="
echo "==========POSTGESQL============"
echo "sudo ufw enable"
echo "ufw allow from $BBB1_IP"
echo "ufw allow from $BBB2_IP"
echo "ufw allow from $BBB3_IP"
echo "ufw allow from $SCAL_IP"
echo "ufw allow from $REDIS_IP"
echo "ufw allow from $NFS_IP"
echo "sudo ufw allow 5432"
echo "sudo ufw allow 22"
echo "sudo ufw reload"
echo "==============================="
echo "==========NFS=================="
echo "sudo ufw enable"
echo "ufw allow from $BBB1_IP"
echo "ufw allow from $BBB2_IP"
echo "ufw allow from $BBB3_IP"
echo "ufw allow from $SCAL_IP"
echo "ufw allow from $REDIS_IP"
echo "ufw allow from $NFS_IP"
echo "sudo ufw allow 22"
echo "sudo ufw allow 2049"
echo "sudo ufw allow 111"
echo "sudo ufw reload"














