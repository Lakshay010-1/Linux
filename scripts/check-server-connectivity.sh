#!/bin/bash

echo "Enter ip Address"
read ip
ping -c1 $ip &> /dev/null
    if[$? -eq 0]; then
        echo "$(ip) is Connectable"
    else
        echo "$(ip) is not-connectable"
    fi
