#!/bin/sh

# Try pinging the Flask app up to 5 times with delay
for i in $(seq 1 5); do
    if curl -f http://localhost:8002/ping; then
        exit 0
    fi
    sleep 2
done

# If none succeeded, report unhealthy
exit 1

