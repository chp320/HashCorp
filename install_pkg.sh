#!/usr/bin/env bash
# install packages
sudo yum install epel-release -y
sudo yum install vim-enhanced -y
# copy edited CentOS-Base.repo
#sudo cp /vagrant_data/CentOS-Base.repo /etc/yum.repos.d/