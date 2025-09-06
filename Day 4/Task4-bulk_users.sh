#!/bin/bash
####################################
# Author : Shamlin
# Date   : 6th Sep 2025
#
# Version: V1
# Bulk User Creation Script
#
# Usage: sudo ./bulk_user_creation.sh
####################################

GROUP="dev"
USER_PREFIX="dev"
START=1
END=20
PASS_FILE="/root/dev_users_passwords.txt"

# Create group if it doesn't exist
if ! getent group "$GROUP" > /dev/null; then
    echo "Creating group '$GROUP'..."
    groupadd "$GROUP"
else
    echo "Group '$GROUP' already exists."
fi

# Create secure password file
touch "$PASS_FILE"
chmod 600 "$PASS_FILE"

# Loop to create users
for i in $(seq $START $END); do
    USERNAME="${USER_PREFIX}${i}"

    if id "$USERNAME" &>/dev/null; then
        echo "User $USERNAME already exists. Skipping."
    else
        PASSWORD=$(openssl rand -base64 12)

        useradd -m -s /bin/bash -g "$GROUP" "$USERNAME"
        echo "$USERNAME:$PASSWORD" | chpasswd

        echo "$USERNAME:$PASSWORD" >> "$PASS_FILE"

        echo "Created user: $USERNAME"
    fi
done

echo "All users created. Passwords stored in $PASS_FILE"
