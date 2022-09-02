#!/bin/sh
#判断是否初始化

# look for empty dir
if [ -z "$(ls -A /app/sub-web/src/views)"]; then
    cp -rf /var/dev/views/* /app/sub-web/src/views
fi

cd /app/sub-web && yarn serve &
/usr/sbin/nginx
/var/dev/subconverter/subconverter