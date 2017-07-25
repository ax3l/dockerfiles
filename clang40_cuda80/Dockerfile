# Notes:
#   - provides CUDA 8.0 + Clang 4.0
# Example build:
#   clang++-4.0 -L/usr/local/cuda-8.0/lib64 -lcudart main.cu
# automatically finds CUDA in /usr/local/cuda-8.0/
#
#   - clang 3.9 highest shipped clang in Ubuntu 16.04
#   - CUDA 8.0 is too new for clang 3.9
FROM       ubuntu:16.04

# general environment for docker
ENV        DEBIAN_FRONTEND=noninteractive

# get wget
RUN        apt-get update && \
           apt-get install -y --no-install-recommends \
              ca-certificates \
              wget

# add clang 4.0 repo
RUN        echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main" > /etc/apt/sources.list.d/clang.list
RUN        echo "deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main" >> /etc/apt/sources.list.d/clang.list
RUN        wget -q -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

# add CUDA repo
RUN        wget -q https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb && \
           dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb && \
           rm cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

# install minimal environment
RUN        apt-get update && \
           apt-get install -y --no-install-recommends \
              clang-4.0 \
              cuda \
              git \
              build-essential \
              pkg-config \
              nano \
           && rm -rf /var/lib/apt/lists/*
