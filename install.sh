#!/bin/bash

sudo dnf -y install git
sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker --now
sudo usermod -aG docker $USER

sudo docker pull geekender/ghpctf:latest
sudo docker run --rm -ti geekender/ghpctf:latest