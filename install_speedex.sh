cd ~/xfs

git clone https://github.com/scslab/speedex.git
cd speedex
git submodule update --init --recursive

./autogen.sh
./configure
make -j

