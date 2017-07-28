#!/bin/bash
if [ -z "$1" ]; then echo "role name var is unset" && exit 1; fi

# Create role's main directory.
mkdir roles/$1
cd roles/$1
# Create role's subdirectories.
mkdir tasks handlers templates files vars defaults meta
# Create dummy files in all role's subdirectories.
for i in $(ls); do  echo --- > $i/main.yml; done
for i in $(ls); do  echo '#This is dummy file to make shure directory is commited. Can be deleted after something usefull added to this dir.' > $i/main.yml; done
for i in $(ls); do  echo ... >> $i/main.yml; done

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