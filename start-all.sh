#!/bin/sh
set -m
/bin/blackbox_exporter --config.file=/etc/blackbox_exporter/config.yml &
/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus --web.console.libraries=/usr/share/prometheus/console_libraries --web.console.templates=/usr/share/prometheus/consoles
fg %1
