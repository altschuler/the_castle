exec i3

# kbd repeat rate and interval
xset r rate 200 25

# disable beep
sudo rmmod pcspkr

pulseaudio --start

sh ~/kbon.sh

# eval $(gpg-agent --daemon)
