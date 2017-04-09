#!/bin/bash
git clone git@github.com:singularityware/singularity.git
cd singularity
sudo ./configure && make && make install
