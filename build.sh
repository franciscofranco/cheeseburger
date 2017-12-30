#!/bin/bash

VERSION="11";
KFILE="fk_cheeseburger.zip";
KSIGNED_FILE="fk_cheeseburger-signed.zip";
RAMDISK="ramdisk_cheeseburger";

echo $VERSION > .version;
make -j32;
cp -a arch/arm64/boot/Image.gz-dtb ../$RAMDISK/zImage;

if [ -d ~/tmp ]; then
        rm -rf ~/tmp;
fi

mkdir ~/tmp;
rm /home/$RAMDISK/$KFILE;
cp -a /home/ak2/* ~/tmp;
cp -a /home/$RAMDISK/* ~/tmp;
cp -a /home/arm64_tools/* ~/tmp;

cd ~/tmp;
zip -r $KFILE * -x \*.git\*;

cd /home/zipsign;
./sign.sh test ~/tmp/$KFILE;

cd ~/tmp;
mv $KSIGNED_FILE /home/$RAMDISK/$KFILE;

rm -rf ~/tmp;
