

# Install Ghost in the Shell on Kali
![image](https://github.com/user-attachments/assets/85f131dd-9376-4d31-a9dd-f1aee90df9a3)


## 1. Install the dependencies for LARB, DWM, and lolcat for the `.zshrc`
> Note: If you get an error stating that a package is missing, change your [Kali Mirror](https://cdimage.kali.org/README?mirrorlist) in `/etc/apt/sources.list`  
```
sudo apt-get update && sudo apt-get install -y gobuster fastfetch lf htop neomutt lolcat libxft-dev libharfbuzz-dev libxinerama-dev libx11-xcb-dev libxcb-res0-dev whiptail curl wget sudo zsh git build-essential feh alacritty xorg xserver-xorg x11-utils xinit x11-xserver-utils fonts-league-mono  fonts-font-awesome fonts-dejavu  bc xcompmgr x11-utils arandr dosfstools libnotify-bin dunst calcurse exfatprogs nsxiv xwallpaper ffmpeg ffmpegthumbnailer gnome-keyring neovim mpd mpc mpv man-db ncmpcpp newsboat fonts-noto fonts-noto-color-emoji ntfs-3g wireplumber pipewire-pulse pulsemixer sc-im maim abook unclutter unzip lynx xcape xclip xdotool yt-dlp zathura poppler-utils mediainfo atool fzf task-spooler socat moreutils tesseract-ocr-eng tesseract-ocr tesseract-ocr-eng suckless-tools dwm firefox-esr
```

## 2. Get and run the script
### w/ ST Terminal

```
wget https://raw.githubusercontent.com/blue-pho3nix/dwm-love/refs/heads/main/ghost-in-the-shell/ghost-in-the-shell-st-terminal-install.sh && sudo bash ghost-in-the-shell-st-terminal-install.sh
```

### w/ Alacritty Terminal


```
wget https://raw.githubusercontent.com/blue-pho3nix/dwm-love/refs/heads/main/ghost-in-the-shell/ghost-in-the-shell-alacritty-terminal.sh && sudo bash ghost-in-the-shell-alacritty-terminal.sh
```

## 2. Log out and login using `DWM`

![image](https://github.com/user-attachments/assets/962e46d6-903b-499b-a6b9-9ae2094cf3a4)

--- 

## Find out info on your new DWM setup click on the `?` in the statusbar

![image](https://github.com/user-attachments/assets/35a1a856-4789-4bf9-8c2c-8700093652b9)
![image](https://github.com/user-attachments/assets/f32bb50f-72d9-4749-b3c5-def740e9582c)

## If you just want the dotfiles, you can get em here:
- [ST Terminal dotfiles](https://github.com/blue-pho3nix/dwm-love/tree/ghost-in-the-shell-st-dotfiles)

```
git clone -b ghost-in-the-shell-st-dotfiles https://github.com/blue-pho3nix/dwm-love.git
```

- [Alacritty Terminal dotfiles](https://github.com/blue-pho3nix/dwm-love/tree/ghost-in-the-shell-alacritty-dotfiles)

```
git clone -b ghost-in-the-shell-alacritty-dotfiles https://github.com/blue-pho3nix/dwm-love.git
```
