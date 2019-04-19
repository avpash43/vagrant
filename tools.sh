#!/bin/sh

# Tools
echo "install tools"
sudo yum -y install bash-completion bash-completion-extras
sudo yum -y install git
sudo yum -y install nano
sudo yum -y install mc
sudo yum -y install sshpass
sudo pip install cookiecutter
sudo pip install pywinrm[credssp]

# Dev tools
echo "install dev tools"
sudo pip install ansible
sudo pip install git+https://github.com/ansible/molecule.git
sudo pip install git+https://github.com/ansible/ansible-lint.git
