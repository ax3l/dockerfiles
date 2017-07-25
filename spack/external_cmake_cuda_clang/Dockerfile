FROM       nvidia/cuda:8.0-devel

# general environment for docker
ENV        DEBIAN_FRONTEND=noninteractive \
           HOME=/home/spack

# install minimal spack dependencies
RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              autoconf \
              ca-certificates \
              cmake \
              curl \
              git \
              gfortran \
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

# install "compiler/tools spack"
COPY       compilers.yaml packages.yaml .spack/
RUN        sudo chown spack:spack -R $HOME
RUN        git clone --depth 50 https://github.com/llnl/spack.git \
           $HOME/src/spack-tools/

RUN        $HOME/src/spack-tools/bin/spack install llvm@3.9.1 %gcc && \
           $HOME/src/spack-tools/bin/spack purge --all
RUN        $HOME/src/spack-tools/bin/spack location --install-dir llvm

# install spack for actual software
RUN        git clone --depth 50 https://github.com/llnl/spack.git \
           $HOME/src/spack/

COPY       spack.profile /etc/profile.d/spack.sh
COPY       modules.yaml .spack/
# TODO: sed -i compiler prefix
RUN        sudo chown spack:spack -R $HOME
ENV        PATH=/home/spack/src/spack/bin:$PATH

# install software
RUN        spack install cmake
RUN        spack install cuda

# startup
CMD        /bin/bash -l
