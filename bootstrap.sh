#!/bin/bash

CHEF_VERSION="0.6.2-1"
CHEF_DEB=chefdk_${CHEF_VERSION}_amd64.deb
if ! command -v berks &>/dev/null; then
  wget "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/${CHEF_DEB}"
  sudo dpkg -i $CHEF_DEB
  rm -f $CHEF_DEB
fi

VAGRANT_VERSION="1.7.3"
VAGRANT_DEB=vagrant_${VAGRANT_VERSION}_x86_64.deb
if ! command -v vagrant &>/dev/null; then
  wget "https://dl.bintray.com/mitchellh/vagrant/${VAGRANT_DEB}"
  sudo dpkg -i $VAGRANT_DEB
  rm -f $VAGRANT_DEB
fi

vagrant plugin install vagrant-aws
vagrant plugin install vagrant-env
vagrant plugin install vagrant-omnibus
