#!/usr/bin/env bash
set -x

# ansible installation
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -q
sudo apt-get install -y -q software-properties-common ansible python-pip

# zsh installation
sudo apt-get install -y -q zsh git-core
sudo su - vagrant -c "wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh"
sudo chsh -s `which zsh` vagrant
