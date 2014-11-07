
set -x

sudo yum upgrade -y

sudo yum install -y time libgfortran libjpeg-turbo perl

sudo groupadd -g 3040 lancedev
sudo groupadd -g 3043 lanceops
sudo useradd -u 4106 amsr-e

sudo tar x -C / -f /vagrant/amsr_toolkits-20141107.tgz

tar xf /vagrant/test.tar.bz2

cd rainocean && bash -x runLance.sh

