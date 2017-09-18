#!/bin/bash

mkdir ./airootfs/etc/profile.d
cow_file=./airootfs/etc/profile.d/expand_cowsize.sh
size=1G
if [ "$1" != "" ]; then
    echo "Using custom size $1"
    size=$1
else
    echo "Using default size at $size"
fi

echo "#!/bin/bash" > $cow_file
echo "echo 'password' | sudo -S mount -o remount,size=$size /run/archiso/cowspace" >> $cow_file
chmod +x $cow_file
