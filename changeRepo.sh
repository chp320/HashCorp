#!/usr/bin/env bash
# modify a permission about CentOS-Base.repo
sudo mv /home/vagrant/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
sudo chown root:root /etc/yum.repos.d/CentOS-Base.repo
sudo chmod 644 /etc/yum.repos.d/CentOS-Base.repo