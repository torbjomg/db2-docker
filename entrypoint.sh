#!/bin/bash

# Wait for the Db2 instance to start and the db2inst1 user to be created
su - db2inst1 -c "
db2start && \
db2 -td@ -f /init.sql
"
# until su - db2inst1 -c "db2start" &>/dev/null
# do
#     echo "Waiting for Db2 to start..."
#     sleep 5
# done

# Check if the database exists
output=$(su - db2inst1 -c "db2 list database directory" | grep -w dbtest)

# Create the database if it doesn't exist
if [ -z "$output" ]; then
    echo "Creating database 'dbtest'..."
    su - db2inst1 -c "db2 create db dbtest"
fi

# Keep the container running
tail -f /dev/null
