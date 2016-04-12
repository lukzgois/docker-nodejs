#!/bin/bash

if [ ! -z "$APP_DIR" ]; then
    DOCUMENT_ROOT="/var/www"
    rm -rf ${DOCUMENT_ROOT}

    if [ -d "${APP_DIR}" ]; then
        dir="${DOCUMENT_ROOT}"
    else
        dir="${DOCUMENT_ROOT}"
    fi

    mkdir -p `dirname ${dir}`
    ln -s $APP_DIR $dir
fi

cd /var/www
exec /usr/bin/npm start