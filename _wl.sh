echo "THIS PATCH FOR vs3.roauset.com"
read -p "if correct | Press enter to continue or cancel with CMD C. "
echo ""
echo "/root/greenlight"
echo "Download menu.sh & 1.sh & 2.sh & 3changeaudio.sh"
cd /root/greenlight
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/menu.sh
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/1.sh
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/2.sh
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/3changeaudio.sh

chmod +x 1.sh && chmod +x 2.sh && chmod +x menu.sh && chmod +x 3changeaudio.sh
echo ".................................................."
echo "Now docker down for process with 1.sh"
echo ".................................................."

./1.sh
#sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample.env

echo ".................................................."
echo "Remove and update new code"
echo ".................................................."

echo "/root/greenlight/app/views/shared"
cd /root/greenlight/app/views/shared
sudo rm -rf _footer.html.erb
sudo rm -rf _header.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/_footer.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/_header.html.erb

echo "/root/greenlight/app/views/main"
cd /root/greenlight/app/views/main
sudo rm -rf index.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/index.html.erb
cd components
sudo rm -rf _features.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/_features.html.erb

echo "/root/greenlight/app/views/layouts"
cd /root/greenlight/app/views/layouts
sudo rm -rf application.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/application.html.erb

echo "/root/greenlight/app/assets/javascripts"
cd /root/greenlight/app/assets/javascripts
sudo rm -rf recording.js
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/recording.js

echo "/root/greenlight/app/assets/images"
cd /root/greenlight/app/assets/images
sudo rm -rf logo_with_text.png
sudo rm -rf bbb_logo.png
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/bbb_logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/logo_with_text.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico

echo "/root/greenlight/app/views/errors/"
cd /root/greenlight/app/views/errors/
sudo rm -rf bigbluebutton_error.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/bigbluebutton_error.html.erb

echo "/root/greenlight/config"
cd /root/greenlight/config
sudo rm -rf application.rb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/application.rb

cd locales/
sudo rm -rf vi_VN.yml
sudo rm -rf vi.yml
sudo rm -rf en.yml
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/vi_VN.yml
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/vi.yml
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/en.yml

echo "/usr/share/meteor/bundle/programs/server/assets/app/config/"
cd /usr/share/meteor/bundle/programs/server/assets/app/config/
rm -rf settings.yml
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/settings.yml

echo "/usr/share/meteor/bundle/programs/web.browser.legacy/app/locales/"
cd /usr/share/meteor/bundle/programs/web.browser.legacy/app/locales/
sudo rm -rf vi.json
sudo rm -rf vi_VN.json
sudo rm -rf en.json
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/meteor/legacy/vi.json
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/meteor/legacy/vi_VN.json
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/meteor/legacy/en.json

echo "/usr/share/meteor/bundle/programs/web.browser/app/locales/"
cd /usr/share/meteor/bundle/programs/web.browser/app/locales/
sudo rm -rf vi.json
sudo rm -rf vi_VN.json
sudo rm -rf en.json
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/meteor/webmain/vi.json
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/meteor/webmain/vi_VN.json
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/meteor/webmain/en.json

echo "/var/www/bigbluebutton-default/"
cd /var/www/bigbluebutton-default/
sudo rm -rf testjava.html
sudo rm -rf index.html
sudo rm -rf index_html5_vs_flash.html
sudo rm -rf home.html
sudo rm -rf help.html
sudo rm -rf favicon.ico
sudo rm -rf default.pptx
sudo rm -rf default.pdf
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/testjava.html
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/index.html
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/index_html5_vs_flash.html
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/home.html
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/help.html
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/default.pptx
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/default.pdf

echo "/usr/share/bbb-web/assets/"
cd /usr/share/bbb-web/assets/
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico

echo "/var/www/bigbluebutton-default/"
cd /var/www/bigbluebutton-default/
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico

echo "/var/www/bigbluebutton-default/images/"
cd /var/www/bigbluebutton-default/images/
sudo rm -rf favicon.png
sudo rm -rf bbb-logo.png
sudo rm -rf logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/bbb-logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/logo.png

echo "/var/bigbluebutton/playback/presentation/"
cd /var/bigbluebutton/playback/presentation/
cd 2.0
sudo rm -rf playback.html
sudo rm -rf playback.js
sudo rm -rf logo.png

sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/pp20/playback.html
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/pp20/playback.js
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/pp20/logo.png

cd ..
cd 2.3
sudo rm -rf index.html
sudo rm -rf favicon.ico
sudo wget https://github.com/2Pytorch01/wlgrbbb/raw/main/pp23/index.html
sudo wget https://github.com/2Pytorch01/wlgrbbb/raw/main/pp23/favicon.ico

echo ".................................................."
echo "Now Docker UP -D, Restart Nginx & BBB"
echo ".................................................."

cd /root/greenlight
./2.sh

echo ".................................................."
echo "BBB -- Clean"
echo ".................................................."

sudo bbb-conf --clean


echo ".................................................."
echo "All done !!!"
echo ".................................................."



#other path
#AUDIO: /var/freeswitch/meetings
#WEBCAM (Flash): /usr/share/red5/webapps/video/streams
#WEBCAM (HTML5): /var/kurento/recordings
#SCREEN SHARING (Flash): /var/usr/share/red5/webapps/screenshare/streams
#SCREEN SHARING (HTML5): /var/kurento/screenshare
#SLIDES: /var/bigbluebutton
#NOTES: http://localhost:9001/p
#EVENTS: Redis
#Archived filesAnchor link for: archived files
#The archived file are located in /var/bigbluebutton/recording/raw/<internal-meeting-id>/
#
#Sanity checked filesAnchor link for: sanity checked files
#The sanity files are store in the same place as the archived files
#
#Processed filesAnchor link for: processed files
#The processed files can be found in /var/bigbluebutton/recording/process/presentation/<internal-meeting-id>/
#
#Published filesAnchor link for: published files
#The published files are in /var/bigbluebutton/recording/publish/presentation/<internal-meeting-id>/
#
#Playback filesAnchor link for: playback files
#The playback files are found in /var/bigbluebutton/published/presentation/<internal-meeting-id>/
