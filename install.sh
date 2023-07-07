#!/bin/bash

cd ~
sudo apt -y install git
git clone -b master https://github.com/waltdundore/ghp.git

sudo apt -y update

printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" |
  sudo tee /etc/apt/sources.list.d/docker-ce.list

curl -fsSL https://download.docker.com/linux/debian/gpg |
  sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg

sudo apt -y update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker --now
sudo usermod -aG docker $USER

cd ghp
docker build -t kiddoctf .
docker run --rm -ti kiddoctf:latest
