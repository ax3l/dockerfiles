FROM       ubuntu:16.04

# general environment for docker
ENV        DEBIAN_FRONTEND=noninteractive \
           SPACK_ROOT=/usr/local \
           FORCE_UNSAFE_CONFIGURE=1

# install minimal spack depedencies
RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              autoconf \
              build-essential \
              ca-certificates \
              coreutils \
              curl \
              environment-modules \
              gfortran \
              git \
              openssh-server \
              python \
              unzip \
              vim \
           && rm -rf /var/lib/apt/lists/*

# load spack environment on login
RUN        echo "source $SPACK_ROOT/share/spack/setup-env.sh" \
           > /etc/profile.d/spack.sh

# spack settings
COPY    packages.yaml $SPACK_ROOT/etc/spack/

# install spack
RUN        curl -s -L https://github.com/llnl/spack/archive/develop.tar.gz \
           | tar xzC $SPACK_ROOT --strip 1
# note: at this point one could also run ``spack bootstrap`` to avoid
#       parts of the long apt-get install list above

# install software
RUN        spack install tar \
           && spack clean -a

# need the modules already during image build?
RUN        /bin/bash -l -c ' \
                spack load tar \
                && which tar'

# image run hook: the -l will make sure /etc/profile environments are loaded
CMD        /bin/bash -l
