<<<<<<< HEAD
#/bin/bash

## setup script for Singularity
=======
#!/bin/bash
VERSION=2.2.1
wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
tar xvf singularity-$VERSION.tar.gz
cd singularity-$VERSION
./configure --prefix=/usr/local
make
sudo make install
>>>>>>> 2057f84c176c82556b473269873ccd89274a31b3
