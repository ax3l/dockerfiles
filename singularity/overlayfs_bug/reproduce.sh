#!/usr/bin/env bash
#
singularity create ubuntu.img
sudo singularity bootstrap ubuntu.img Singularity
singularity run ubuntu.img

# dd if=/dev/zero bs=1M count=1024 of=aa
# df -h
