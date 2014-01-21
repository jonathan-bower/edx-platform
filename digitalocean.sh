#!/usr/bin/env bash

sudo apt-get install -y python-pip python-apt git-core build-essential python-dev libxml2-dev libxslt-dev curl
sudo apt-get install -y software-properties-common python-software-properties
sudo apt-get install python-pip python-dev build-essential
wget https://bitbucket.org/pypa/setuptools/raw/0.8/ez_setup.py -O - | sudo python
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

cd /var/tmp

git clone https://github.com/zipfian/configuration

cd /var/tmp/configuration

sudo pip install -r requirements.txt

sudo echo "rabbit" > /etc/hostname
sudo echo "127.0.0.1 rabbit" >> /etc/hosts
sudo hostname -F /etc/hostname

cd /var/tmp/configuration/playbooks

sudo ansible-playbook -c local ./edx_sandbox.yml -i "localhost,"