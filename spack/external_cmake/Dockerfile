FROM       ubuntu:xenial

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
              clang \
              cmake \
              curl \
              environment-modules \
              git \
              build-essential \
              pkg-config \
              python \
              nano \
              sudo \
              unzip \
           && rm -rf /var/lib/apt/lists/*

# startup: force the use of a login shell
RUN        /bin/echo -e '#!/bin/bash -l\n' \
             '. /home/spack/src/spack/share/spack/setup-env.sh\n' \
             'exec "$@"\n'                 \
             > /etc/entrypoint.sh
RUN chmod a+x /etc/entrypoint.sh

ENTRYPOINT ["/etc/entrypoint.sh"]
CMD ["/bin/bash"]

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

RUN        sudo chown spack:spack -R $HOME

# install spack
RUN        git clone --depth 50 https://github.com/llnl/spack.git \
           $HOME/src/spack/ && \
           spack compiler find

# install software
RUN        spack install cmake
