FROM       nvidia/cuda:8.0-devel

# docker and image environment
ENV        DEBIAN_FRONTEND=noninteractive \
           HOME=/home/spack \
           PATH=/home/spack/src/spack/bin:$PATH

# install minimal spack dependencies
RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              autoconf \
              ca-certificates \
              cmake \
              curl \
              git \
              build-essential \
              nano \
              pkg-config \
              python \
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
COPY       packages.yaml .spack/
RUN        mkdir src && \
           sudo chown spack:spack -R .spack

# install spack
RUN        git clone --depth 50 https://github.com/ax3l/spack.git \
           --branch=topic-gearshifft $HOME/src/spack/

# install software with spack
#RUN        spack install clfft
#gearshifft
