#!/bin/bash
if [ -z "$1" ]; then echo "role name var is unset" && exit 1; fi
mkdir $1
cd $1
mkdir tasks handlers templates files vars defaults meta 
touch tasks/main.yml
