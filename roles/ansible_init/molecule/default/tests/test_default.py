import os
import getpass

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')

def test_my_ansible_user(host):
    my_ansible_user = getpass.getuser()
    
    u = host.user( my_ansible_user )

    assert u.exists