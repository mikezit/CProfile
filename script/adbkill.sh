#author jianjun cienet
#!/bin/bash
if [ $# -ne 1 ] 
then
    echo "usage: adbkill name"
fi
psname=$1
psnum=$(adb shell "ps" |grep $psname|awk '{print $2}')
if [ -z $psnum ]
then 
    echo "no such process $psname"
    exit
fi
echo "adb shell kill -9 $psnum"|xargs -i bash -c {}
echo "process killed : $psnum"