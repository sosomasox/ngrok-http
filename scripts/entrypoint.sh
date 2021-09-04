#!/bin/bash

trap 'exit 0' 1 2 3 4 9 15

if [ $NGROK_AUTH_TOKEN != "" ] && [ $ARCH != "" ]; then
    wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-$ARCH.zip && \
    unzip ngrok-stable-linux-$ARCH.zip && \
    rm -f ngrok-stable-linux-$ARCH.zip

    ./ngrok authtoken $NGROK_AUTH_TOKEN
    ./ngrok http 8080 -region=ap

    while [ $? -eq 1 ]
    do
        ./ngrok http 8080 -region=ap
        sleep 1
    done
        
fi

exit 1
