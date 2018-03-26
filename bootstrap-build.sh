#!/usr/bin/env bash
set -x

# ansible installation
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -q
sudo apt-get install -y -q software-properties-common ansible python-pip

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -q
sudo apt-get install -y docker-ce

# zsh installation
sudo apt-get install -y -q zsh git-core
sudo su - vagrant -c "wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh"
sudo chsh -s `which zsh` vagrant

# add custom ip to hosts
# Remove entries created by vagrant:
sed -i "/$(hostname)/d" /etc/hosts

# Optionally add what you want:
echo "" >> /etc/hosts
grep 'dockerip' /etc/hosts || echo '192.168.20.100 dockerip' >> /etc/hosts
echo "" >> /etc/hosts

# add docker setup to vm
sed -i '/source bootstrap.sh/d' /home/vagrant/.zshrc
echo "source bootstrap.sh" >> /home/vagrant/.zshrc
