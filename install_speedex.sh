
git clone https://github.com/scslab/speedex.git
git config core.fileMode false

chmod -R 0777 speedex

cd speedex
git submodule update --init --recursive

./autogen.sh
./configure
make -j

sudo chmod -R 0777 .

