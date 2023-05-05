#!/bin/bash

# Run the original entrypoint script in the background
/docker-entrypoint.sh &

# Wait for the Db2 instance to start and the db2inst1 user to be created
until su - db2inst1 -c "db2start" &>/dev/null
do
    sleep 1
done

# Check if the database exists
output=$(su - db2inst1 -c "db2 list database directory" | grep -w ${DBNAME})

# Create the database if it doesn't exist
if [ -z "$output" ]; then
    echo "Creating database '${DBNAME}'..."
    su - db2inst1 -c "db2 create db ${DBNAME}"
fi

# Keep the container running
tail -f /dev/null
