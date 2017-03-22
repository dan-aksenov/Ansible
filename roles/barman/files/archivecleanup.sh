PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/pgsql-{{ postgresql_version }}/bin"
PGHOME=/var/lib/pgsql/{{ postgresql_version }}
PGARCH=/u01/pgsql/{{ postgresql_version }}/backups/arch
PG_ARCHIVECLEANUP=$(which pg_archivecleanup)
AGE="-mtime +3"

for backup_label in $(find $PGARCH/*.backup $AGE -exec basename {} \;)
  do
    $PG_ARCHIVECLEANUP $PGARCH $backup_label -d
    rm $PGARCH/$backup_label
  done

