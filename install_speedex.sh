
git clone https://github.com/scslab/speedex.git

chmod -R 0777 speedex

cd speedex
git submodule update --init --recursive

./autogen.sh
./configure
make -j

