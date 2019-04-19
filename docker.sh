# Install Docker-CE
echo "Install Docker-CE"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant
sudo systemctl enable docker.service
sudo systemctl start docker.service


# Install Docker Compose
echo "Install Docker Compose"
sudo pip install docker-compose
sudo yum upgrade python*

# Docker configuration
sudo curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose.sh


echo "Set Docker daemon.json"
sudo mkdir /etc/systemd/system/docker.service.d
sudo tee "/etc/systemd/system/docker.service.d/docker.conf" > "/dev/null" <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOF

sudo tee "/etc/docker/daemon.json" > "/dev/null" << EOF
{
  "hosts": [
    "fd://",
    "unix:///var/run/docker.sock",
    "tcp://0.0.0.0:2376"
  ],
  "storage-driver": "overlay2"
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker.service

# sudo curl -fsSL https://raw.githubusercontent.com/CWSpear/local-persist/master/scripts/install.sh | sudo bash
