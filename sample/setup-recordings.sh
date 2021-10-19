#!/bin/bash

# the ssh string to use in form of scalelite.example.com
read -p "Enter HOST the ssh string to use in form of scalelite.example.com " host1
#HOST=${host1}
echo "OK!"
# the user to use with ssh
read -p "Enter USER root or ubuntu with ssh: " user1
#USER=${user1}
echo "OK!"
# the spool dir on scalelite host
read -p "Enter SPOOL the spool dir on scalelite host: " spool1
#SPOOL=${spool1}
echo "OK!"

echo "mkdir /usr/local/bigbluebutton/core/scripts"
mkdir -p /usr/local/bigbluebutton/core/scripts

cat > /usr/local/bigbluebutton/core/scripts/scalelite.yml <<CONF
work_dir: /var/bigbluebutton/recording/scalelite
spool_dir: $user1@$host1:$spool1
extra_rsync_opts: []
CONF

mkdir -p /usr/local/bigbluebutton/core/scripts/post_publish
wget -q -O /usr/local/bigbluebutton/core/scripts/post_publish/scalelite_post_publish.rb \
https://raw.githubusercontent.com/blindsidenetworks/scalelite/master/bigbluebutton/scalelite_post_publish.rb
chmod 755 /usr/local/bigbluebutton/core/scripts/post_publish/scalelite_post_publish.rb

mkdir -p /var/bigbluebutton/recording/scalelite
chown bigbluebutton:bigbluebutton /var/bigbluebutton/recording/scalelite

mkhomedir_helper bigbluebutton
mkdir -p /home/bigbluebutton/.ssh
chown bigbluebutton:bigbluebutton /home/bigbluebutton/.ssh
chmod 0700 /home/bigbluebutton/.ssh

su -c "ssh-keygen -q -t ed25519 -N '' -f /home/bigbluebutton/.ssh/scalelite" -s /bin/bash bigbluebutton

cat > /home/bigbluebutton/.ssh/config <<SSHCONF
Host $host1
    User $user1
    IdentityFile /home/bigbluebutton/.ssh/scalelite
SSHCONF

echo "$(ssh-keyscan $host1)" > /home/bigbluebutton/.ssh/known_hosts

chown bigbluebutton:bigbluebutton /home/bigbluebutton/.ssh/config
chown bigbluebutton:bigbluebutton /home/bigbluebutton/.ssh/known_hosts

echo "-----------------------------"
echo "FINISHED INIT FOR RECORDING TRANSMISSION"
echo "ON YOUR SCALELITE MASTER RUN FOLLOWING:"
echo "-----------------------------"
echo "echo \"$(cat /home/bigbluebutton/.ssh/scalelite.pub)\" >> /home/$user1/.ssh/authorized_keys"
echo "-----------------------------"
