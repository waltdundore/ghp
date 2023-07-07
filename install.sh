#!/bin/bash

cd ~
sudo apt -y install git
git clone -b master https://github.com/waltdundore/ghp.git

cd ghp
docker build -t kiddoctf .
docker run --rm -ti kiddoctf:latest
