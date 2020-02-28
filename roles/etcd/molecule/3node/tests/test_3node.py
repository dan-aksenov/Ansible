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


def test_etcd_health(host):
    cmd = host.run("etcdctl cluster-health")

    assert cmd.succeeded
    assert 'etcd1' in cmd.stdout
    assert 'etcd2' in cmd.stdout
    assert 'etcd3' in cmd.stdout
    assert 'cluster is healthy' in cmd.stdout
