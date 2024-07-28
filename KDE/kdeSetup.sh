#! /bin/bash

fileNameArray=('folder.svg' 'certificate-server.svg' 'folder-download.svg' 'folder-documents.svg' 'favorites.svg' 'folder-html.svg' 'folder-activities.svg' 'folder-bookmark.svg'
                'folder-cloud.svg' 'folder-development.svg' 'folder-favorites.svg' 'folder-games.svg' 'folder-gdrive.svg' 'folder-image-people.svg'
                'folder-important.svg' 'folder-locked.svg' 'folder-mail.svg' 'folder-network.svg' 'folder-pictures.svg' 'folder-print.svg'
                'folder-publicshare.svg' 'folder-root.svg' 'folder-script.svg' 'folder-sound.svg' 'folder-tar.svg' 'folder-temp.svg'
                'folder-templates.svg' 'folder-text.svg' 'folder-unlocked.svg' 'folder-videos.svg' 'network-workgroup.svg' 'user-home.svg')
findColorArray=('3daee9' '6cc1ef' '1272a5' '147eb8')
replaceColorArray=('575a5c' 'bdc3c7' '575a5c' '595959')

let k=0;

for i in "${fileNameArray[@]}"
do
    for j in "${findColorArray[@]}"
    do
        sudo sed -i -e "s/$j/${replaceColorArray[k]}/g" /usr/share/icons/breeze-dark/places/96/$i
        echo "s/$j/${replaceColorArray[k]}/g" /usr/share/icons/breeze-dark/places/96/$i
        ((k++))
    done
    k=0;
done

#For generating color of different folders
sudo sed -i -e "s/3bad7e/1b643f/g" /usr/share/icons/breeze-dark/places/96/folder-green.svg
sudo sed -i -e "s/8e44ad/693281/g" /usr/share/icons/breeze-dark/places/96/folder-violet.svg
sudo sed -i -e "s/f2cb40/8f720a/g" /usr/share/icons/breeze-dark/places/96/folder-yellow.svg
sudo sed -i -e "s/b5006a/80004a/g" /usr/share/icons/breeze-dark/places/96/folder-magenta.svg
sudo sed -i -e "s/8b6039/5b3f25/g" /usr/share/icons/breeze-dark/places/96/folder-brown.svg


placesArrayExcept96=('64' '48' '32'  '22' '16')

for j in "${placesArrayExcept96[@]}"
do
    for i in "${fileNameArray[@]}"
    do
        sudo cp /usr/share/icons/breeze-dark/places/96/$i /usr/share/icons/breeze-dark/places/$j/
    done
    #For copying Desktop
    sudo cp /usr/share/icons/breeze-dark/places/96/user-desktop.svg /usr/share/icons/breeze-dark/places/$j/
    sudo cp /usr/share/icons/breeze-dark/places/96/user-trash-full.svg /usr/share/icons/breeze-dark/places/$j/
    sudo cp /usr/share/icons/breeze-dark/places/96/user-trash.svg /usr/share/icons/breeze-dark/places/$j/

    #For changing color of different folders
    sudo sed -i -e "s/3bad7e/1b643f/g" /usr/share/icons/breeze-dark/places/$j/folder-green.svg
    sudo sed -i -e "s/8e44ad/693281/g" /usr/share/icons/breeze-dark/places/$j/folder-violet.svg
    sudo sed -i -e "s/f2cb40/8f720a/g" /usr/share/icons/breeze-dark/places/$j/folder-yellow.svg
    sudo sed -i -e "s/b5006a/80004a/g" /usr/share/icons/breeze-dark/places/$j/folder-magenta.svg
    sudo sed -i -e "s/8b6039/5b3f25/g" /usr/share/icons/breeze-dark/places/$j/folder-brown.svg
done

sudo cp /usr/share/icons/breeze-dark/devices/64/drive-harddisk.svg /usr/share/icons/breeze-dark/devices/22/
sudo cp /usr/share/icons/breeze-dark/devices/64/drive-harddisk.svg /usr/share/icons/breeze-dark/devices/16/
sudo cp /usr/share/icons/breeze-dark/devices/64/drive-harddisk-root.svg /usr/share/icons/breeze-dark/devices/22/
sudo cp /usr/share/icons/breeze-dark/devices/64/drive-harddisk-root.svg /usr/share/icons/breeze-dark/devices/16/
echo "Successfully!"
