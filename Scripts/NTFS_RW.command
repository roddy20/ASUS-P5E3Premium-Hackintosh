#!/bin/sh
#  Created by Rodion Shingarev on 29.11.18.

for ntfs in $(diskutil list | grep Microsoft\ Basic\ Data | awk '{ print $5 }')
do
echo 'LABEL='$ntfs' none ntfs rw,auto,nobrowse' | sudo tee -a /etc/fstab
done
sudo reboot
