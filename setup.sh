#!/bin/bash

DIR="lido-charon-distributed-validator-node"
CHARON_VER="v0.17.1"

sudo apt update
sudo apt install mc wget curl git htop net-tools jq build-essential ncdu tmux -y
bash <(curl -s https://raw.githubusercontent.com/f5nodes/root/main/install/docker.sh) &>/dev/null

git clone https://github.com/ObolNetwork/$DIR.git
cd $DIR

sudo docker run -u $(id -u):$(id -g) --rm -v "$(pwd):/opt/charon" obolnetwork/charon:$CHARON_VER create enr

echo -e "\n\e[93mYour \e[92menr\e[93m is above! \e[92mSave it!\e[0m"
echo -e "\e[93mPlease make sure to create a backup of the private key create at \e[92m.charon/charon-enr-private-key\e[0m\n"

