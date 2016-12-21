#!/bin/bash
if [ -z "$1" ]; then echo "role name var is unset" && exit 1; fi
touch $1.yml
cat > $1.yml << EOF
- hosts: all
  user: dbax
  become: yes

  roles:
      - $1 
EOF
mkdir roles/$1
cd $1
mkdir tasks handlers templates files vars defaults meta 
touch tasks/main.yml
