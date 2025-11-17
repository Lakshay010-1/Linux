#!/bin/bash

echo "-----------------------------"
echo

# User, Host and OS
echo "==> HOST, USER & OS INFO"
echo "Current User     : ${USER}"
echo "Current UserID   : ${UID}"
echo "Current Directory: $(pwd)"
echo "HostName         : ${HOSTNAME:-$(hostname)}"
echo "OS               : $(uname -s)"
echo "Kernel           : $(uname -r)"
echo "Uptime           : $(uptime -p | sed 's/up //')"
echo

# CPU
echo "==> CPU INFO"
echo "Model            : $(awk -F: '/model name/ {print $2; exit}' /proc/cpuinfo | xargs)"
echo "Cores            : $(nproc)"
echo "Load Average     : $(cut -d ' ' -f1-3 /proc/loadavg)"
echo

# Memory
echo "==> MEMORY INFO"
free -h | awk '/Mem:/ {print "Used: "$3" / "$2}'
echo

# Disk
echo "==> DISK INFO"
df -h --total | awk 'END {print "Used: "$3" / "$2" ("$5")"}'
echo

# Network
echo "==> NETWORK INFO"
ip -4 -o addr show scope global | awk '{print "IP Address     : "$4}' | sed 's/\/.*//'
echo "Default Route    : $(ip route | awk "/default/ {print \$3}")"
echo

# Processes
echo "==> PROCESS INFO"
echo "Top Processes (CPU)"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6
echo
echo "Top Processes (MEMORY)"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6
echo

echo "-----------------------------"
echo "INFO GENERATED AT: $(date)"
echo "-----------------------------"
