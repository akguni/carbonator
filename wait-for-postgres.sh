#!/bin/sh
# wait-for-postgres.sh

until PGPASSWORD="carbonator" psql -h "postgres" -U "carbonator" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - exiting"