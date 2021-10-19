#!/bin/bash

# the ssh string to use in form of scalelite.example.com
HOST=

# the user to use with ssh
USER=

# the spool dir on scalelite host
SPOOL=

mkdir -p /usr/local/bigbluebutton/core/scripts

cat > /usr/local/bigbluebutton/core/scripts/scalelite.yml <<CONF
work_dir: /var/bigbluebutton/recording/scalelite
spool_dir: $USER@$HOST:$SPOOL
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
Host $HOST
    User $USER
    IdentityFile /home/bigbluebutton/.ssh/scalelite
SSHCONF

echo "$(ssh-keyscan $HOST)" > /home/bigbluebutton/.ssh/known_hosts

chown bigbluebutton:bigbluebutton /home/bigbluebutton/.ssh/config
chown bigbluebutton:bigbluebutton /home/bigbluebutton/.ssh/known_hosts

echo "-----------------------------"
echo "FINISHED INIT FOR RECORDING TRANSMISSION"
echo "ON YOUR SCALELITE MASTER RUN FOLLOWING:"
echo "-----------------------------"
echo "echo \"$(cat /home/bigbluebutton/.ssh/scalelite.pub)\" >> /home/$USER/.ssh/authorized_keys"
echo "------------------------------"
