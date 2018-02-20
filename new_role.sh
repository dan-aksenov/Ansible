#!/bin/bash
if [ -z "$1" ]; then echo "Role name var is unset. Set it as first positional parameter." && exit 1; fi

role=$1

cd roles
# Create ansible-galaxy stile role.
ansible-galaxy init $role

# Open info file for editing.
vim $role/meta/main.yml
