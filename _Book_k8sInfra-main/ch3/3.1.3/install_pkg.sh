#!/usr/bin/env bash

# install packages 
sudo yum install epel-release -y
sudo yum install vim-enhanced -y
sudo yum install git -y

# install docker 
sudo yum install docker-ce-18.06.0.ce-3.el7 docker-ce-cli-18.06.0.ce-3.el7 \
         containerd.io-1.2.6-3.3.el7 -y
sudo systemctl enable --now docker

# install kubernetes cluster 
sudo yum install kubectl-$1 kubelet-$1 kubeadm-$1 -y
sudo systemctl enable --now kubelet

# git clone _Book_k8sInfra.git 
if [ $2 = 'Main' ]; then
  git clone https://github.com/sysnet4admin/_Book_k8sInfra.git
  mv /home/vagrant/_Book_k8sInfra $HOME
  find $HOME/_Book_k8sInfra/ -regex ".*\.\(sh\)" -exec chmod 700 {} \;
fi
