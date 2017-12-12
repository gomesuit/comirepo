#!/bin/sh
set -e

if [ "$DB_MIGRATE" == 'true' ]; then
  bin/rails db:migrate
fi

if [ "$SITEMAP_GENERATE" == 'true' ]; then
  bin/rails sitemap:refresh
fi

exec "$@"
