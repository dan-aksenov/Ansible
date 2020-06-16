import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_pgbouncer_service(host):


    pgbouncer_service = host.service('pgbouncer')

    assert pgbouncer_service.is_running
    assert pgbouncer_service.is_enabled
