#!/bin/bash

# Blue Pho3nix's Auto Rice Script for Kali DWM
# w/ Alacritty terminal 

### VARIABLES ###
dotfilesrepo="https://github.com/blue-pho3nix/dwm-love.git"
branch="flower-alacritty-dotfiles"
export TERM=ansi

### FUNCTIONS ###

error() {
	printf "%s\n" "$1" >&2
	exit 1
}

welcomemsg() {
	whiptail --title "Welcome!" --msgbox "Welcome to the Kali Flower Installer!\\n\\nThis script will install a pre-configured desktop environment with essential tools." 10 60
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


clone_dotfiles() {
	whiptail --infobox "Cloning dotfiles..." 7 60
	sudo -u "$name" git clone --depth 1 -b "$branch" "$dotfilesrepo" "/home/$name/dotfiles"
	sudo -u "$name" cp -r "/home/$name/dotfiles/." "/home/$name"
	rm -rf "/home/$name/dotfiles"
        rm -rf "/home/$name/.git"
	rm "/home/$name/README.md"
}

set_shell() {
	chsh -s /bin/zsh "$name"
}

configure_system() {
    # Make BurpSuite size fix in DWM executable
    sudo -u $name chmod +x /home/$name/.local/bin/burpsuite.sh
 
	# Make apt colorful
	sed -i '/#APT::Color "1";/s/#//' /etc/apt/apt.conf.d/99synaptic

	# Enable parallel downloads
	echo "Acquire::Queue-Mode \"access\";" > /etc/apt/apt.conf.d/90parallel

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
	whiptail --infobox "Setting up DWM..." 7 60
	cd /home/$name/.local/src/dwmblocks
        sudo make clean install
	cd /home/$name/.local/src/dwm
        sudo make clean install
	cd /home/$name/.local/src/dmenu
        sudo make clean install
	cd /home/$name/.local/src/st
        sudo make clean install
	cd
}

set_background() {
	whiptail --infobox "Setting background..." 7 60
	sudo -u $name /home/$name/.local/bin/setbg /home/$name/.config/wallpaper/yousef-espanioly-0iOOw41DZ28-unsplash.jpg
}


install_ohmyzsh() {
	whiptail --infobox "Installing Oh My Zsh..." 7 60
	sudo -u $name sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 2>/dev/null
 	rm /home/$name/.zshrc
}

finalize() {
	whiptail --infobox "Installation Complete <3 Log in as $name using dwm" 7 60
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
finalize
