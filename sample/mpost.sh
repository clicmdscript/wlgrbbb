quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "======================Start POSTGESQL==================================="
echo "01. sudo service postgresql restart"
echo "========================================================================"
echo "02. sudo service postgresql start"
echo "========================================================================"
echo "03. sudo service postgresql stop"
echo "========================================================================"
echo "04. sudo ufw status"
echo "========================================================================"
echo "05. sudo ufw reload"
echo "========================================================================"
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 

1) sudo service postgresql start
	read junk;;
  
2) sudo service postgresql start 
	read junk;;
3) sudo service postgresql stop 
	read junk;;
4) sudo ufw status 
	read junk;; 
5) sudo ufw reload
	read junk;; 
 
 
 
 
Q|q) quit=y;; 
*) echo "Try Again" 
sleep 2
esac 
done 
echo "I'm done, Bye bye"



