quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "============================BBB MENU===================================="
echo "01. sudo bbb-conf --status"
echo "========================================================================"
echo "02. sudo bbb-conf --secret"
echo "========================================================================"
echo "03. sudo bbb-conf --restart"
echo "========================================================================"
echo "04. sudo bbb-conf --check"
echo "========================================================================"
echo "05. sudo bbb-conf --network"
echo "========================================================================"
echo "06. sudo bbb-conf --start"
echo "========================================================================"
echo "07. sudo bbb-conf --stop"
echo "========================================================================"
echo "08. sudo bbb-conf --watch"
echo "===================RECORD==============================================="
echo "09. bbb-record --list"
echo "========================================================================"
echo "10. bbb-record --watch"
echo "========================================================================"
echo "11. sudo bbb-record --rebuildall"
echo "========================================================================"
echo "12. sudo bbb-record --enable presentation"
echo "========================================================================"
echo "13. sudo bbb-record --disable presentation"
echo "========================================================================"
echo "14. systemctl restart nginx"
echo "========================================================================"
echo "ex. sudo bbb-conf --setip domain.example.com"
echo "========================================================================"
echo "ex. sudo bbb-record --rebuil 6e35e3b2778883f5db637d7a5dba0a427f692e91-1379965122603"
echo "========================================================================"
echo "ex. sudo bbb-record --delete 6e35e3b2778883f5db637d7a5dba0a427f692e91-1379965122603"
echo "========================================================================"
echo "ex. sudo bbb-record --republish 6e35e3b2778883f5db637d7a5dba0a427f692e91-1379965122603"
echo "===================GREENLIGHT==========================================="
echo "15. ./scripts/image_build.sh bigbluebutton/greenlight release-v2"
echo "========================================================================"
echo "16. docker-compose down"
echo "========================================================================"
echo "17. docker-compose up -d"
echo "========================================================================"
echo "docker exec greenlight-v2 bundle exec rake user:create["Duy Quan","nguyenduyquan.pros@gmail.com","Quan2110","admin"]"
echo "========================================================================"
echo "18. sudo ufw status"
echo "========================================================================"
echo "19. sudo ufw reload"
echo "========================================================================"
echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 


1) sudo bbb-conf --status
	read junk;;
2) sudo bbb-conf --secret
	read junk;;
3) sudo bbb-conf --restart
	read junk;; 
4) sudo bbb-conf --check
	read junk;; 
5) sudo bbb-conf --network
 	read junk;;
6) sudo bbb-conf --start
 	read junk;;
7) sudo bbb-conf --stop
 	read junk;; 
8) sudo bbb-conf --watch
 	read junk;;
9) bbb-record --list
 	read junk;;
10) bbb-record --watch
	read junk;;
11) sudo bbb-record --rebuildall
	read junk;;
12) sudo bbb-record --enable presentation
	read junk;;
13) sudo bbb-record --disable presentation
	read junk;; 
14) systemctl restart nginx
	read junk;; 
15) ./scripts/image_build.sh bigbluebutton/greenlight release-v2
	read junk;;
16) docker-compose down
	read junk;; 
17) docker-compose up -d
	read junk;; 
18) sudo ufw status
	read junk;; 
19) sudo ufw reload
	read junk;; 

	
Q|q) quit=y;; 
*) echo "Try Again" 
sleep 2
esac 
done 
echo "I'm done, Bye bye"

