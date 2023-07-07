#!/bin/bash

cd ~
sudo apt -y install git
git clone https://github.com/waltdundore/ghp.git

cd ghp
docker build -t kiddoctf .
docker run --rm -ti kiddoctf:latest
