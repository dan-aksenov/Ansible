#!/usr/bin/env python
# find apache latest version
# inspired by https://github.com/galaxyproject/ansible-postgresql/blob/master/files/get_repo_rpm_release.py

import re
import sys
import urllib2

url = "http://www.apache.org/dist/activemq/"

try:
    distro = urllib2.urlopen(url)
except urllib2.HTTPError, e:
    print >>sys.stderr, "Failed to fetch directory list from %s" % url
    raise

re_match = '[0-9]*\.[0-9]*\.[0-9]*'
latest_version = max(re.findall(re_match,distro.read(),flags=re.I))
get_latest_url = "http://www.apache.org/dist/activemq/" + latest_version + "/apache-activemq-" + latest_version + "-bin.tar.gz"

print get_latest_url.replace("\\r\\n", "")
sys.exit(0)
