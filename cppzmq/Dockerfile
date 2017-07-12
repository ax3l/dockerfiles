FROM       ubuntu:16.04

ENV        DEBIAN_FRONTEND noninteractive

# install minimal spack dependencies
RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              autoconf \
              autogen \
              autotools-dev \
              automake \
              bash-completion \
              ca-certificates \
              cmake \
              git \
              build-essential \
              libtool \
              pkg-config \
              unzip \
              wget \
           && rm -rf /var/lib/apt/lists/*

RUN        g++ --version

ENV        ZMQ_VERSION 4.2.2
RUN        wget -q https://github.com/zeromq/libzmq/releases/download/v$ZMQ_VERSION/zeromq-$ZMQ_VERSION.tar.gz
#RUN        git clone --depth=50 https://github.com/zeromq/libzmq.git --branch=v$ZMQ_VERSION \
#           && mv libzmq zeromq-$ZMQ_VERSION

RUN        wget -q https://github.com/zeromq/cppzmq/archive/v4.2.1.tar.gz

RUN        tar -xzf zeromq-$ZMQ_VERSION.tar.gz
RUN        tar -xzf v4.2.1.tar.gz
RUN        ls
RUN        cd /zeromq-$ZMQ_VERSION/ && ./autogen.sh

RUN        mkdir build \
           && cd build \
           && cmake ../zeromq-$ZMQ_VERSION -DCMAKE_INSTALL_PREFIX=/usr \
           && make -j4 install
RUN        ls /usr/lib
RUN        ls /usr/include
RUN        cd build \
           && rm -rf * \
           && cmake ../cppzmq-4.2.1 -DCMAKE_INSTALL_PREFIX=/usr \
           && make -j4 install
