#!/bin/bash

# Generate ansible inventory variables based existing PostgreSQL installation
# Main goal is to takeover PostgreSQL installation made by someone else and prepare it to be managed by my ansible roles.

INVENTORY=$1
HOST=$2
# Get current postgresql settings.
ansible -i $INVENTORY $HOST -m postgresql_info --become --become-user=postgres -a "filter=settings" -t /tmp 

# Parse /tmp/$HOST for modified PostgreSQL settings.

# Generate ansible host_vars list with gathered values.
