#!/bin/bash
pgbadger -Z '+03' --retention 4 -I -O /var/www/badger/ {{ pg_data }}/pg_log/postgresql*.log
find {{ pg_data }}/pg_log/ -name 'postgresql*.log' -mtime +1 -delete

