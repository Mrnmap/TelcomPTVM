#!/bin/bash
sudo apt update
sudo apt upgrade
apt install libboost1.67* libpython3.8-dev cmake build-essential  python3-pyqt4 python3-qwt  python3-guiqwt python3-pyqt5.qwt python-qt4 libgmp-dev libxi-dev libgsl-dev libcppunit-dev libx11-6 libx11-dev flex libncurses5 libncurses5-dev libncursesw6 libpcsclite-dev libsdl1.2-dev zlib1g-dev libmpfr6 libmpc3 lemon aptitude libtinfo-dev libtool shtool autoconf git-core pkg-config make libmpfr-dev python-cheetah  libmpc-dev libtalloc-dev libfftw3-dev libgnutls28-dev libssl1.0-dev libtool-bin python-lxml libxml2-dev python-sip  libqt4-opengl-dev sofia-sip-bin libsofia-sip-ua-dev sofia-sip-bin libncursesw5-dev bison libgmp3-dev alsa-oss asn1c libdbd-sqlite3 libboost-all-dev libusb-1.0-0-dev python-mako python3-mako doxygen python-docutils cmake build-essential g++ libpython-dev python-numpy python3-numpy swig libsqlite3-dev libi2c-dev libwxgtk3.0-gtk3-dev freeglut3-dev composer phpunit python3-pip python-pip libfontconfig1-dev libxrender-dev python-sip-dev python-sphinx libusb-dev libusb-1.0.0-dev libcomedi-dev libzmq3-dev
sudo pip install requests
sudo pip3 install requests
# 4G Redirect
# Clone or download the necessary repositories :
git clone https://github.com/ettusresearch/uhd
cd uhd
# Tested with checkout aea0e2de34803d5ea8f25d7cf2fb08f4ab9d43f0
git checkout aea0e2de34803d5ea8f25d7cf2fb08f4ab9d43f0
cd host && mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../../..
git clone https://github.com/pothosware/SoapySDR
cd SoapySDR
# Tested with checkout f722f9ce5b629c3c44401a9bf628b3f8e67a9695
git checkout f722f9ce5b629c3c44401a9bf628b3f8e67a9695
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..
git clone https://github.com/nuand/BladeRF
# Necessary even if you don't have a blade) tested with checkout 45521019c540392287eb6e03d52b8073b2fd0743
cd BladeRF
git checkout 45521019c540392287eb6e03d52b8073b2fd0743
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..
echo "Have you a BladeRF ? y/N"
read reponse
if [[ "$reponse" == "y" ]]
# Clone SoapyBladeRF (only if you have a BladeRF) tested with checkout 1c1e8aaba5e8ee154b34c6c3b17743d1c9b9a1ea
then 
    git clone https://github.com/pothosware/SoapyBladeRF
    cd SoapyBladeRF
    git checkout 1c1e8aaba5e8ee154b34c6c3b17743d1c9b9a1ea
    mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
    cd ../..
fi
git clone https://github.com/pothosware/SoapyUHD
cd SoapyUHD
git checkout 47972ba8b96beffb79915e300acea168bacd8d84
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..
echo "Have you a LimeSDR ? y/N"
read reponse
if [[ "$reponse" == "y" ]]
# Clone LimeSuite (only if you have a Lime) tested with checkout c931854ead81307206bce750c17c2301810b5545
then 
    git clone https://github.com/myriadrf/LimeSuite
    cd LimeSuite
    git checkout c931854ead81307206bce750c17c2301810b5545
    cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
    cd ../..
fi
git clone https://github.com/gnuradio/gnuradio
# Tested with checkout 2d7f82342c1d63a1c4d7e18eb1289636ebcbb855
cd gnuradio
git checkout 2d7f82342c1d63a1c4d7e18eb1289636ebcbb855
git submodule init && git submodule update
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..
git clone https://github.com/osmocmo/gr-osmosdr
# Tested with checkout 4d83c60
cd gr-osmosdr
git checkout 4d83c60
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..
wget https://tls.mbed.org/download/polarssl-1.3.7-gpl.tgz && tar zxvf polarssl-1.3.7-gpl.tgz
cd polarssl-1.3.7
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..
git clone https://github.com/bbaranoff/openlte
# Tested with checkout 4bd673b
cd openlte
git checkout 4bd673b
mkdir build && cd build && cmake .. && make -j$(nproc) && sudo make install && ldconfig
cd ../..