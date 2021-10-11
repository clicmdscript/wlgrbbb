./scripts/image_build.sh bigbluebutton/greenlight release-v2
docker-compose up -d
sudo bbb-conf --restart
sudo service nginx restart

sudo service nginx restart


