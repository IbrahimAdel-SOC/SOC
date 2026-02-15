## OverTheWire Bandit - Completion Certificate

**Completed by:** Ibrahim Adel
**Completion Date:** February 12, 2026
**Total Levels:** 0-33 (34 levels)
**Status:**  Completed

---

## Overview

Successfully completed all 34 levels of the OverTheWire Bandit wargame, a beginner-friendly game focused on learning Linux command line and basic security concepts through progressively challenging tasks.

---

## Skills Developed

### 1. Linux Command Line Mastery
**File Operations:**
- `cat`, `ls`, `file`, `find`, `grep`, `awk`, `sed`
- Reading hidden files and files with special characters
- Recursive file searching

**Text Processing:**
- `sort`, `uniq`, `tr`, `cut`, `strings`
- Pipeline operations and command chaining
- Pattern matching and filtering

**File Encoding & Compression:**
- `base64` - Base64 encoding/decoding
- `xxd` - Hexdump and reverse operations
- `tar`, `gzip`, `bzip2` - Archive handling

**Networking:**
- `ssh` - Remote connection and key authentication
- `nc` (netcat) - Network connections
- `nmap` - Port scanning basics
- `telnet`, `openssl s_client`

### 2. Security Fundamentals
- SSH key-based authentication
- Linux file permissions (chmod, chown)
- Password cracking concepts
- Basic cryptography (Caesar cipher, ROT13)
- Git repository analysis
- Cron jobs and scheduled tasks

### 3. Problem-Solving Skills
- Reading and understanding documentation (`man` pages)
- Breaking down complex problems
- Researching unknown commands
- Creative thinking for non-obvious solutions

---
## Key Commands Learned

```bash
# ========== File Operations ==========

# Find file with specific attributes
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null

# Determine file type
file filename                     # Check file type
file *                           # Check all files in directory
file -b filename                 # Brief output (no filename)

# Read file with spaces in name
cat "spaces in this filename"

# Copy files from path to path
dd if=INPUT of=OUTPUT [options]

# Extract readable text from binary files
strings file

# ========== Text Processing ==========

# Filter results and remove duplicates
sort data.txt | uniq -u

# Sort and get unique lines
sort names.txt | uniq

# Character translation/replacement
tr 'A-Z' 'a-z'                    # Convert uppercase to lowercase
tr 'a-z' 'A-Z'                    # Convert lowercase to uppercase
tr -d 'chars'                     # Delete specific characters

# ========== Encoding & Decoding ==========

# Base64 decode
base64 -d file.txt

# Hexdump reverse
xxd -r dump.txt

# ========== Compression & Archiving ==========

# gzip compression/decompression
gzip file.txt                     # Compress (creates file.txt.gz)
gunzip file.gz                    # Decompress
gzip -d file.gz                   # Decompress (alternative)

# bzip2 compression/decompression
bzip2 file.txt                    # Compress (creates file.txt.bz2)
bunzip2 file.bz2                  # Decompress
bzip2 -d file.bz2                 # Decompress (alternative)

# tar archiving/extracting
tar -cf archive.tar folder/       # Create archive
tar -xf file.tar                  # Extract archive
tar -czf archive.tar.gz folder/   # Create compressed archive (gzip)
tar -xzf archive.tar.gz           # Extract compressed archive (gzip)
tar -cjf archive.tar.bz2 folder/  # Create compressed archive (bzip2)
tar -xjf archive.tar.bz2          # Extract compressed archive (bzip2)

# ========== Networking ==========

# SSH with different port
ssh bandit0@bandit.labs.overthewire.org -p 2220

# Netcat - Create network connections (TCP/UDP)
# Listen as Server (Listening mode)
nc -l <port>

# Connect as Client
nc <host> <port>

# Example: Send multiple data
for i in $(seq -w 0000 9999); do
  echo "gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $i"
done | nc localhost 30002

# ========== Security & Permissions ==========

# SetUID - Execute program with different user's permissions
# Program runs with owner's permissions, not current user
./bandit20-do <command>

# Example: Find SetUID files
find / -perm -4000 2>/dev/null

# ========== Git Commands ==========

# View commit history
git log

# View specific commit details
git show <commit-hash>

# View last commit
git show HEAD

# View commit history with graph
git log --graph --oneline

# ========== Bash Scripting ==========

# Loop with sequential numbers with padding
seq -w 0000 9999

# Pass output as input to another command (Piping)
command1 | command2
```

