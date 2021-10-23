read -p "Enter NUMBER ID : " SRVNUMID
echo ""
docker exec -i scalelite-api bundle exec rake servers:remove[$SRVNUMID]

echo "//////////////REMOVED SERVER//////////////////"
