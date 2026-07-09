#!/bin/bash

# This script is used for private journaling. 

# Add timestamp
entry_date=$(date +%F)
entry_time=$(date +%T)
filename="${entry_date}_${entry_time}.txt"

# Open the file
touch "${filename}"

# Collect user input
read -p "Enter your thoughts and feelings here: " scribe


# Send the input over to the file
echo "${scribe}" >> "${filename}"

# Add symmetric encryption. Cipher algorithm will be AES-256
gpg --symmetric --cipher-algo AES256 "${filename}"

# Verify the encryption worked
if [[ "${?}" == 0 ]]; then
    echo "Entry is encrypted"
else
    exit 1 
fi

# Delete plaintext file and move the encrypted file in 'entries'
rm "${filename}"
mv "${filename}.gpg" entries
