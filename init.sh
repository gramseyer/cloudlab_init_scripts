

if [ "$#" -gt 2 ]; then
	echo "usage: ./init.sh <cloudlab_hardware_type>";
	exit 1;
fi

set -ex

PARTITION=/dev/sda4

if [ $1 -eq "m510" ]; then
	PARTITION=/dev/nvme0n1p4
fi

sudo modprobe -v xfs

sudo fdisk -l

sudo mkfs.xfs $PARTITION

mkdir xfs

sudo mount $PARTITION xfs -o discard

sudo chmod -R 0777 xfs

