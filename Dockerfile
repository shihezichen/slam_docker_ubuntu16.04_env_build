FROM dorowu/ubuntu-desktop-lxde-vnc
LABEL maintainer="shihezichen@live.cn"


# RUN sed -i 's/tw\.archive\.ubuntu\.com/cn\.archive\.ubuntu.com/g' /etc/apt/sources.list
ADD sources.list /etc/apt/

RUN apt-get update \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
        vim g++ unzip wget git git-core build-essential cmake  doxygen \
		freeglut3 freeglut3-dbg freeglut3-dev gfortran graphviz libgtk2.0-dev  \
		libatlas-base-dev libavcodec-dev libavformat-dev libeigen3-dev	\
		libboost-dev libboost-filesystem-dev libboost-system1.58-dev libboost-thread-dev	\
		libcholmod3.0.6 ccache libcxsparse3.1.4 libflann-dev  libflann1.8	\
		libgflags-dev libglew-dev libgoogle-glog-dev libgtest-dev libboost-all-dev libqhull*	\
		libjasper-dev libjpeg8-dev libpng-dev libtiff-dev  libjpeg-dev libdc1394-22-dev liblapack-dev	\
		libphonon-dev libpng12-dev libqglviewer2 libqglviewer-dev libqhull-dev libopenexr-dev libpcap-dev	\
		libqt4-dev libsuitesparseconfig4.4.6 libsuitesparse-dev libswscale-dev liblapacke-dev	\
		libtbb-dev libtiff5-dev libudev-dev libusb-1.0-0-dev libusb-dev		\
		libv4l-dev libvtk5-dev libvtk5-qt4-dev libvtk-java libx264-dev  libvtk5.10-qt4 libvtk5.10 qt5-default	\
		pkg-config python2.7-dev python3.5-dev python3-dev python-numpy  python3-numpy python-vtk	\
		libtbb2 libtbb-dev  qt4-qmake qt-sdk tcl-vtk pylint libxi-dev libxmu-dev libxvidcore-dev  \
		openjdk-8-jdk openmpi-bin openmpi-common  openjdk-8-jre   \
		libxml2-dev libxslt-dev libffi-dev libsdl1.2-dev libssl-dev mono-complete mpi-default-dev  \
		liblapacke-dev checkinstall libopenblas-dev phonon-backend-gstreamer phonon-backend-vlc  \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN \
	cd /root && \
	wget  --no-check-certificate -O Sophus-master.zip https://codeload.github.com/strasdat/Sophus/zip/master && \
	unzip Sophus-master.zip && \
	mkdir -p /root/Sophus-master/build && cd /root/Sophus-master/build && \	
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local  .. && \
	make -j"$(nproc)" && make install && \
	cd /root && \
	wget  --no-check-certificate -O Pangolin-master.zip https://codeload.github.com/zzx2GH/Pangolin/zip/master && \
	unzip Pangolin-master.zip && \
	mkdir -p /root/Pangolin-master/build && cd /root/Pangolin-master/build && \
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local  .. && \
	make -j"$(nproc)" && make install && \	
	cd /root && \
	wget  --no-check-certificate  -O ceres-solver-master.zip https://codeload.github.com/ceres-solver/ceres-solver/zip/master && \
	unzip ceres-solver-master.zip && \
	mkdir -p /root/ceres-solver-master/build && cd /root/ceres-solver-master/build && \
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local  .. && \
	make -j"$(nproc)" && make install && \
	cd /root && \
	wget  --no-check-certificate  -O g2o-master.zip https://codeload.github.com/RainerKuemmerle/g2o/zip/master && \
	unzip g2o-master.zip && \
	mkdir -p /root/g2o-master/build && cd /root/g2o-master/build && \
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local  .. && \
	make -j"$(nproc)" && make install && \
	cd /root && \
	wget --no-check-certificate -O pcl-master.zip https://codeload.github.com/PointCloudLibrary/pcl/zip/master && \																																																																																																																																																																																																																																																																																																																																																																																																										
	unzip pcl-master.zip && \
	mkdir -p /root/pcl-master/build && cd /root/pcl-master/build && \
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
	make -j"$(nproc)" && make install

RUN \
	cd /root && \
	wget  --no-check-certificate -O opencv-3.2.0.zip  https://github.com/opencv/opencv/archive/3.2.0.zip  && \
	unzip opencv-3.2.0.zip && \
	wget  --no-check-certificate -O opencv_contrib-3.2.0.zip  https://github.com/opencv/opencv_contrib/archive/3.2.0.zip  && \
	unzip opencv_contrib-3.2.0.zip  && \
	wget  --no-check-certificate -O ippicv_linux_20151201.tgz https://github.com/opencv/opencv_3rdparty/blob/ippicv/master_20151201/ippicv/ippicv_linux_20151201.tgz  &&  \
	mkdir -p /root/opencv-3.2.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e   && \
	cp -p ippicv_linux_20151201.tgz /root/opencv-3.2.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e	&& \
	wget --no-check-certificate -O protobuf-cpp-3.1.0.tar.gz https://github.com/google/protobuf/releases/download/v3.1.0/protobuf-cpp-3.1.0.tar.gz  && \
	mkdir -p /root/opencv_contrib-3.2.0/modules/dnn/.download/bd5e3eed635a8d32e2b99658633815ef/v3.1.0/ && \
	cp -p /root/protobuf-cpp-3.1.0.tar.gz  /root/opencv_contrib-3.2.0/modules/dnn/.download/bd5e3eed635a8d32e2b99658633815ef/v3.1.0/  && \
	mkdir -p /root/opencv-3.2.0/build && cd /root/opencv-3.2.0/build && \
	cmake  -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_PYTHON_EXAMPLES=ON  -D INSTALL_C_EXAMPLES=ON \
		-D WITH_TBB=ON  -D WITH_V4L=ON -D WITH_QT=ON  -D WITH_GTK=ON  -D WITH_OPENGL=ON \
		-D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
		-D WITH_IPP=ON -D WITH_FFMPEG=ON -D FORCE_VTK=ON \
		-D BUILD_DOCS=OFF -DPYTHON_EXECUTABLE=$(which python) \
		-D OPENCV_EXTRA_MODULES_PATH=/root/opencv_contrib-3.2.0/modules ..	&& \
	make -j"$(nproc)" && make install 


WORKDIR /root

