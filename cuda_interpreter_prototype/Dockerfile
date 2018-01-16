FROM       ubuntu:bionic

# general environment for docker
ENV        DEBIAN_FRONTEND=noninteractive \
           FORCE_UNSAFE_CONFIGURE=1

RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              build-essential \
              ca-certificates \
              curl \
              clang \
              cmake \
              git \
              pkg-config \
              libc6-dev \
              libclang-dev \
              libedit-dev \
              llvm-dev \
              lsb-release \
              nvidia-cuda-toolkit \
              wget \
              zlib1g-dev \
           && rm -rf /var/lib/apt/lists/*

RUN        git clone --depth=50 https://github.com/SimeonEhrig/CUDA-Runtime-Interpreter.git /root/cri \
           && mkdir /root/cri/build \
           && cd /root/cri/build \
           && cmake .. \
           && make -j2 \
           && cp cuda-interpreter /usr/bin \
           && cp ../*.sh /usr/bin
