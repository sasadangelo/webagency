#!/bin/bash
####################################################################
# Licensed Materials - Property of Salvatore D'Angelo
#
# (C) Copyright Salvatore D'Angelo 2020
###################################################################
SWAP_SIZE_MB=2000
USER=ubuntu

###################################################################
# Run the following script using the command:
#     sudo ./setup.sh
###################################################################

###################################################################
# setup_swap
#
# Input Parameters: none
# Description: this function setup the swap space for Docker
# Return: none
###################################################################
setup_swap() {
    dd if=/dev/zero of=/swapfile bs=1M count=$SWAP_SIZE_MB
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    swapon -s
    if ! grep "/swapfile" /etc/fstab; then
        echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
    fi
}

###################################################################
# install_docker
#
# Input Parameters: none
# Description: this function install docker
# Return: none
###################################################################
install_docker() {
    snap install docker
    sudo addgroup --system docker
    adduser $USER docker
    newgrp docker
    snap disable docker
    snap enable docker
}

###################################################################
# Main block
###################################################################
setup_swap
install_docker
