#!/bin/bash

#required utilities
sudo apt-get install -y tar wget git

#require openJDK
sudo apt-get install -y openjdk-7-jdk

#Mesos dependencies
sudo apt-get -y install build-essential python-dev python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev

