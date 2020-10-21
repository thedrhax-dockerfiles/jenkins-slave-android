#!/bin/bash

if [ "$AVD" ]; then
    socat tcp-listen:5555,bind=127.0.0.1,fork tcp:"$AVD" & SOCAT_PID=$!

    echo "Waiting for AVD to become online..."

    while ! adb devices | sed -n 2p | grep -q device; do
        pkill -9 adb
        adb devices > /dev/null
        sleep 10
    done

    echo "AVD is ready"
fi

mkdir -p "$SLAVE_ROOT"

exec $*

if [ "$SOCAT_PID" ]; then
    kill $SOCAT_PID
fi
