function install {
  echo installing $1
  shift
  sudo apt-get -y install "$@"
}

sudo apt-get -y update

install 'development tools' build-essential
install 'git' git

cd
mkdir llvm
wget -qnc http://llvm.org/releases/3.0/llvm-3.0.tar.gz
tar xzvf llvm-3.0.tar.gz
wget -qnc http://llvm.org/releases/3.0/clang-3.0.tar.gz
tar xzvf clang-3.0.tar.gz

mv llvm-3.0.src llvm/src
mv clang-3.0.src llvm/src/tools/clang
cd llvm
mkdir build
cd build
../src/configure --enable-shared
make

export LLVM_COMPILER=clang
export LD_LIBRARY_PATH=$HOME/llvm/build/Release/lib
export PATH=$PATH:$HOME/llvm/build/Release/bin

echo "export LLVM_COMPILER=clang" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$HOME/llvm/build/Release/lib" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/llvm/build/Release/bin" >> ~/.bashrc

cd
wget -qnc http://prdownloads.sourceforge.net/scons/scons-2.4.0.tar.gz
tar xzvf scons-2.4.0.tar.gz
mv scons-2.4.0 scons
cd scons
sudo python2.7 setup.py install

cd
git clone https://github.com/corvette-berkeley/precimonious.git
cd precimonious

export CORVETTE_PATH=$HOME/precimonious
echo "export CORVETTE_PATH=$HOME/precimonious" >> ~/.bashrc

cd src
sed -i "s/SHLINKFLAGS='-Wl',/SHLINKFLAGS='',/g" SConscript
scons -Uc
scons -U
scons -U test

echo 'all set, rock on!'
