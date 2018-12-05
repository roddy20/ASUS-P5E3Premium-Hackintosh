#!/bin/sh
#  Created by Rodion Shingarev on 29.11.18.

sudo echo 

uuid=$(ioreg -lw0 -p IODeviceTree | grep boot-log | sed -e 's/.*<//' -e 's/>//' | xxd -r -p | grep SelfDevicePath | awk -F'GPT,' '{print $2}' | cut -d, -f1)

for S in /Volumes/*
do
if [  -f "$S/System/Library/CoreServices/boot.efi" ]
then
echo
echo $S
sudo defaults write "$S/private/var/root/Library/Preferences/com.apple.loginwindow.plist" LogoutHook /.LogoutHook
sudo defaults read "$S/private/var/root/Library/Preferences/com.apple.loginwindow.plist"

echo $'#!/usr/bin/env bash\n\ndiskutil mount '$uuid' && nvram -x -p > /Volumes/EFI/nvram.plist' | sudo tee "$S/.LogoutHook"
#echo $'#!/usr/bin/env bash\n\' | sudo tee "$S/.LogoutHook"
#echo "diskutil mount $uuid && nvram -x -p > /Volumes/EFI/nvram.plist" | sudo tee -a "$S/usr/local/bin/logout"
sudo chmod +x "$S/.LogoutHook"

fi

done
