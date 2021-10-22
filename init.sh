

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

sudo mkfs.xfs $PARTITION -f

mkdir xfs

sudo mount $PARTITION xfs -o discard

sudo chmod -R 0777 xfs

sudo chmod -R 0777 cloudlab_init_scripts

sudo apt-get update

sudo apt-get install cxxtest -y
sudo apt-get install golang-go -y


sudo add-apt-repository ppa:ethereum/ethereum -y
sudo add-apt-repository ppa:ethereum/ethereum-dev -y
sudo apt-get update

sudo apt-get install solc -y

sudo apt-get install cgroup-tools -y

#sudo cgconfigparser -l ./cloudlab_init_scripts/cgroup_configs_$1

sudo apt-get install linux-tools-common -y
sudo apt-get install linux-tools-5.4.0-51-generic -y

./install_speedex.sh
