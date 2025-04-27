#!/bin/sh

apt update -y && apt upgrade -y

# sway + every packages i need for my config to work
# lightdm              : light display manager (prompt for login/pass)
apt install -y sway xwayland network-manager \
               pulseaudio-utils xclip maim lightdm pipewire xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
               xfce4-terminal alsa-utils pulseaudio rofi brightnessctl grim tumbler-plugins-extra

# flatpaks
apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.gitlab.librewolf-community

# programs i need (UI)
apt install -y thunar mpv feh

# set up my shell
apt install -y zsh figlet lolcat

# dev tools
apt install -y git python3 python3-pip pipenv gcc

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
