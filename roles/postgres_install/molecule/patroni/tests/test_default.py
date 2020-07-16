import os

import testinfra

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_etcd_service(host):
    etcd = host.service('etcd')

    assert etcd.is_running
    assert etcd.is_enabled


def test_patroni_health(host):
    cmd = host.run(
        "curl -L http://localhost:8008")

    assert cmd.succeeded
    assert 'running' in cmd.stdout
