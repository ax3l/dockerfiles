FROM       ubuntu:16.04

# general environment for docker
ENV        DEBIAN_FRONTEND=noninteractive \
           HOME=/home/spack \
           PATH=/home/spack/src/spack/bin:$PATH

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
              lmod \
              sudo \
              unzip \
           && rm -rf /var/lib/apt/lists/*

# Add non-privileged, but system docker user with sudo rights
RUN        groupadd -r spack -g 901 && \
           useradd -u 901 -r -m -g spack spack && \
           echo "spack ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/spack && \
           chmod 0440 /etc/sudoers.d/spack
# this is also the user that executes all commands below
USER       spack
WORKDIR    $HOME

# spack environment
COPY       spack.profile /etc/profile.d/spack.sh
COPY       packages.yaml modules.yaml .spack/

RUN        sudo chown spack:spack -R $HOME

# install spack
RUN        git clone --depth 50 https://github.com/ax3l/spack.git --branch=topic-adios2 \
           $HOME/src/spack/

# install software
RUN        spack install adios2

# startup
CMD        /bin/bash -l
