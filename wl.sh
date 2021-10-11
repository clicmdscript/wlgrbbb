cd /root/greenlight

sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/1.sh
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/2.sh
chmod +x 1.sh && chmod +x 2.sh
./1.sh
#sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample.env

cd /root/greenlight/app/views/shared
sudo rm -rf _footer.html.erb
sudo rm -rf _header.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/_footer.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/_header.html.erb

cd /root/greenlight/app/views/main
sudo rm -rf index.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/index.html.erb
cd components
sudo rm -rf _features.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/_features.html.erb

cd /root/greenlight/app/views/layouts
sudo rm -rf application.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/application.html.erb

cd /root/greenlight/app/assets/javascripts
sudo rm -rf recording.js
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/recording.js

cd /root/greenlight/app/assets/images
sudo rm -rf logo_with_text.png
sudo rm -rf bbb_logo.png
sudo rm -rf favicon.ico
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/bbb_logo.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/logo_with_text.png
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico

cd /root/greenlight/app/views/errors/
sudo rm -rf bigbluebutton_error.html.erb
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/bigbluebutton_error.html.erb

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

cd /usr/share/meteor/bundle/programs/server/assets/app/config/
rm -rf settings.yml
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/settings.yml

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

cd /usr/share/bbb-web/assets/favicon.ico
sudo rm -rf favicon.ico
https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico
cd /var/www/bigbluebutton-default/
sudo rm -rf favicon.ico
https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.ico
cd /var/www/bigbluebutton-default/images/
sudo rm -rf favicon.png
sudo rm -rf bbb-logo.png
sudo rm -rf logo.png
https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/favicon.png
https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/bbb-logo.png
https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/logo.png

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

./2.sh
sudo bbb-conf --clean




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
