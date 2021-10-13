echo "Change file audio to Vietnamese"
cd /opt/freeswitch/share/freeswitch/sounds/en/us/callie/conference

sudo mv 48000/ 48000-old/
sudo mv 32000/ 32000-old/
sudo mv 16000/ 16000-old/
sudo mv 8000/ 8000-old/
sudo mkdir 48000
sudo mkdir 32000
sudo mkdir 16000
sudo mkdir 8000
echo "Now download audio to folder 8000"
cd 8000/
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-alone.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-bad-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-conference_is_full.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-conference_is_in_qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-conference_will_start_shortly.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-enter_conf_number.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-enter_conf_pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-entry_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-exit_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-goodbye.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-has_joined.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-has_left.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-is-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-is-unlocked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-kicked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-listener_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-listeners_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-members_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-number_of_listeners.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-one_other_member_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-one_other_person_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-other_persons_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-unmuted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-welcome.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-you_are_already_muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/8000/conf-you_are_now_bidirectionally_muted.wav
echo "Done 8000"
cd ..
cd 16000/
echo "Now download audio to folder 16000"
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-alone.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-bad-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-conference_is_full.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-conference_is_in_qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-conference_will_start_shortly.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-enter_conf_number.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-enter_conf_pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-entry_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-exit_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-goodbye.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-has_joined.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-has_left.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-is-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-is-unlocked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-kicked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-listener_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-listeners_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-members_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-number_of_listeners.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-one_other_member_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-one_other_person_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-other_persons_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-unmuted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-welcome.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-you_are_already_muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/16000/conf-you_are_now_bidirectionally_muted.wav

echo "Done 16000"
cd ..
cd 32000/
echo "Now download audio to folder 32000"

wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-alone.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-bad-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-conference_is_full.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-conference_is_in_qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-conference_will_start_shortly.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-enter_conf_number.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-enter_conf_pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-entry_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-exit_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-goodbye.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-has_joined.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-has_left.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-is-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-is-unlocked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-kicked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-listener_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-listeners_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-members_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-number_of_listeners.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-one_other_member_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-one_other_person_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-other_persons_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-unmuted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-welcome.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-you_are_already_muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/32000/conf-you_are_now_bidirectionally_muted.wav

echo "Done 32000"
cd ..
cd 48000/
echo "Now download audio to folder 48000"

wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-alone.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-bad-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-conference_is_full.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-conference_is_in_qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-conference_will_start_shortly.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-enter_conf_number.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-enter_conf_pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-entry_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-exit_sound.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-goodbye.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-has_joined.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-has_left.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-is-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-is-unlocked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-kicked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-listener_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-listeners_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-locked.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-members_in_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-number_of_listeners.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-one_other_member_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-one_other_person_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-other_persons_conference.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-pin.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-qna_mode.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-unmuted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-welcome.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-you_are_already_muted.wav
wget https://github.com/2Pytorch01/wlgrbbb/raw/main/audio/48000/conf-you_are_now_bidirectionally_muted.wav

echo "Done 48000"
echo "all done"
