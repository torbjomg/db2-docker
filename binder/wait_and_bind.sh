#!/bin/bash

# Set up environment variables
source /home/db2inst1/sqllib/db2profile

# Set DB2 environment variables
export DBNAME=${DB_NAME}
export DB2_HOST=${DB_HOST}
export DB2_PORT=${DB_PORT}
export DB2_USER=${DB_USER}
export DB2_PASSWORD=${DB_PASSWORD}

# Wait for the DB2 instance to be ready
until echo "connect to ${DBNAME} user ${DB2_USER} using ${DB2_PASSWORD}; SELECT 1 FROM SYSIBM.SYSDUMMY1" | db2 -x > /dev/null 2>&1; do
  echo "Waiting for DB2 to be ready..."
  sleep 5
done

# Bind the necessary packages
db2 connect to ${DBNAME} user ${DB2_USER} using ${DB2_PASSWORD}
db2 bind /home/db2inst1/sqllib/bnd/@db2ubind.lst blocking all grant public
db2 bind /home/db2inst1/sqllib/bnd/@db2cli.lst blocking all grant public

echo "Packages bound successfully."
