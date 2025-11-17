#!/bin/bash

TO="example@gmail.com"

# Get disk info in a clean format

read -p "Enter Disk/Partition name to check free space (Example:sda1) : " devicefileName

Storage=$(df -P | awk -v dev="/dev/${devicefileName}" '$1==dev {print}')

if [ -z "${Storage}" ]
then
    echo "Invalid disk/partition: /dev/${devicefileName}"
    exit 1
fi


# Validate user entered free threshold percentage

read -p "Enter the minimum free space percentage (0-100)% : " freeThreshold

if ! [[ "$freeThreshold" =~ ^[0-9]+$ ]] || [ "$freeThreshold" -lt 0 ] || [ "$freeThreshold" -gt 100 ]
then
    echo "Error: Threshold must be an integer between 0 and 100."
    exit 1
fi


# Extract total and free space (in KB)  

Total=$(echo "$Storage" | awk '{print $2}' )

Free=$(echo "$Storage" | awk '{print $4}' )

# Avoid divide-by-zero
if [ "$Total" -eq 0 ]; then
    echo "Error: Total disk size is reported as zero. Aborting."
    exit 1
fi

CurrentFreePer=$(( Free * 100 / Total ))

if [ "$CurrentFreePer" -lt "$freeThreshold" ]
then
    echo "Free Space(${CurrentFreePer}%) is LESS than the Free-Space-Threshold(${freeThreshold}%)." | mail -s "DISK SPACE ALERT!!!" ${TO}
elif [ "$CurrentFreePer" -eq "$freeThreshold" ]
then
    echo "Free Space (${CurrentFreePer}%) is EQUAL to the Free-Space-Threshold(${freeThreshold}%)"
else
    echo "Free Space (${CurrentFreePer}%) is MORE than the Free-Space-Threshold(${freeThreshold}%)"
fi
