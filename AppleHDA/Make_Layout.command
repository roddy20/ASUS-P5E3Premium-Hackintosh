#!/bin/sh
cd "$(dirname "$0")"

printf "\x1b[31m"
codesign --verify --no-strict  /S*/L*/E*/AppleHDA.kext/
printf "\x1b[30m"

echo "Codecs:"
for codec in $(ioreg -rxn IOHDACodecDevice | grep VendorID | awk '{ print $4 }')
do
case $codec in
0x1002*)
echo $codec ATI/AMD HDMI
;;
0x10de*)
echo $codec NVidia HDMI
;;
0x8086*)
echo $codec Intel HDMI
;;
*)
echo $codec HDA
codec_id=$codec

;;
esac
done

if [[ $(ioreg -rw 0 -p IODeviceTree -n HDEF) == "" ]]
then
echo "No HDEF device found!!"
exit
fi

layout_id=$(ioreg -rw 0 -p IODeviceTree -n HDEF | grep layout-id | sed -e 's/.*<//' -e 's/>//')
echo

let LayoutID="0x${layout_id:0:2}"
let CodecID=$codec_id

echo "HDA Codec found: " $codec_id
echo "Codec-ID: "        $CodecID
echo
echo "Layout-ID Dec: "   $LayoutID
echo "Layout-ID HEX: "   $layout_id

if [[ $layout_id == "" ]]
then
echo "No Layout ID injected!!"
#exit
fi

if [[ -e /System/Library/Extensions/AppleHDA.kext/Contents/Resources/layout$LayoutID.xml.zlib  ]]
then
echo "OK using LayoutID" $LayoutID
else
printf "\x1b[31m"
echo "LayoutID" $LayoutID "is not suitable your macOS version"
printf "\x1b[30m"
#exit
fi

#Creating Layout
L=layout$LayoutID.xml
rm -rf $L

/usr/libexec/PlistBuddy -c "Add :PathMapRef array" $L
/usr/libexec/PlistBuddy -c "Add :LayoutID integer $LayoutID" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0 dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:PathMapID integer 1" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Inputs array" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Inputs: string Mic" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Inputs: string LineIn" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:LineIn dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Outputs array" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Outputs: string IntSpeaker" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Outputs: string Headphone" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Outputs: string LineOut" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Outputs: string SPDIFOut" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:IntSpeaker dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Headphone dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:LineOut dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:SPDIFOut dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:CodecID array" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:CodecID: integer $CodecID" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0 dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:FunctionInfo dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:ParameterInfo dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:PatchbayInfo dict" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:FunctionInfo:DspFuncInstance integer 0" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:FunctionInfo:DspFuncName string DspNoiseReduction" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:FunctionInfo:DspFuncProcessingIndex integer 0" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:ParameterInfo:1 integer 0" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:ParameterInfo:2 integer 0" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:ParameterInfo:3 integer 0" $L
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:SignalProcessing:SoftwareDSP:DspFunction0:ParameterInfo:4 integer 0" $L
/usr/libexec/PlistBuddy -c "Copy:PathMapRef:0:Mic:SignalProcessing PathMapRef:0:LineIn:SignalProcessing" $L

echo "Creating MuteGPIO (50 80 100), Enter for exit, default 80"
read v
case v in
"")
exit
;;

50|80|100)
echo $v
;;

*)
v=80
;;

esac

echo "Enter Internal Mic Node, Enter to skip, 23"
read n
if [[ $n != "" ]]
then
let MuteGPIO=0x$(printf '%x\n' $v)0100$(printf '%x\n' $n)
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:Mic:MuteGPIO integer $MuteGPIO" $L
fi

echo "Enter External Mic (Line In) Node, Enter to skip, 20"
read n
if [[ $n != "" ]]
then
let MuteGPIO=0x$(printf '%x\n' $v)0100$(printf '%x\n' $n)
/usr/libexec/PlistBuddy -c "Add :PathMapRef:0:LineIn:MuteGPIO integer $MuteGPIO" $L
fi

