#!/bin/bash

# Luke's Auto Rice Bootstrapping Script (LARBS) for Kali
# Modified for Kali Linux by Jackie
# License: GNU GPLv3

### VARIABLES ###
dotfilesrepo="https://github.com/blue-pho3nix/black-powershell-dwm-rice.git"

export TERM=ansi

### FUNCTIONS ###
@@ -65,14 +64,14 @@ installbase() {
	echo "$LINE5" | sudo tee -a "$SOURCES_FILE" > /dev/null

        sudo apt-get update
	sudo apt-get install -y lolcat extrepo libxft-dev libharfbuzz-dev libxinerama-dev libx11-xcb-dev libxcb-res0-dev whiptail curl wget sudo zsh git build-essential feh alacritty xorg xserver-xorg x11-utils xinit x11-xserver-utils fonts-league-mono  fonts-font-awesome fonts-dejavu  bc xcompmgr x11-utils arandr dosfstools libnotify-bin dunst calcurse exfatprogs nsxiv xwallpaper ffmpeg ffmpegthumbnailer gnome-keyring neovim mpd mpc mpv man-db ncmpcpp newsboat fonts-noto fonts-noto-color-emoji ntfs-3g wireplumber pipewire-pulse pulsemixer sc-im maim abook unclutter unzip lynx xcape xclip xdotool yt-dlp zathura poppler-utils mediainfo atool fzf task-spooler socat moreutils tesseract-ocr-eng tesseract-ocr tesseract-ocr-eng suckless-tools dwm firefox-esr
        sudo extrepo enable librewolf
        sudo apt update && sudo apt install librewolf -y      
}

clone_dotfiles() {
	whiptail --infobox "Cloning dotfiles..." 7 60
	sudo -u "$name" git clone --depth 1 "$dotfilesrepo" "/home/$name/dotfiles"
	sudo -u "$name" cp -r "/home/$name/dotfiles/." "/home/$name"
	rm -rf "/home/$name/dotfiles"
        rm -rf "/home/$name/.git"
@@ -83,30 +82,6 @@ set_shell() {
	chsh -s /bin/zsh "$name"
}

configure_system() {
	# Make apt colorful
	sed -i '/#APT::Color "1";/s/#//' /etc/apt/apt.conf.d/99synaptic

	# Enable parallel downloads
	echo "Acquire::Queue-Mode \"access\";" > /etc/apt/apt.conf.d/90parallel

	# Set sudo without password
	echo "%sudo ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/nopasswd

	# Blacklist beep sound
	echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
	rmmod pcspkr

	# Enable tap-to-click for touchpads
	mkdir -p /etc/X11/xorg.conf.d
	echo 'Section "InputClass"
        Identifier "libinput touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        EndSection' > /etc/X11/xorg.conf.d/40-libinput.conf
}



setup_dwm() {
@@ -145,7 +120,6 @@ installbase
adduserandpass
clone_dotfiles
set_shell
configure_system
setup_dwm
set_background
install_ohmyzsh
