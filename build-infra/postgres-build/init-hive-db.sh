#!/bin/bash
set -e

MARKER_FILE=/tmp/initialized

if [ ! -f $MARKER_FILE ]; then
    # Run your initialization script
    echo "Running initialization script..."
    
psql -v ON_ERROR_STOP=1 --username "airflow" <<-EOSQL
  CREATE USER hive WITH PASSWORD 'hive';
  CREATE DATABASE metastore;
  GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;

  \c metastore

  \i /hive/hive-schema-3.1.0.postgres.sql

  \pset tuples_only
  \o /tmp/grant-privs
SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO hive ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';
  \o
  \i /tmp/grant-privs
EOSQL
    touch $MARKER_FILE
fi

exec "$@"

