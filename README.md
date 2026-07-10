# Cloudy Journal 
This is a bash script used for encrypted journaling of the user's private thoughts and feelings. 

### How does it work?
- Date and timestamp will be the filename of the entry
- You will execute the file, `cloudywriter.sh`
    - `chmod +x cloudywriter.sh`
    - `./cloudywriter.sh`
- You will be prompted to journal your thoughts, and everything is saved to a plaintext file
- This script uses the symmetric encryption algorithm, AES-256, to store confidential text from the plaintext file
- Immediately deletes the original plaintext file
- Saved as a `.gpg`  file, it will be stored in a directory called `entries`

### Requirements
- Bash
- GPG
    - macOS: `brew install gnupg`
    - Linux: Usually, pre-installed. If not: `sudo apt install gnupg` (Debian/Ubuntu), `sudo dnf install gnupg` (Fedora), or `sudo pacman -S gnupg` (Arch)
       

### License
MIT License
