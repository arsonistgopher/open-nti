#!/bin/sh
mkdir -p /opt/telegraf/config
#mv /source/cert_files /opt/telegraf/config/
opennti=$(cat /etc/hosts | grep "opennti " | cut -f1)
sed s/opennti/$opennti/g /source/telegraf.tmpl > /opt/telegraf/config/telegraf.conf
/go/src/github.com/influxdata/telegraf/telegraf --config /opt/telegraf/config/telegraf.conf
