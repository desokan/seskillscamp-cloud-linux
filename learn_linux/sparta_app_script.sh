#!/bin/bash

# update
sudo apt update -y

# upgrade
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y

# download node.js
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh

# runs the node.js setup file
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh

# install node.js
sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y

# install unzip
sudo DEBIAN_FRONTEND=noninteractive apt install unzip

# unzip the file
unzip nodejs20-sparta-test-app.zip

# change directory
cd app

# install dependencies
sudo npm install

# start the app
npm start

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo enable restart nginx
