#!/bin/sh
set -e

if [ "$DB_MIGRATE" == 'true' ]; then
  bin/rails db:migrate
fi

exec "$@"
