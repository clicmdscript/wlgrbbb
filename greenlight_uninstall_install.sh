
cd ~/greenlight
docker-compose down
docker rmi bigbluebutton/greenlight:v2
cd ../

mv greenlight/ greenlight-old/
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install ca-certificates
sudo apt-get install curl
sudo apt-get install -y gnupg-agent
sudo apt-get install software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88


sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

apt-cache madison docker-ce
sudo apt-get install -y docker-ce=5:20.10.0~3-0~ubuntu-bionic docker-ce-cli=5:20.10.0~3-0~ubuntu-bionic containerd.io

sudo docker run hello-world


git clone https://github.com/bigbluebutton/greenlight.git
cd greenlight
git status

git remote add upstream https://github.com/bigbluebutton/greenlight.git
git remote -v
git fetch upstream

git checkout -b custom-changes upstream/v2
git status
cp sample.env .env
docker run --rm bigbluebutton/greenlight:v2 bundle exec rake secret
bbb-conf --secret

docker run --rm --env-file .env bigbluebutton/greenlight:v2 bundle exec rake conf:check
cat ./greenlight.nginx | sudo tee /etc/bigbluebutton/nginx/greenlight.nginx

sudo systemctl restart nginx

./scripts/image_build.sh bigbluebutton/greenlight release-v2

echo "sudo vi docker-compose.yml"
echo "add Secret key in .env file"
echo "add release-v2"
echo "Then: docker-compose up -d"
echo "and restart BBB & Nginx"

