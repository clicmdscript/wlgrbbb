echo "Hex64"
echo "------------------------------------------------------------"
openssl rand -hex 64
echo "------------------------------------------------------------"
echo "Hex32"
echo "------------------------------------------------------------"
openssl rand -hex 32
echo "------------------------------------------------------------"
echo "Hex8"
echo "------------------------------------------------------------"
openssl rand -hex 8
echo "------------------------------------------------------------"
echo ""
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
read -p "Enter HEX64 value:: " HEX64
read -p "Enter HEX32 value:: " HEX32
read -p "Enter HEX8 value:: " HEX8
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
echo "$HEX8"	
echo "scalelite"

echo "------------Content of create Database---------------------------------"
echo "sudo -u postgres psql"
echo "CREATE USER scalelite WITH PASSWORD '$HEX8';"
echo "CREATE DATABASE scalelite;"
echo "GRANT ALL PRIVILEGES ON DATABASE "scalelite" to scalelite;"
echo "ALTER ROLE scalelite SUPERUSER;"
echo "\q to EXIT SQL"
echo" sudo service postgresql restart"
echo "------------Content of create Database---------------------------------"
echo ""
echo "//////////////SCALELITE SERVER/////////////////"
echo "IP:	    $SCAL_IP
echo "Domain:	$SCAL_DM
echo "SECRET_KEY_BASE64=$HEX64"
echo "LOADBALANCER_SECRET32=$HEX32"
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
echo "//////////////FILE /etc/default/scalelite /////////////////////"
echo ""
echo" URL_HOST=$SCAL_DM"
echo" SECRET_KEY_BASE=$HEX64"
echo" LOADBALANCER_SECRET=$HEX32"
echo" DATABASE_URL=postgres://scalelite:$HEX8@$POSTGESQL_DM:5432/scalelite"
echo" REDIS_URL=redis://redis@$REDIS_DM:6379"
echo" SCALELITE_TAG=v1.1"
echo" SCALELITE_RECORDING_DIR=/mnt/scalelite-recordings/var/bigbluebutton"
echo" NGINX_SSL=true"
echo" SCALELITE_NGINX_EXTRA_OPTS=--mount type=bind,source=/etc/letsencrypt,target=/etc/nginx/ssl,readonly"
echo ""
echo "///////////////END /etc/default/scalelite /////////////////////"

echo "==========FIREWWALL============"
echo "==============================="
echo "==========REDIS================"
echo "yes | sudo ufw enable"
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
echo "yes | sudo ufw enable"
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
echo "yes | sudo ufw enable"
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














