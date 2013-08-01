#!/bin/bash

cd
git clone https://github.com/openstack-dev/devstack.git
cd devstack
curl -O https://raw.github.com/jameskyle/snippets/master/openstack/local.sh
curl -O https://raw.github.com/jameskyle/snippets/master/openstack/localrc

# FIXFOR::  https://bugs.launchpad.net/neutron/+bug/1206013
cd /usr/local/lib/python2.7/dist-packages
sudo rm -rf oslo*
sudo pip install --upgrade http://tarballs.openstack.org/oslo.config/oslo.config-1.2.0a3.tar.gz#egg=oslo.config-1.2.0a3
