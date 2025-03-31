#!/bin/bash

# Luke's Auto Rice Bootstrapping Script (LARBS) for Kali
# Modified for Kali Linux by Jackie
# License: GNU GPLv3

### VARIABLES ###
dotfilesrepo="https://github.com/blue-pho3nix/black-powershell-dwm-rice.git"
export TERM=ansi
wallpaper="$HOME/.config/wallpaper/virginia-tudorancea-Utqq2PId0UE-unsplash.jpg"

### FUNCTIONS ###

installpkg() {
	apt-get install -y "$1" >/dev/null 2>&1
}

error() {
	printf "%s\n" "$1" >&2
	exit 1
}

welcomemsg() {
	whiptail --title "Welcome!" --msgbox "Welcome to the Kali LARBS Installer!\\n\\nThis script will install a pre-configured desktop environment with essential tools." 10 60
}

getuserandpass() {
	name=$(whiptail --inputbox "Enter a username:" 10 60 3>&1 1>&2 2>&3) || exit 1
	while ! echo "$name" | grep -q "^[a-z_][a-z0-9_-]*$"; do
		name=$(whiptail --inputbox "Invalid username. Use lowercase, numbers, - or _." 10 60 3>&1 1>&2 2>&3)
	done
	pass1=$(whiptail --passwordbox "Enter password:" 10 60 3>&1 1>&2 2>&3)
	pass2=$(whiptail --passwordbox "Retype password:" 10 60 3>&1 1>&2 2>&3)
	while [ "$pass1" != "$pass2" ]; do
		pass1=$(whiptail --passwordbox "Passwords do not match. Try again:" 10 60 3>&1 1>&2 2>&3)
		pass2=$(whiptail --passwordbox "Retype password:" 10 60 3>&1 1>&2 2>&3)
	done
}

adduserandpass() {
	whiptail --infobox "Creating user \"$name\"..." 7 50
	useradd -m -s /bin/zsh -G sudo "$name" ||
		usermod -aG sudo "$name" && mkdir -p /home/"$name" && chown "$name":sudo /home/"$name"
	echo "$name:$pass1" | chpasswd
	unset pass1 pass2
}

installbase() {
	whiptail --infobox "Installing base packages..." 7 60
	sudo apt-get update
	sudo apt-get install -y whiptail curl wget sudo zsh git build-essential feh alacritty xorg xserver-xorg x11-utils xinit x11-xserver-utils fonts-league-mono  fonts-font-awesome fonts-dejavu  bc xcompmgr x11-utils arandr dosfstools libnotify-bin dunst calcurse exfatprogs nsxiv xwallpaper ffmpeg ffmpegthumbnailer gnome-keyring neovim mpd mpc mpv man-db ncmpcpp newsboat fonts-noto fonts-noto-color-emoji ntfs-3g wireplumber pipewire-pulse pulsemixer sc-im maim abook unclutter unzip lynx xcape xclip xdotool yt-dlp zathura poppler-utils mediainfo atool fzf task-spooler socat moreutils tesseract-ocr-eng tesseract-ocr tesseract-ocr-eng suckless-tools dwm firefox-esr
}

clone_dotfiles() {
	whiptail --infobox "Cloning dotfiles..." 7 60
	sudo -u "$name" git clone --depth 1 "$dotfilesrepo" "/home/$name/dotfiles"
	sudo -u "$name" cp -r "/home/$name/dotfiles/." "/home/$name"
	rm -rf "/home/$name/dotfiles"
}

set_shell() {
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
	whiptail --infobox "Setting up DWM..."
	cd /home/$name/.local/src/dwmblocks
        sudo make clean install
	cd /home/$name/.local/src/dwm
        sudo make clean install
	cd /home/$name/.local/src/dmenu
        sudo make clean install
	cd /home/$name/.local/src/st
        sudo make clean install
}

set_background() {
	whiptail --infobox "Setting background..."
	setbg ~/.config/wallpaper/virginia-tudorancea-Utqq2PId0UE-unsplash.jpg
}

install_ohmyzsh() {
	whiptail --infobox "Installing Oh My Zsh..." 7 60
	sudo -u "$name" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        sudo rm /home/$name/.zshrc
}

install_nerd_fonts() {
	whiptail --infobox "Installing Nerd Fonts..." 7 60
	# Automatically select option 37 to install Nerd Fonts
	echo "37" | bash -c "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"
}


finalize() {
	whiptail --title "Installation Complete" --msgbox "Installation complete!\\n\\nLog in as $name using dwm." 10 60
}

### MAIN SCRIPT ###
[ "$EUID" -ne 0 ] && error "Please run as root."

welcomemsg
getuserandpass
installbase
adduserandpass
clone_dotfiles
set_shell
configure_system
setup_dwm
set_background
install_ohmyzsh
install_nerd_fonts
finalize
