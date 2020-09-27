#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname template1 <<-EOSQL
    create user blabos with encrypted password 'blabos';
    create database pgdb_sample with owner blabos;
    grant all privileges on database pgdb_sample to blabos;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$PG_USER" --dbname "$PG_DB" -f /sql/00-create-tables.sql

