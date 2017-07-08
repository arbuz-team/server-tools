#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

echo -n "Podaj nazwę aplikacji: "
read app

echo -n "Podaj rozmiar dysku w MB: "
read size


# create virtual disk
dd if=/dev/zero of=$SCRIPT_DIR/vdisks/$app.ext4 bs=$sizeM count=1
mkfs.ext4 $SCRIPT_DIR/vdisks/$app.ext4

# mounted disk
mount -o loop,rw,usrquota,grpquota $SCRIPT_DIR/vdisks/$app.ext4 /home/internet/$app

# change permissions
chown www-data:www-data /home/internet/$app
chmod 775 /home/internet/$app

# append command line to fstab
echo "$SCRIPT_DIR/vdisks/$app.ext4 /home/internet/$app auto loop,rw,usrquota,grpquota 0 0" >> /etc/fstab