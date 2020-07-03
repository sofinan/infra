#!/bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
sleep 30
sudo echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sleep 30
sudo apt-get update
sleep 30
sudo apt install mongodb-org -y
sleep 30
sudo systemctl start mongod
sudo systemctl enable mongod