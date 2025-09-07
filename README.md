# Kali DWM Love

I made scripts to install various DWM themes on Kali. <br>
These themes use LARBS: https://github.com/LukeSmithxyz/voidrice <br>

> Note: I use VMware. The `.xprofile` file has settings that make copy paste possible in DWM.<br> 
> If you're using Virtualbox, you can remove `vmware-user` from `.xprofile`.  

Enjoy! <3 <br>

## Changes I made to LARBS

- `MOD + j/m` changes the master window size
- The default web browser is Firefox. This can still be opened with `MOD + w`
- I didn't install passmenu. So, you can change `MOD + D` to whatever you want.
- I added `Kick Ass tun0` to the statusbar on most themes. You can change this in `~/.local/bin/statusbar/sb-tun0`
- You can [change the heart/fire icon](https://www.nerdfonts.com/cheat-sheet) in the status bar in `~/.local/src/dwm/config.h`.
  After you make any changes run the following:
  ```
  cd ~/.local/src/dwm/
  sudo make clean install
  ```
  Then, `MOD + backspace` `leave DMW` and log back in.

## Some things you might want to know

### How do I change the background image? 
I made a `.config/wallpaper` directory... incase you wanna use it. <br>
Change the background image with the following command:
```
setbg /path/to/file
```
Also, if your background image breaks up... you can run:
```
setbg
```

### Where is my zshrc file?
- It's located at `~/.config/zsh/.zshrc`

### Why am I seeing rainbows?
Some programs are set to run as `<program> | lolcat`.  
You can remove programs or add them in your `.zshrc` file. Note: not all programs work well w/ lolcat.<br> 
This is what it looks like: 
```bash
lol() {
	if [ -t 1 ]; then
		"$@" | lolcat
	else
		"$@"
	fi
}

COMMANDS=(
    ls
    cat
    fastfetch
    find
    lf
    ps
    ip
    msfconsole
    mysql
    sqlmap
    gobuster
    ffuf
)

for COMMAND in "${COMMANDS[@]}"; do
    alias "${COMMAND}=lol ${COMMAND}"
    alias ".${COMMAND}=$(which ${COMMAND})"
done
```
Add or remove programs under `COMMANDS`.

### What if I have a question?
If you have any questions, ask me on [Hack Smarter Discord](https://discord.gg/TujAjYXJjr) on the `#🍚⏐rice ` channel.
My name is `Blue Pho3nix`.

## Kali DWM Installation Instructions:
1. Pick a theme
2. Goto the theme's folder for install instructions


### Themes:
#### Black Borland
![image](https://github.com/user-attachments/assets/10538829-32da-47b0-8969-77167a429831)
[Link to folder](https://github.com/blue-pho3nix/dwm-love/tree/main/black-borland)

---

#### Maleficent
![image](https://github.com/user-attachments/assets/299d83af-78ff-4fa9-a95c-e8d0ff1fe16e)
[Link to folder](https://github.com/blue-pho3nix/dwm-love/tree/main/maleficent)

---

#### Ghost in the Shell

![image](https://github.com/user-attachments/assets/e4518448-6874-4a17-86a3-6054e51aa7e9)
![image](https://github.com/user-attachments/assets/e8949de7-1596-4ac4-931c-80fe6ad78e88)
[Link to folder](https://github.com/blue-pho3nix/dwm-love/tree/main/ghost-in-the-shell)

---

#### Girl Armored Warrior
![image](https://github.com/user-attachments/assets/8e510a36-3e80-403f-a6e7-99fb7727d680)
[Link to folder](https://github.com/blue-pho3nix/dwm-love/tree/main/girl-armored-warrior)

---

#### Source Target

![image](https://github.com/user-attachments/assets/6a3edf70-e7ad-4ce8-9178-3926bea259cf)
![image](https://github.com/user-attachments/assets/4a4ba33b-f38f-4e29-a1dd-e0a1f4b3c323)
[Link to folder](https://github.com/blue-pho3nix/dwm-love/tree/main/source-target)

---

#### Nefelibata

![image](https://github.com/user-attachments/assets/da9fbc56-2c66-4447-b3df-132513299f1a)
![image](https://github.com/user-attachments/assets/51c391f9-3422-486c-89a7-c93b1b26613e)

#### Yuumi Art Revive

![image](https://github.com/user-attachments/assets/047ca8f7-3331-4b6a-af16-7c9d5891376c)
[Link to folder](https://github.com/blue-pho3nix/dwm-love/tree/main/yuumi-art-revive)
