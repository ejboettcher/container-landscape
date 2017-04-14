#/bin/bash
##### instructions found here with more info: https://github.com/NERSC/shifter/blob/master/doc/install/manualinstallgpu.rst
## setup script for Shifter Runtime
sudo apt-get install unzip libjson-c2 libjson-c-dev libmunge2 libmunge-dev \
                     libcurl4-openssl-dev autoconf automake libtool curl \
                     make xfsprogs python-dev libcap-dev wget


git clone https://github.com/NERSC/shifter.git
cd shifter

export SHIFTER_SYSCONFDIR=/etc/shifter
export UDIROOT_PREFIX=/opt/shifter/udiRoot

./autogen.sh
./configure --prefix=$UDIROOT_PREFIX         \
            --sysconfdir=$SHIFTER_SYSCONFDIR \
            --with-json-c                    \
            --with-libcurl                   \
            --with-munge                     \
            --with-slurm=/path/to/your/slurm/installation
make -j8
sudo make install


sudo ln -s $UDIROOT_PREFIX/bin/shifter /usr/bin/shifter
sudo ln -s $UDIROOT_PREFIX/bin/shifterimg /usr/bin/shifterimg
sudo mkdir -p /usr/libexec/shifter
sudo ln -s /opt/shifter/udiRoot/libexec/shifter/mount /usr/libexec/shifter/mount
sudo mkdir -p $SHIFTER_SYSCONFDIR


##########################################################################
## setup script for image gateway
sudo apt-get install mongodb redis-server squashfs-tools

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install virtualenv

export IMAGEGW_PATH=/opt/shifter/imagegw
export IMAGES_CACHE_PATH=/scratch/shifter/images/cache
export IMAGES_EXPAND_PATH=/var/shifter/expand
mkdir -p $IMAGEGW_PATH
mkdir -p $IMAGES_CACHE_PATH
mkdir -p $IMAGES_EXPAND_PATH


cp -r imagegw/* $IMAGEGW_PATH


cd $IMAGEGW_PATH
# Install the virtualenv and all python dependencies as root
sudo -i
# Set the interpreter for the virtualenv to be python2.7
virtualenv python-virtualenv --python=/usr/bin/python2.7
source python-virtualenv/bin/activate
# The requirement file should already be here if the imagegw folder has been copied
# from the Shifter sources
pip install -r requirements.txt
deactivate
# If you switched to root, return to your user
exit


wget https://github.com/rukkal/virtual-cluster/archive/master.zip
mv master.zip virtual-cluster-master.zip
unzip virtual-cluster-master.zip


cd virtual-cluster-master/shared-folder/installation
sudo cp start-imagegw.sh ${IMAGEGW_PATH}/start-imagegw.sh
sudo cp init.d.shifter-imagegw /etc/init.d/shifter-imagegw

sudo cp imagemanager.json.local $SHIFTER_SYSCONFDIR/imagemanager.json

SYSTEMS="mycluster"

sudo systemctl start redis
sudo systemctl start mongod

sudo /etc/init.d/shifter-imagegw start