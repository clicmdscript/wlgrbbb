quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "======================Start Redis========================================"
echo "01. sudo systemctl enable redis-server.service"
echo "========================================================================"
echo "02. sudo service redis-server restart"
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

1) sudo systemctl enable redis-server.service
	read junk;;
  
2) sudo service redis-server restart 
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

