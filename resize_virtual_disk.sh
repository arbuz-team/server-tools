#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

echo -n "Podaj nazwę aplikacji: "
read app

echo -n "Podaj nowy rozmiar dysku w MB: "
read size


# resize virtual disk
umount /home/internet/$app
e2fsck -f $SCRIPT_DIR/vdisks/$app.ext4
resize2fs -p $SCRIPT_DIR/vdisks/$app.ext4 $sizeM

# mounted disk
mount -o loop,rw,usrquota,grpquota $SCRIPT_DIR/vdisks/$app.ext4 /home/internet/$app
