#!/bin/bash
if [ -z "$1" ]; then echo "role name var is unset" && exit 1; fi

# Create role's main directorie
mkdir roles/$1
cd roles/$1
# Create role's subdirectories
mkdir tasks handlers templates files vars defaults meta 
# Create sample files in all role's subdirectories
for i in $(ls); do  echo --- > $i/main.yml; done
for i in $(ls); do  echo ... >> $i/main.yml; done

cat > meta/main.yml <<EOF
galaxy_info:
  author: Daniil Aksenov (dbax)
  description: Ansible role for administrative sudo user, who will run all subsequent ansible scripts. Must be executed with --ask-pass.
  license: as-is
  platforms:
      name: EL
      versions: 7
  categories:
EOF
