

# Install Girl Armored Warrior on Kali

## 1. Install the dependencies for LARB, DWM, and lolcat for the `.zshrc`
> Note: If you get an error stating that a package is missing, change your [Kali Mirror](https://cdimage.kali.org/README?mirrorlist) in `/etc/apt/sources.list`  

```
sudo apt-get update && sudo apt-get install -y lolcat libxft-dev libharfbuzz-dev libxinerama-dev libx11-xcb-dev libxcb-res0-dev whiptail curl wget sudo zsh git build-essential feh alacritty xorg xserver-xorg x11-utils xinit x11-xserver-utils fonts-league-mono  fonts-font-awesome fonts-dejavu  bc xcompmgr x11-utils arandr dosfstools libnotify-bin dunst calcurse exfatprogs nsxiv xwallpaper ffmpeg ffmpegthumbnailer gnome-keyring neovim mpd mpc mpv man-db ncmpcpp newsboat fonts-noto fonts-noto-color-emoji ntfs-3g wireplumber pipewire-pulse pulsemixer sc-im maim abook unclutter unzip lynx xcape xclip xdotool yt-dlp zathura poppler-utils mediainfo atool fzf task-spooler socat moreutils tesseract-ocr-eng tesseract-ocr tesseract-ocr-eng suckless-tools dwm firefox-esr
```

## 2. Get and run the script

### w/ ST Terminal

![image](https://github.com/user-attachments/assets/c285fe26-4453-49a3-b912-96f3bd551a47)


```
wget https://raw.githubusercontent.com/blue-pho3nix/dwm-love/refs/heads/main/girl-armored-warrior/girl-armored-warrior-st-terminal.sh && sudo bash girl-armored-warrior-st-terminal.sh
```

### w/ Alacritty Terminal

![image](https://github.com/user-attachments/assets/2c47b31e-5b56-4c5a-8a1c-23cc2e8266c8)

```
wget https://raw.githubusercontent.com/blue-pho3nix/dwm-love/refs/heads/main/girl-armored-warrior/girl-armored-warrior-alacritty-terminal.sh && sudo bash girl-armored-warrior-alacritty-terminal.sh
```

## 2. Log out and login using `DWM`

![image](https://github.com/user-attachments/assets/962e46d6-903b-499b-a6b9-9ae2094cf3a4)

--- 

## Find out info on your new DWM setup click on the `?` in the statusbar

![image](https://github.com/user-attachments/assets/35a1a856-4789-4bf9-8c2c-8700093652b9)

## If you just want the dotfiles, you can get em here:
- [ST Terminal dotfiles](https://github.com/blue-pho3nix/dwm-love/tree/girl-armored-warrior-st-dotfiles)

```
git clone -b girl-armored-warrior-st-dotfiles https://github.com/blue-pho3nix/dwm-love.git
```

- [Alacritty Terminal dotfiles](https://github.com/blue-pho3nix/dwm-love/tree/girl-armored-warrior-alacritty-dotfiles)

```
git clone -b girl-armored-warrior-alacritty-dotfiles https://github.com/blue-pho3nix/dwm-love.git
```

