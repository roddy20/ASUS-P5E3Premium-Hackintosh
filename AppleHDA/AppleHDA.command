#!/bin/sh

cd "$(dirname "$0")"

for file in *.xml
do
echo "Compressing" $file
perl zlib.pl deflate "$file" > "${file%%.*}.zml.zlib"
done

sudo rm -rf /S*/L*/E*/AppleHDA.kext/Contents/Resources/*.zml.zlib
codesign --verify --no-strict  /S*/L*/E*/AppleHDA.kext/

sudo cp *.zml.zlib /S*/L*/E*/AppleHDA.kext/Contents/Resources
#sudo cp -r PinConfigs.kext /S*/L*/E*/
sudo touch /S*/L*/E*/

