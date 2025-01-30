#! /bin/bash

if [[ $# -eq 0 ]]; then 
  echo "usage: setup <container-number>"
  exit 1 
fi 

lxc launch ubuntu:24.04 "c$1"

sleep 10

lxc exec "c$1" -- snap install snapcraft --classic

lxc exec "c$1" -- sed -i '/Signed-By/a Architectures: amd64' /etc/apt/sources.list.d/ubuntu.sources

lxc exec "c$1" -- sed -i 's/Types: deb/Types: deb deb-src/'  /etc/apt/sources.list.d/ubuntu.sources 

