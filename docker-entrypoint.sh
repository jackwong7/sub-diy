#!/bin/sh
#判断是否初始化

# look for empty dir
if [ "ls -A /app/sub-web/src/views" = "" ]; then
    cp -Rf /app/dev/views /app/sub-web/src/views
fi

cd /app/sub-web && yarn serve &
/usr/sbin/nginx
/var/dev/subconverter/subconverter