

read -p "Enter DOMAIN BBB to add: " SRVDOMAIN
read -p "Enter SECRET BBB to add: " SRVSECRET
read -p "Enter NUMBER ORDER (1,2,3...)  : " SRVNUM
echo ""
echo ""
echo "//////////////ADD SERVER/////////////////////"
#echo "IP:			$REDIS_IP"
#echo "Domain:	$REDIS_DM"

docker exec -i scalelite-api bundle exec rake servers:add[https://$SRVDOMAIN/bigbluebutton/api/,$SRVSECRET,$SRVNUM]

#docker exec -i scalelite-api bundle exec rake servers:enable[a66161d6-0a3f-4b4d-a4d4-b9eabd9af120]
