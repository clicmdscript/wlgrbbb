quit=n 
while [  "$quit"   =   "n"  ] 
do 
clear 
echo 
echo ""
echo "======================Scalelite MENU===================================="
echo "01. systemctl restart scalelite.target"
echo "02. docker exec -it scalelite-api bundle exec rake servers"
echo "03. docker exec -it scalelite-api bundle exec rake status"
echo "04. docker exec -i scalelite-api bundle exec rake poll:all"
echo "05. docker exec -it scalelite-api bin/rake db:setup"
echo "06. systemctl restart scalelite-api.service scalelite-nginx.service scalelite-recording-importer scalelite-poller"
echo "07. systemctl status scalelite-api.service scalelite-nginx.service scalelite-recording-importer scalelite-poller"
echo "08. docker exec -it scalelite-api /bin/sh"
echo "========================================================================"
echo "10. exportfs -a"
echo "11. sudo ufw status"
echo "12. sudo ufw reload"
echo "13. docker exec -it scalelite-api bin/rake db:setup -DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
echo "14. Admin Scalelite command"
echo "========================================================================"
echo "./bin/rake servers:add[url,secret,loadMultiplier]"
echo "After update API	:	docker exec -t scalelite-api bundle exec rake db:migrate"
echo "Add		:	docker exec -it scalelite-api bin/rake servers:add[url,secret,loadMultiplier]"
echo "Remove a server	:	docker exec -it scalelite-api bin/rake servers:remove[id]"
echo "Disable a server	:	docker exec -it scalelite-api bin/rake servers:disable[id]"
echo "Enable a server 	:	docker exec -it scalelite-api bin/rake servers:enable[id]"
echo "Panic a server	:	docker exec -it scalelite-api bin/rake./bin/rake servers:panic[id]"
echo "Cordon a server	:	docker exec -it scalelite-api bin/rake servers:cordon[id]"
echo "Edit load-multiplier:	docker exec -it scalelite-api bin/rake servers:loadMultiplier[id,newLoadMultiplier]"
echo "Poll all servers	:	docker exec -it scalelite-api bin/rake poll:all"
echo "SHORT 		:	docker exec -it scalelite-api /bin/sh - Then use: ./bin/rake"


echo ""
echo "Q.Quit" 
echo 
echo "Enter choice" 
read choice 
case $choice in 



1) sudo /etc/init.d/nfs-kernel-server restart
	read junk;;
2) docker exec -it scalelite-api bundle exec rake servers
	read junk;;
3) docker exec -it scalelite-api bundle exec rake status 
	read junk;; 
4) docker exec -i scalelite-api bundle exec rake poll:all
	read junk;; 
5) docker exec -it scalelite-api bin/rake db:setup
 	read junk;;
6) systemctl restart scalelite-api.service scalelite-nginx.service scalelite-recording-importer scalelite-poller
 	read junk;;
7) systemctl status scalelite-api.service scalelite-nginx.service scalelite-recording-importer scalelite-poller
 	read junk;; 
8) docker exec -it scalelite-api /bin/sh
 	read junk;;
9) sudo /etc/init.d/nfs-kernel-server restart
 	read junk;;
10) exportfs -a
	read junk;;
11) sudo ufw status
	read junk;;
12) sudo ufw reload
	read junk;;
13) docker exec -it scalelite-api bin/rake db:setup -DISABLE_DATABASE_ENVIRONMENT_CHECK=1
	read junk;; 
14) ./adminscalelite.sh
	read junk;;

Q|q) quit=y;; 
*) echo "Try Again" 
sleep 2
esac 
done 
echo "I'm done, Bye bye"



