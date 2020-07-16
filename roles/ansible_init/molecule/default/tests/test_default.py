import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


@pytest.fixture(scope='module')
def AnsibleRoleDefaults(host):
    return host.ansible('include_vars', '../../defaults/main.yml')['ansible_facts']


def test_my_ansible_user(host, AnsibleRoleDefaults):
    my_ansible_user = AnsibleRoleDefaults['my_ansible_user']
    
    u = host.user( my_ansible_user )

    assert u.exists