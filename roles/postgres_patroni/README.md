# Ansible PostgreSQL patroni install and setup role.
Installs and setsup patroni failover clustering for new or existing postgresql installation.

# Usage

# Molecule
Molecule tests inclede:
* default - sipmle one node install
* takeover - install and convigure one node postgres and then takeover with patroni
* ptr-cos7 - install and setup 2 node patroni installation
* ptr-cos8 - install and setup 2 node patroni installation for centor8
* ptr-cos7-upg - perform major postgresql version upgrade with patroni installation.