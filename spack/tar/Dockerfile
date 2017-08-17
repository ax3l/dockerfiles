FROM       ubuntu:16.04

# general environment for docker
ENV        DEBIAN_FRONTEND=noninteractive \
           SPACK_ROOT=/usr/local \
           FORCE_UNSAFE_CONFIGURE=1

# install minimal spack
RUN        apt-get update \
           && apt-get install -y --no-install-recommends \
              autoconf \
              ca-certificates \
              curl \
              environment-modules \
              git \
              build-essential \
              python \
              nano \
              sudo \
              unzip \
           && rm -rf /var/lib/apt/lists/*

# install spack
RUN        curl -s -L https://api.github.com/repos/llnl/spack/tarball \
           | tar xzC $SPACK_ROOT --strip 1
RUN        echo ". $SPACK_ROOT/share/spack/setup-env.sh" \
           > /etc/profile.d/spack.sh

# install software
RUN        spack install tar \
           && spack clean -a

# need the modules?
RUN        /bin/bash -l -c 'spack load tar && which tar'

# startup
CMD        /bin/bash -l
