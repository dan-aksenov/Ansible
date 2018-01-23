#!/bin/bash

pgver=9.6

clear

read -p "Initialize default ansible user (root password will be prompted)"
ansible-playbook -i test init.yml --ask-pass

read -p "Setup standart config for new Centos7 machines."
ansible-playbook -i test new_machine.yml

read -p "Install and configure postgresql $pgver"
ansible-playbook -i test pg_main.yml --extra-vars "postgresql_version=$pgver"
