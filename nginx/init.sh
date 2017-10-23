#!/usr/bin/env bash

htpasswd -b -c /etc/nginx-source/.htpasswd $AUTH_USER $AUTH_PASS

/init-env.sh
