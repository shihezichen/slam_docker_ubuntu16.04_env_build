slam docker ubuntu16.04 environment
=========================
Docker image to provide VNC interface to access Ubuntu 16.04 LXDE desktop SLAM development environment which has already 
install the Sophus, G2o, Pangolin, Ceres, PCL, Opencv libraries.

Install the docker 
-------------------------
Input following command to download and install the docer 17.12 ce if you haven't installed it:

```
install_docker.sh
```
Skip this step if the docker is already ready.

Build the docker image with Dockerfile
-------------------------
Download the Dockerfile and run the docker image build command at same directory:

```
docker build -t shihezichen/slam_ubuntu16.04_desktop_env  ./
```

Quick Start
-------------------------
Run the docker image with VNC port, password, docker user and password , resolution:

```
docker run -it --rm -p 5900:5900  \
      -e VNC_PASSWORD=hadoop -e RESOLUTION=1920x1080  \
      -e USER=hadoop -e PASSWORD=hadoop  \
      shiezichen/slam_ubuntu16.04_desktop_env
```


License
==================

See the LICENSE file for details.
