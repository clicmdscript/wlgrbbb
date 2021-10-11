quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo "======================BBB Command========================================="
echo "01. List recordings"
echo "02. Watch recordings"
echo "03. Rebuild every recording"
echo "04. Delete a recording"
echo "05. Debug recordings"
echo "06. Record Enable a workflow"
echo "07. Record Disable a workflow"
echo "08. sudo bbb-conf --clean"
echo "09. sudo bbb-conf --check"
echo "10. sudo bbb-conf --debug"
echo "11. sudo bbb-conf --network"
echo "12. sudo bbb-conf --start"
echo "13. sudo bbb-conf --stop"
echo "14. sudo bbb-conf --watch"
echo "15. sudo bbb-conf --restart"
echo "16. Greenlight Docker create User account"
echo "17. Greenlight Docker create Admin account"
echo "18. "
echo "19. "
echo "20. "

echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 
	

1) bbb-record --list
  read junk;;

2) bbb-record --watch
  read junk;;
  
3) sudo bbb-record --rebuildall
  read junk;;
  
4) sudo bbb-record --deleteall
  read junk;;  

5) sudo bbb-record --debug
   read junk;;

6) sudo bbb-record --enable presentation
   read junk;;
  
7) sudo bbb-record --disable presentation
   read junk;;
  
8) sudo bbb-conf --clean
   read junk;;  
9) sudo bbb-conf --check
	read junk;;  
10) sudo bbb-conf --debug
	read junk;; 
11) sudo bbb-conf --network
	read junk;; 
12) sudo bbb-conf --start
   read junk;;  
13) sudo bbb-conf --stop
	read junk;;  
14) sudo bbb-conf --watch
	read junk;; 
15) sudo bbb-conf --restart
	read junk;; 
16) echo "docker exec greenlight-v2 bundle exec rake user:create["name","email","password","user"]"
	read junk;; 
17) echo "docker exec greenlight-v2 bundle exec rake user:create["name","email","password","admin"]"
	read junk;; 


Q|q) quit=y;; 
*) echo "Try Again" 
sleep 1
esac 
done 
echo "I'm done, Bye bye"
