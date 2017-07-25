# Modules #####################################################################
#
. /usr/share/lmod/5.8/init/bash
. $HOME/src/spack/share/spack/setup-env.sh
export MODULEPATH=$HOME/src/spack/share/spack/lmod/linux-ubuntu16-x86_64/Core

# Core Dependencies (based on clang 3.8.0)
module load cmake
module load cuda
# module load boost
