#!/bin/sh

apt update -y && apt upgrade -y

# i3 + every packages i need for my config to work
# network-manager-gnome: menu to select networks (nm-applet)
# light                : backlight management
# lightdm              : light display manager (prompt for login/pass)
apt install -y i3 network-manager network-manager-gnome light \
               pulseaudio-utils xorg lightdm xclip maim       \
               xfce4-terminal alsa-utils pulseaudio rofi

# need to setuid light so we can change brightness in i3
chmod ug+s /usr/bin/light

# programs i need (UI)
apt install -y firefox-esr thunar mpv feh

# set up my shell
apt install -y zsh figlet lolcat git

# get user information
USER_PASSWD="$(getent passwd 1000)"
USER_NAME=$(echo "$USER_PASSWD"|cut -d: -f1)
USER_HOME=$(echo "$USER_PASSWD"|cut -d: -f6)
USER_UID=$(echo "$USER_PASSWD"|cut -d: -f3)
USER_GID=$(echo "$USER_PASSWD"|cut -d: -f4)

echo "user home: $USER_HOME"
echo "user UID : $USER_UID"
echo "user GID : $USER_GID"

apt install passwd
chsh --shell /usr/bin/zsh "$USER_NAME"

# !!FILE_SETUP!!

# set home owner
chown -R "$USER_UID:$USER_GID" "$USER_HOME"

# reboot
systemctl reboot
