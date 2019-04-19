#!/bin/sh

# Update system
echo "Update System"
sudo yum install -y epel-release
sudo yum update -y
sudo yum upgrade -y
sudo yum install -y gcc python-pip python-devel openssl-devel
sudo pip install --upgrade pip
sudo pip install --upgrade setuptools
