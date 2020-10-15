#!/bin/bash

# Generate ansible inventory variables based existing PostgreSQL installation
# Main goal is to takeover PostgreSQL installation made by someone else and prepare it to be managed by my ansible roles.

INVENTORY=$1
HOST=$2
# Get current postgresql settings.
ansible -i $INVENTORY $HOST -m postgresql_info --become --become-user=postgres -a "filter=settings" -t /tmp --ask-vault-pass

# Parse /tmp/$HOST for modified PostgreSQL settings.

# Generate ansible host_vars for postgresql.conf with gathered values.
# REMEMBER: some postgresql.conf values(listen_address, log_line_prefix) must contain additional quotes!
echo postgresql_conf: > /tmp/${HOST}.pgconf.yml
jq -rc '.settings | to_entries[] | select(.value.sourcefile | contains("postgresql.conf")) | [.key, .value.boot_val] | "  \(.[0]): \"\(.[1])\""' /tmp/$HOST >> /tmp/${HOST}.pgconf.yml
