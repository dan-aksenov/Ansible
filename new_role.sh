#!/bin/bash
if [ -z "$1" ]; then echo "Role name var is unset. Set it as first positional parameter." && exit 1; fi

role=$1

# Create role's main directory.
mkdir roles/$role
cd roles/$role
# Create role's subdirectories.
mkdir tasks handlers templates files vars defaults meta tests
# Create dummy files in all role's subdirectories.
for i in $(ls); do  echo --- > $i/main.yml; done
for i in $(ls); do  echo '#This is dummy file to make sure directory is commited. Can be deleted after something usefull placed into this dir.' >> $i/main.yml; done

# Create sample test file
cat > tests/tests.yml <<EOF
---

- hosts: all
  remote_user: "{{ my_ansible_user }}"
  become: yes
  roles:
    - $role

  environment:
    http_proxy: "{{ proxy_ip }}"
    https_proxy: "{{ proxy_ip }}"

...
EOF

# Create template info file in meta.
cat > meta/main.yml <<EOF
galaxy_info:
  author: Daniil Aksenov (dbax)
  description: Role description to be here... 
  license: as-is
  platforms:
      name: EL
      versions: 7
  categories:
  dependencies:
EOF

# Open info file for editing.
vim meta/main.yml