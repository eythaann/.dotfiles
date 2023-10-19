#!/bin/bash
sudo apt install -y build-essential libssl-dev

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

nvm install node
nvm use node

node -v
npm -v