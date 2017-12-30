#!/bin/bash

ANDROID="7.1.1"
DEVICE="OnePlus5"

VERSION=`cat .version`

ORIG_FILE="../ramdisk_cheeseburger/fk_cheeseburger.zip"
DEST_FILE="fk-r${VERSION}-anykernel2.zip"

URL="/var/www/${DEVICE}/${ANDROID}"

echo $ORIG_FILE
echo $DEST_FILE
echo $URL

cp $ORIG_FILE $URL/anyKernel/$DEST_FILE
echo r$VERSION > $URL/appfiles/version
