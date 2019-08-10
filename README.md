slam docker ubuntu16.04 environment
=========================
Docker image to provide VNC interface to access Ubuntu 16.04 LXDE desktop SLAM development environment which has already 
install the Sophus, G2o, Pangolin, Ceres, PCL, Opencv libraries.

Install the docker 
-------------------------
Type the following command to download and install the docer 17.12 ce if you haven't installed it:

```
sudo install_docker.sh
```
Skip this step if the docker is already ready.

Build the docker image with Dockerfile
-------------------------
Download the Dockerfile and run the docker image build command at same directory:

```
sudo docker build -t shihezichen/slam_ubuntu16.04_desktop_env  ./
```

Quick Start
-------------------------
Run the docker image with VNC port, password, docker user and password , resolution:

```
sudo docker run -it --rm -p 5900:5900  \
      -e VNC_PASSWORD=hadoop -e RESOLUTION=1920x1080  \
      -e USER=hadoop -e PASSWORD=hadoop  \
      shihezichen/slam_ubuntu16.04_desktop_env
```

Q&A
==================

Please contact me (shiehzichen@live.cn) if you have any question and suggestion.


How to access the docker desktop with VNC
-------------------------
If you are using windows OS, you can download the VNC client and then access the ubuntu's ip:5900 through vnc with it.
There are many VNC client softwares, like VNC Viewer(https://www.realvnc.com), MobaXterm (https://mobaxterm.mobatek.net), etc.
