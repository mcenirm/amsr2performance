#!/bin/bash

set -x

d=$( dirname "$0" )
t=$( mktemp -d --suffix=.amsr2performance )

tar x -C "$t" -f "$d/amsr_toolkits-20141107.tgz"
tar x -C "$t" -f "$d/test.tar.bz2"

sed -i.bak -e "s,^\(export TOOLKIT=\),\1${t}," "$t/rainocean/runLance.sh"

cd "$t/rainocean" && bash -x runLance.sh