---

## Additional Command Explanations

### **strings Command**
- **Description:** Extract printable strings from binary files
- **Usage:** `strings filename`
- **Use cases:**
  - Finding hidden text in executables
  - Analyzing binary files
  - Searching for passwords/credentials in compiled programs
  - Reverse engineering
- **Common flags:**
  - `-n <num>` Minimum string length (default: 4)
  - `-a` Scan entire file
  - `-t x` Show file offset in hex

### **file Command**
- **Description:** Determine file type by examining file contents (not just extension)
- **Usage:** `file [options] filename`
- **Why it's important:** Files in Linux don't need extensions - `file` reads the actual file header/magic bytes
- **Common outputs:**
  - `ASCII text` - Plain text file
  - `ELF 64-bit executable` - Compiled binary
  - `gzip compressed data` - Compressed file
  - `JPEG image data` - Image file
  - `Bourne-Again shell script` - Bash script
  - `data` - Unknown/binary data
- **Common flags:**
  - `-b` Brief mode (don't show filename)
  - `-i` Show MIME type
  - `-z` Look inside compressed files
- **Use cases:**
  - Identifying unknown files
  - Verifying file types before processing
  - Finding files that were renamed with wrong extensions
  - Essential for Level 12 (multiple compressed files)
- **Example workflow:**

```bash
  file data.txt          # Check what it really is
  # Output: data.txt: gzip compressed data
  mv data.txt data.gz    # Rename appropriately
  gunzip data.gz         # Decompress
  file data              # Check again
```

### **tr (Translate)**
- **Description:** Translate or delete characters
- **Usage:** `tr [options] SET1 [SET2]`
- **Examples:**
  - `tr 'A-Z' 'a-z'` - Convert to lowercase
  - `tr -d '\n'` - Delete newlines
  - `tr -s ' '` - Squeeze repeated spaces
  - `echo "hello" | tr 'a-z' 'n-za-m'` - ROT13 cipher
- **Common use cases:**
  - Case conversion
  - Character replacement
  - Removing unwanted characters
  - Simple cipher implementations

### **Compression Tools Comparison**

| Tool | Extension | Compression Ratio | Speed | Command |
|------|-----------|-------------------|-------|---------|
| gzip | .gz | Medium | Fast | `gzip file` |
| bzip2 | .bz2 | Better | Slower | `bzip2 file` |
| xz | .xz | Best | Slowest | `xz file` |

### **tar Command**
- **Description:** Archive files (Tape ARchive)
- **Common flags:**
  - `-c` Create archive
  - `-x` Extract archive
  - `-f` Specify filename
  - `-z` Use gzip compression
  - `-j` Use bzip2 compression
  - `-v` Verbose output
  - `-t` List contents without extracting
- **Examples:**
  - `tar -czf backup.tar.gz folder/` - Create compressed backup
  - `tar -xzf backup.tar.gz` - Extract compressed archive
  - `tar -tf archive.tar` - List contents

### **SetUID Bit**
- **What is it:** Special permission that allows file execution with owner's privileges
- **Usage:** Programs requiring elevated permissions (like `passwd`, `sudo`)
- **Symbol:** `s` in file permissions (e.g., `-rwsr-xr-x`)
- **Numeric value:** `4000` in chmod
- **Security note:** Can be exploited if not properly configured

### **Netcat (nc)**
- **Description:** Powerful networking tool for creating TCP/UDP connections
- **Use cases:**
  - File transfer
  - Port testing
  - Chat between two machines
  - Backdoors (in penetration testing)
  - Port scanning
  - Banner grabbing
- **Modes:**
  - Server mode: `nc -l -p 1234`
  - Client mode: `nc 192.168.1.1 1234`
- **Common flags:**
  - `-l` Listen mode
  - `-p` Port number
  - `-v` Verbose output
  - `-z` Zero-I/O mode (port scanning)

### **dd Command**
- **Description:** Low-level utility for copying and converting data
- **Use cases:**
  - Disk cloning
  - Creating ISO images
  - Secure data wiping
  - Data conversion during copy
  - Backup and restore
- **Parameters:**
  - `if=` Input File
  - `of=` Output File
  - `bs=` Block Size
  - `count=` Number of blocks
- **Example:** `dd if=/dev/sda of=/dev/sdb bs=4M`
- **Warning:** Very powerful - can destroy data if used incorrectly!

### **Git Commands**
- **git log:** View commit history
  - `--oneline` Compact view
  - `--graph` Show branch graph
  - `-p` Show patches/diffs
  - `-n <num>` Limit number of commits
- **git show:** Display commit details
  - Shows commit message, diff, and changes
  - `git show HEAD` - Show last commit
  - `git show <commit>:<file>` - Show specific file from commit

### **Sequential Padding (seq -w)**
- **Description:** Generate sequence of numbers with leading zeros
- **Usage:** `seq -w START END`
- **Example:** `seq -w 0000 9999` generates 0000, 0001, 0002... 9999
- **Use case:** Brute force attacks, batch file naming
---

## Notable Challenges

### Most Challenging Level
**Level 12:**
The multi-layered compression challenge - had to decompress the file multiple times using different tools (gzip, bzip2, tar). Learned the importance of checking file types with `file` command.

### Most Interesting Level
**Level 20:**
Using setuid binaries and netcat together to establish a connection and retrieve the password. 

### Favorite Learning Moment
Learning the `find` command with all its powerful options - especially combining user, group, and size parameters to locate specific files in a large filesystem.

---

## Level Passwords Archive

<details>
<summary>All Passwords </summary>
```
Level 0 → 1: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
Level 1 → 2: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
Level 2 → 3: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
Level 3 → 4: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
Level 4 → 5: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
Level 5 → 6: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
Level 6 → 7: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
Level 7 → 8: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
Level 8 → 9: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
Level 9 → 10: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
Level 10 → 11: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
Level 11 → 12: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
Level 12 → 13: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
Level 13 → 14: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
Level 14 → 15: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
Level 15 → 16: kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
Level 16 → 17: EReVavePLFHtFlFsjn3hyzMlvSuSAcRD
Level 17 → 18: x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
Level 18 → 19: cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
Level 19 → 20: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
Level 20 → 21: EeoULMCra2q0dSkYj561DX7s1CpBuOBt
Level 21 → 22: tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
Level 22 → 23: 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga
Level 23 → 24: gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
Level 24 → 25: iCi86ttT4KSNe1armKiwbQNmB3YJP3q4
Level 25 → 26: s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ
Level 26 → 27: upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB
Level 27 → 28: Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN
Level 28 → 29: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
Level 29 → 30: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
Level 30 → 31: fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy
Level 31 → 32: 3O9RfhqyAlVBEZpVb6LYStshZoqoSx5K
Level 32 → 33: tQdtbs5D5i2vJwkO8mEyYEyTL8izoeJ0
```

</details>

---

## Key Takeaways

1. **Man pages are my best friend** 
2. **Piping is powerful** 
3. **Read error messages carefully** 
4. **Try before  search** 
5. **Small steps** 

---

## Resources Used

- OverTheWire Bandit: https://overthewire.org/wargames/bandit/
- Linux man pages
- Personal notes and experimentation

---

## Verification

 All 34 levels completed
 Passwords documented
 Key commands learned and practiced

---

*This document serves as a personal record of completion and learning journey through the Bandit wargame.*

**Repository:** https://github.com/IbrahimAdel-SOC/OverTheWire

**Completion Proof:** Bandit33.png
---

**Date Created:** February 13, 2026
**Last Updated:** February 13, 2026
