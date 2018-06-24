#!/bin/bash

source /etc/profile.d/rvm.sh

if [ $1 = "provision" ]; then
    wordmove init

    sed -i -e "s/wpcli/default/g" movefile.yml
    sed -i -e "s/vhost.local/$HOST_IP:$HOST_PORT/g" movefile.yml

    sed -i -e "/local:/,/production:/ s/database_name/$LOCAL_DB_NAME/g" movefile.yml
    sed -i -e "/local:/,/production:/ s/user: user/user: $LOCAL_DB_USER/g" movefile.yml
    sed -i -e "/local:/,/production:/ s/password: \"password\"/password: \"$LOCAL_DB_PASSWORD\"/g" movefile.yml
    sed -i -e "/local:/,/production:/ s/host: 127.0.0.1/host: $LOCAL_DB_HOST/g" movefile.yml

    exit 0
fi

exec wordmove $*