#!/bin/bash
set -e

sed -i -e "s/__RAILS_HOST__/$RAILS_HOST/" /etc/nginx/nginx.conf
sed -i -e "s/__RAILS_PORT__/$RAILS_PORT/" /etc/nginx/nginx.conf
sed -i -e "s/__S3_BUCKET__/$S3_BUCKET/" /etc/nginx/nginx.conf

nginx -g "daemon off;"
