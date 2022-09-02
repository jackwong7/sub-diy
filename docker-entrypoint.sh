#!/bin/sh
cd /app/sub-web && yarn serve &
/usr/sbin/nginx
/var/dev/subconverter/subconverter