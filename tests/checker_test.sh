#!/bin/bash
#
# Perform some verification on the broken link checker.
# NB: The purpose of this script is
# to verify the working of the checker on a real web server.

NB_BROKEN_LINK_EXPECTED=21
HOST=localhost
PORT=8080
counter=5

start_server() {
    # We start the web server
    python3 tests/server.py $HOST $PORT &
    # We get his pid
    server_pid=$!

    # We wait the server to start
    while [ $counter -gt 0 ]; do
        sleep .1
        if curl -I $HOST:$PORT -s --show-error; then
            break
        else
            echo Retry\($counter\)
            counter=$(expr $counter - 1)
        fi
    done

    # We verify if the server is run
    if [ $counter -eq 0 ]; then
        exit 1
    fi
}

# We start the test
start_test() {
    if [ ! $(python3 broken_link_checker -H http://$HOST:$PORT -d 0 -D true\
     | grep -c '^/') -eq $NB_BROKEN_LINK_EXPECTED ]; then
        # We show the logging for debugging
        cat logging.log
    fi
}

# We stop the server
stop_server() {
    kill $server_pid
}

if start_server; then
    start_test
fi

err_code=$?

stop_server

exit $err_code