import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_database(host):
    c = host.run('sudo -u postgres whoami')

    assert c.stdout == 'postgres\n'
