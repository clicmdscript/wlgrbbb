

read -p "Enter SERVER ID to Enable: " SRVID
echo ""
echo ""
echo "//////////////ENABLE SERVER/////////////////////"

#docker exec -i scalelite-api bundle exec rake servers:add[https://$SRVDOMAIN/bigbluebutton/api/,$SRVSECRET,$SRVNUM]

docker exec -i scalelite-api bundle exec rake servers:enable[$SRVID]
