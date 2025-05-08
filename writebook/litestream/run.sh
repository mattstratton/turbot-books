#!/bin/bash
set -e

echo "ls /rails/storage"
ls /rails/storage
# Restore the database if it does not already exist.
if [ -f /rails/storage/db/production.sqlite3 ]; then
	echo "Database already exists, skipping restore"
else
	echo "No database found, restoring from replica if exists"
	litestream restore -v -if-replica-exists -o /rails/storage/db/production.sqlite3 "${REPLICA_URL}"
fi

# Run litestream with your app as the subprocess.
exec litestream replicate -exec "/rails/bin/boot"