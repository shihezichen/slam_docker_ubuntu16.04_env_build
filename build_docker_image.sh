#!/bin/sh

# function: build a slam evnironmen docker images
# author: shihezichen@live.cn


if [ ! -f "./Dockerfile" ]; then
	echo "Can't find the Dockerfile. exit with 1"
	exit 1
fi

echo ""
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

echo ""
echo "- docker images"
echo ""
sudo docker images



echo ""
echo "- start docker container shihezichen/slam_ubuntu16.04_desktop_env "
echo "docker run -it --rm -p 5900:5900  \"
echo "      -e VNC_PASSWORD=hadoop -e RESOLUTION=1920x1080  \"
echo "      -e USER=hadoop -e PASSWORD=hadoop  \"
echo "      shihezichen/slam_ubuntu16.04_desktop_env"
sudo docker run -it --rm -p 5900:5900  \
      -e VNC_PASSWORD=hadoop -e RESOLUTION=1920x1080  \
      -e USER=hadoop -e PASSWORD=hadoop  \
      shihezichen/slam_ubuntu16.04_desktop_env


