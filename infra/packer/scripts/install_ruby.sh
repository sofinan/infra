#!/bin/bash
who
sudo apt update
sleep 30
sudo apt install python-apt -y
sleep 30
sudo apt install ruby-bundler -y
sleep 30
sudo apt install gnupg2 -y
sleep 30
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sleep 30
curl -sSL https://get.rvm.io | bash -s stable
sleep 30
source /home/sofinan/.rvm/scripts/rvm
rvm requirements
rvm install 2.4.1
sleep 30
rvm use 2.4.1 --default
gem install bundler -V --no-ri --no-rdoc
