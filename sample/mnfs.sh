quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "======================Start NFS==================================="
echo "01. sudo /etc/init.d/nfs-kernel-server restart"
echo "========================================================================"
echo "02. exportfs -a"
echo "========================================================================"
echo "03. sudo ufw status"
echo "========================================================================"
echo "04. sudo ufw reload"
echo "========================================================================"
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 

1) sudo /etc/init.d/nfs-kernel-server restart
	read junk;;
  
2) exportfs -a
	read junk;;
3) sudo ufw status 
	read junk;; 
4) sudo ufw reload
	read junk;; 
 
 
 
 
Q|q) quit=y;; 
*) echo "Try Again" 
sleep 2
esac 
done 
echo "I'm done, Bye bye"



