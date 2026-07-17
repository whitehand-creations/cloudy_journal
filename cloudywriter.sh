#!/bin/bash

# This script is used for private journaling.

# Create the entries directory and output to /dev/null for the unnecessary 'directory already exists' error for mkdir
mkdir 'entries' &> /dev/null

# Check for the entries directory
if [[ -d "entries" ]]; then
    echo "You have the required directory"
else
    echo "Please open a directory called 'entries'"
    exit 1
fi

# Add timestamps as the filename
entry_date=$(date +%F)
entry_time=$(date +%T)
filename="${entry_date}_${entry_time}.txt"
touch "${filename}" 

# Verify the filename exists
if [[ "${?}" == 0 ]]; then
    read -p "Enter your thoughts and feelings here: " scribe
else 
    echo "Could not create file"
    exit 1
fi
    
# Verify if the user provided input

if [[ -n "${scribe}" ]]; then 
    echo "${scribe}" >> "${filename}"
else
    echo "Your reponse is empty. Exiting..."
    exit 1 
fi 

# Add symmetric encryption. Cipher algorithm will be AES-256
gpg --symmetric --cipher-algo AES256 "${filename}"

# Verify the encryption worked
if [[ "${?}" == 0 ]]; then
    echo "Entry is encrypted"
else
    echo "Failed to encrypt entry"
    exit 1 
fi

# Delete plaintext file and move the encrypted file in 'entries'
if shred -u "${filename}"; then
    echo "Contents removed from disk"
else
    echo "Unsuccessful in removing plaintext file & its contents from disk"
    exit 1
fi
