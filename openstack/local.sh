#!/usr/bin/env bash

# Keep track of the devstack directory
TOP_DIR=$(cd $(dirname "$0") && pwd)

# Import common functions
source $TOP_DIR/functions

# Use openrc + stackrc + localrc for settings
source $TOP_DIR/stackrc

# Destination path for installation ``DEST``
DEST=${DEST:-/opt/stack}


# Import ssh keys
# ---------------

# Import keys from the current user into the default OpenStack user (usually
# ``demo``)

# Get OpenStack auth
source $TOP_DIR/openrc

# Add first keypair found in localhost:$HOME/.ssh
for i in $HOME/.ssh/id_rsa.pub $HOME/.ssh/id_dsa.pub; do
    if [[ -r $i ]]; then
        nova keypair-add --pub_key=$i `hostname`
        break
    fi
done


# Create A Flavor
# ---------------

# Get OpenStack admin auth
source $TOP_DIR/openrc admin admin

# Name of new flavor
# set in ``localrc`` with ``DEFAULT_INSTANCE_TYPE=m1.micro``
MI_NAME=m1.micro

# Create micro flavor if not present
if [[ -z $(nova flavor-list | grep $MI_NAME) ]]; then
    nova flavor-create $MI_NAME 6 128 0 1
fi


# Other Uses
# ----------

# Add tcp/22 and icmp to default security group
#nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
#nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
