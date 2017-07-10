FROM       ubuntu:16.04

# general environment for docker
ENV        HOME /home
ENV        DEBIAN_FRONTEND noninteractive

# spack environment
ENV        PATH "$HOME/src/spack/bin:$PATH"
COPY       packages.yaml $HOME/.spack/packages.yaml

# install minimal spack dependencies
RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              autoconf \
              ca-certificates \
              cmake \
              curl \
              git \
              build-essential \
              pkg-config \
              python \
              nano \
              unzip \
           && rm -rf /var/lib/apt/lists/*

# install spack
RUN        git clone --depth 50 https://github.com/llnl/spack.git \
           $HOME/src/spack/

# install PIConGPU dependencies
RUN        spack install pocl
