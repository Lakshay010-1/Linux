#!/bin/bash

# Simple script to add a user and display their info

read -rp "Enter new username: " username

# Check if user already exists
if id "$username" &>/dev/null; then
    echo "ERROR: User '$username' already exists!"
    exit 1
fi

# Create user
sudo useradd -m "$username"

# Set password
echo "Set password for $username:"
sudo passwd "$username"

echo
echo "User created successfully!"
echo "----------------------------"

# Display user's info
echo "User Information:"
echo "Username   : $username"
echo "Home Dir   : $(eval echo ~$username)"
echo "User ID    : $(id -u $username)"
echo "Group ID   : $(id -g $username)"
echo "Groups     : $(id -nG $username)"
echo "Shell      : $(getent passwd "$username" | cut -d: -f7)"

echo "----------------------------"
