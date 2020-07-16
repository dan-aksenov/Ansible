# Ansible PostgreSQL install and setup role.
inspired by github.com/galaxyproject/ansible-postgresql

Designed to work no Centos7.

## Variables are optional, or provided by defaults.

* `postgresql_version`: PostgreSQL version to install. The default is 11
* `postgresql_conf`: A hash (dictionary) of postgresql.conf options and values. These options are not added to postgresql.conf directly - the role adds a conf.d subdirectory in the configuration directory and an include statement for that directory to postgresql.conf. Options set in postgresql_conf are then set in conf.d/25ansible_postgresql.conf

Due to YAML parsing, you must take care when defining values in postgresql_conf to ensure they are properly written to the config file. For example:
```
postgresql_conf:
  max_connections: 250
  archive_mode: "off"
  work_mem: "'8MB'"
```

Becomes the following in 25ansible_postgresql.conf:
```
max_connections = 250
archive_mode = off
work_mem: '8MB'
```

## Backups
Backups are done with pgbackrest.

Default backup path is `/var/lib/pgsql/{{ postgresql_version }}/backups`.
If backup directory variable is not specified - backup section is skipped.
For more information about pgBackRest visit https://pgbackrest.org

## Install with Patroni
Need to set ansible variable postgresql_service to "patroni" and specify distributed configuration storage(etcd by default)

## Molecule testing
- default: test single instance postgresql managed by systemd.

  ```molecule test```
- pg_ctl: test single instance postgresql managed by pg_ctl

  ```molecule test -s pg_ctl```

- patroni: test 1 node patroni installation with etcd

  ```molecule test -s patroni```

- patroni3: test 3 node patroni installation with etcd

  ```molecule test -s patroni3```


## Features to be included:

- [x] Merge with postgres-patroni role (https://github.com/dan-aksenov/ansible/tree/master/roles/postgres-patroni)
- [x] Add repository,
- [x] Install postgres packages,
- [x] Initillize cluster if not exists,
   - [ ] Create default roles and databases,
- [x] Configure backups,
   - [x] Confiugre archivelog,
   - [x] backups with pgBackRest,
- [x] Install Mamonsu and register in zabbix,
   - [ ] still need bootstrap and template import fix,
- [ ] Install usefull extensions,
   - [x] powa
   - [ ] more?
- [x] Configure pg_hba.conf with some reasonable defaults
   - [ ] configure for repmgr
   - [ ] merge patroni hba with main postgresql config. 
- [x] Config for pgbadger logging and website,
- [x] Configure postgresql.conf
