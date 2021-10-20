quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "============================BBB MENU===================================="
echo "01. bbb-conf --restart"
echo "========================================================================"
echo "02. bbb-conf --clean"
echo "========================================================================"
echo "03. bbb-conf --secret"
echo "========================================================================"
echo "04. bbb-conf --rebuild"
echo "========================================================================"
echo "05. bbb-conf --start"
echo "========================================================================"
echo "06. bbb-conf --stop"
echo "========================================================================"
echo "07. bbb-conf --watch"
echo "========================================================================"
echo "8. sudo ufw status"
echo "========================================================================"
echo "9. sudo ufw reload"
echo "========================================================================"
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 

1) bbb-conf --restart
	read junk;;
2) bbb-conf --clean
	read junk;;
3) bbb-conf --secret 
	read junk;; 
4) bbb-conf --rebuild
	read junk;; 
5) bbb-conf --start
 	read junk;;
6) bbb-conf --stop
 	read junk;;
7) bbb-conf --watch
 	read junk;; 
8) sudo ufw status
	read junk;;
9) sudo ufw reload
	read junk;;
 
 
Q|q) quit=y;; 
*) echo "Try Again" 
sleep 2
esac 
done 
echo "I'm done, Bye bye"



