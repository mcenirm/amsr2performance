#!/bin/bash

set -x

vlog=/vagrant/log-`date -u +%Y%m%d-%H%M%S`
mkdir -p "${vlog}"
plog="${vlog}/provision.log"
exec > >(tee -a "${plog}") 2> >(tee -a "${plog}" >&2)

sudo yum install -y time libgfortran libjpeg-turbo perl

sudo groupadd -g 3040 lancedev
sudo groupadd -g 3043 lanceops
sudo useradd -u 4106 amsr-e

sudo tar x -C / -f /vagrant/amsr_toolkits-20141107.tgz

tar xf /vagrant/test.tar.bz2

cd rainocean && bash -x runLance.sh

cp -p out/rainocean/2014.10.22/AMSR_2_L2_RainOcean_R00_201410222127_A.qa "${vlog}"
cat /proc/cpuinfo > "${vlog}/cpuinfo.txt"
cat /proc/meminfo > "${vlog}/meminfo.txt"

