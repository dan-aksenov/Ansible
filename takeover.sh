#!/bin/bash

# Generate ansible inventory variables based existing PostgreSQL installation
# Main goal is to takeover PostgreSQL installation made by someone else and prepare it to be managed by my ansible roles.

INVENTORY=$1
HOST=$2
ansible -i $INVENTORY $HOST -m postgresql_info --become --become-user=postgres -a "filter=settings" -t /tmp 
