#! /bin/bash

git clone https://github.com/vinceliuice/ChromeOS-kde.git
cd ChromeOS-kde
sh ./install.sh
git clone https://aur.archlinux.org/plasma5-applets-latte-separator.git
cd plasma5-applets-latte-separator
makepkg -si
https://aur.archlinux.org/plasma5-applets-latte-spacer.git
cd plasma5-applets-latte-spacer
makepkg -si
https://aur.archlinux.org/plasma5-applets-latte-sidebar-button.git
cd plasma5-applets-latte-sidebar-button
makepkg -si

sudo cat fancyTerminal >> /home/jibran/.bashrc	 

cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/alldesktops.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/
cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/close.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/
cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/keepabove.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/
cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/keepbelow.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/
cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/maximize.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/
cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/minimize.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/
cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Plasma/WindowButtons/restore.svg /home/jibran/.local/share/aurorae/themes/ChromeOS-dark/

#Goto Application Style -> Configure Gnome /GTK Application Style -- Download ChromeOS theme and set it
#install Kvantum and select ChromeOS theme.
#install latte dock
#Download and configure edna Layout :: https://www.pling.com/p/1417204/ or from My Git 
#Chrome Os theme uploaded to Git also





 
