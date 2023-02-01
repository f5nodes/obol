#!/bin/bash

DIR="charon-distributed-validator-node"
CHARON_VER="v0.13.0"

sudo apt update
sudo apt install mc wget curl git htop net-tools jq build-essential ncdu tmux -y
bash <(curl -s https://raw.githubusercontent.com/f5nodes/root/main/install/docker.sh) &>/dev/null

git clone https://github.com/ObolNetwork/$DIR.git
chmod -R 707 $HOME/$DIR && cd $DIR

sudo docker run --rm -v "$(pwd):/opt/charon" obolnetwork/charon:$CHARON_VER create enr

echo -e "\n\e[93mYour \e[92menr\e[93m is above! \e[92mSave it!\e[0m"
echo -e "See one more: \e[92mcat $HOME/charon-distributed-validator-node/.charon/charon-enr-private-key\e[0m"