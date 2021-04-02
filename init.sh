

if [[ "$#" -gt 2 ]]; then
	echo "usage: ./init.sh <cloudlab_hardware_type>";
	exit 1;
fi

set -ex

PARTITION=/dev/sda4

if [[ "$1" == "m510" ]]; then
	PARTITION=/dev/nvme0n1p4
fi

sudo modprobe -v xfs

sudo fdisk -l

sudo mkfs.xfs $PARTITION

mkdir xfs

sudo mount $PARTITION xfs -o discard

sudo chmod -R 0777 xfs

sudo apt-get install cxxtest -y
sudo apt-get install golang-go -y


sudo add-apt-repository ethereum/ethereum -y
sudo add-apt-repository ethereum/ethereum-dev -y
sudo apt-get update

sudo apt-get install solc -y
