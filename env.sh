#!/usr/bin/env bash
CAFE_PATH=/home/ubuntu/caffe-rc5
HOME_PATH=$(eval echo "~$ubuntu")
install_basic_deps()
{
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install -y build-essential cmake git pkg-config
    sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler
    sudo apt-get install -y libatlas-base-dev 
    sudo apt-get install -y --no-install-recommends libboost-all-dev
    sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev

    # (Python general)
    sudo apt-get install -y python-pip
    # (Python 2.7 development files)
    sudo apt-get install -y python-dev
    sudo apt-get install -y python-numpy python-scipy
    # (OpenCV 2.4)
    sudo apt-get install -y libopencv-dev
    sudo apt-get install -y unzip
    pip install --upgrade pip
    pip install IPython==5.0 --user
    pip install jupyter --user
    jupyter_path=$HOME_PATH/.jupyter
    mkdir -p $jupyter_path && cp /vagrant/data/jupyter_notebook_config.py $jupyter_path/.
}


setup_caffe()
{
    cd /home/ubuntu
    sudo rm -rf rc5.zip* caffe-rc5/
    wget https://github.com/BVLC/caffe/archive/rc5.zip && unzip rc5.zip && cd caffe-rc5
    cp Makefile.config.example Makefile.config
    sed -i 's/\# CPU_ONLY/CPU_ONLY/g' Makefile.config
    find . -type f -exec sed -i -e 's^"hdf5.h"^"hdf5/serial/hdf5.h"^g' -e 's^"hdf5_hl.h"^"hdf5/serial/hdf5_hl.h"^g' '{}' \;
    cd /usr/lib/x86_64-linux-gnu
    sudo ln -s libhdf5_serial.so.10.1.0 libhdf5.so
    sudo ln -s libhdf5_serial_hl.so.10.0.2 libhdf5_hl.so 
    cd $CAFE_PATH/python
    for req in $(cat requirements.txt); do sudo pip install $req; done
    cd $CAFE_PATH && sudo make all && sudo make test && sudo make runtest && sudo make pycaffe && sudo make distribute
    cd $CAFE_PATH/models/bvlc_googlenet/ && wget http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel
}

setup_all()
{
    install_basic_deps
    setup_caffe
}

export PYTHONPATH=/home/ubuntu/caffe-rc5/python:$PYTHONPATH
alias dream="jupyter notebook --ip='0.0.0.0'"