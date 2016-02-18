#!/bin/bash
mount -t tmpfs -o size=1g tmpfs /var/cache/trafficserver-first
exec /bin/supervisord -n -c /etc/supervisord.conf
