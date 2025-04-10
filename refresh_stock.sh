#!/bin/bash

# remove old dir. start fresh
rm -rf /tmp/6.0.zip

rm -rf /tmp/zabbix-release-6.0

mkdir -p /tmp/zabbix-release-6.0

# download latest 6.0 branch
curl -kL https://github.com/zabbix/zabbix/archive/refs/heads/release/6.0.zip -o /tmp/6.0.zip

# unzip
cd /tmp
unzip 6.0.zip

# go back to previous directory where PHP program is located
cd -

# start template import
find /tmp/zabbix-release-6.0/templates -type f -name '*.yaml' | \
while IFS= read -r TEMPLATE
do {
php upload.php $1 $2 $TEMPLATE
} done
