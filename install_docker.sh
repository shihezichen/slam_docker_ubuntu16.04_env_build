#!/bin/sh

# function: download ans install docker 17.12 ce
# author: shihezichen@live.cn

echo ""
echo "This program will download docker from docker.com and install it."
echo ""

echo "- sudo apt-get install depend libraries"
sudo apt-get install -y apt-transport-https \
	ca-certificates curl software-properties-common
if [ $? -ne 0 ]; then
	echo "FAILED. exit with 1"
	exit 1
else
	echo "done."
fi

echo "download docker from docker.com website"
wget --no-check-certificate  https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.12.1~ce-0~ubuntu_amd64.deb
if [ $? -ne 0 ]; then
	echo "FAILED. exit with 1"
	exit 1
else
	echo "done."
fi

echo "sudo dpkg -i docker-ce_17.12.1~ce-0~ubuntu_amd64.deb"
sudo dpkg -i docker-ce_17.12.1~ce-0~ubuntu_amd64.deb
if [ $? -ne 0 ]; then
	echo "FAILED. exit with 1"
	exit 1
else
	echo "done."
fi

