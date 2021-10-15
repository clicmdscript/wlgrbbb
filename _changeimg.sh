echo "Change images and Logo"
echo "to start please check images in github folder"

echo "/root/greenlight/app/assets/images"
cd /root/greenlight/app/assets/images
sudo rm -rf logo_with_text.png
sudo rm -rf bbb_logo.png
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/bbb_logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/logo_with_text.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/favicon.ico

echo "/var/www/bigbluebutton-default/"
cd /var/www/bigbluebutton-default/
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/favicon.ico

echo "/usr/share/bbb-web/assets/"
cd /usr/share/bbb-web/assets/
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/favicon.ico

echo "/var/www/bigbluebutton-default/"
cd /var/www/bigbluebutton-default/
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/favicon.ico

echo "/var/www/bigbluebutton-default/images/"
cd /var/www/bigbluebutton-default/images/
sudo rm -rf favicon.png
sudo rm -rf bbb-logo.png
sudo rm -rf logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/favicon.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/bbb-logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/logo.png

echo "/var/bigbluebutton/playback/presentation/"
cd /var/bigbluebutton/playback/presentation/
cd 2.0

sudo rm -rf logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/logo.png

cd ..
cd 2.3
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/image_rep/vcon/favicon.ico

echo".................................................."
echo "Now Docker UP -D, Restart Nginx & BBB"
echo".................................................."

./2.sh

echo".................................................."
echo "BBB -- Clean"
echo".................................................."

sudo bbb-conf --clean


echo".................................................."
echo "All done !!!"
echo".................................................."

