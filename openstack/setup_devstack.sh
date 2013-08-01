#!/bin/bash

cd
git clone https://github.com/openstack-dev/devstack.git
cd devstack
curl -O https://raw.github.com/jameskyle/snippets/master/openstack/local.sh
curl -O https://raw.github.com/jameskyle/snippets/master/openstack/localrc

