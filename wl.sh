cd /root/greenlight
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/1.sh
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/2.sh
chmod +x 1.sh && chmod +x 2.sh
sudo wget https://raw.githubusercontent.com/2Pytorch01/wlgrbbb/main/sample.env

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


