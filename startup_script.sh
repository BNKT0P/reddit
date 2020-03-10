#!/bin/sh

# ruby install 
sudo apt update -y
sudo apt install -y ruby-full ruby-bundler build-essential

# mongodb install
sudo rm -f /etc/apt/sources.list.d/mongodb*.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt update -y
sudo apt install -y mongodb-org
sudo systemctl start mongod && sudo systemctl enable mongod

# app deployment
git clone -b monolith https://github.com/BNKT0P/reddit.git 
cd reddit && bundle install
puma -d

