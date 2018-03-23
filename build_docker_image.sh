#!/bin/sh

# function: build a slam evnironmen docker images and run it
# author: shihezichen@live.cn


if [ ! -f "./Dockerfile" ]; then
	echo "Can't find the Dockerfile. exit with 1"
	exit 1
fi

echo "- docker build -t shihezichen/slam_ubuntu16.04_desktop_env  ./"
echo ""
sudo docker build -t shihezichen/slam_ubuntu16.04_desktop_env  ./
if [ $? -ne 0 ]; then
	echo "FAILED. exit with 1"
	exit 1
else
	echo ""
	echo "done."
fi

echo "- docker images"
sudo docker images


echo "- run docker container shihezichen/slam_ubuntu16.04_desktop_env "
sudo docker run -it --rm -p 5900:5900  \
      -e VNC_PASSWORD=hadoop -e RESOLUTION=1920x1080  \
      -e USER=hadoop -e PASSWORD=hadoop  \
      shihezichen/slam_ubuntu16.04_desktop_env

