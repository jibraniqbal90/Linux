#! /bin/bash

sudo pacman -S plymouth

sudo sed -i -e "s/base udev/base udev plymouth/g" /etc/mkinitcpio.conf

sudo sed -i -e 's/MODULES=()/MODULES="i915"/g' /etc/mkinitcpio.conf

sudo mkinitcpio -p linux59

sudo sed -i -e "s/quiet/quiet splash/g" /etc/default/grub

sudo update-grub

sudo systemctl disable sddm.service

sudo systemctl enable sddm-plymouth.service

sudo plymouth-set-default-theme -R solar



sudo cp /home/jibran/.local/share/plasma/look-and-feel/com.github.vinceliuice.ChromeOS-dark/contents/splash/images/

sudo cp /home/jibran/Workspace/GitWorkspace/MyWorkspace/KDE/Images/background.jpg /home/jibran/.local/share/plasma/look-and-feel/com.github.vinceliuice.ChromeOS-dark/contents/splash/images/

sudo cat /home/jibran/Workspace/GitWorkspace/MyWorkspace/Linux/Splash.qml > /home/jibran/.local/share/plasma/look-and-feel/com.github.vinceliuice.ChromeOS-dark/contents/splash/Splash.qml 
