#!/bin/bash
sudo apt update
wget -O get-docker.sh https://get.docker.com
sh get-docker.sh
sudo usermod -aG docker $USER
apt-get install docker-compose -y
sudo chmod +x /usr/bin/docker-compose
docker -v
docker-compose --version
rm -rf get-docker.sh

git clone https://github.com/ObolNetwork/charon-distributed-validator-node.git
chmod o+w charon-distributed-validator-node
cd charon-distributed-validator-node
docker run --rm -v "$(pwd):/opt/charon" ghcr.io/obolnetwork/charon:v0.8.0 create enr

echo -e "\n\e[93mYour \e[92menr\e[93m is above! \e[92mSave it!\e[0m"
echo -e "See one more: \e[92mcat $HOME/charon-distributed-validator-node/.charon/charon-enr-private-key\e[0m"