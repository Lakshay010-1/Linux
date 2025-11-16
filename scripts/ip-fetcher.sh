#!/bin/bash

echo "Enter Network interface to get ip"
read networkInterface

IP=$(ip -o -4 addr show ${networkInterface} | awk '{print $4}')

echo "${networkInterface} IP is ${IP}"