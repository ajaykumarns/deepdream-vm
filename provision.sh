#!/usr/bin/env bash
hostname=ubuntu

echo 'source /vagrant/data/env.sh' >> /home/${hostname}/.bashrc
source /vagrant/data/env.sh
setup_all