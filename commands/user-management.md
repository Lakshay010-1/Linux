# User & Group Management Commands

## 1. User Account Management

| Command     | Syntax                             | Description                             | Example                       |
| ----------- | ---------------------------------- | --------------------------------------- | ----------------------------- |
| useradd     | `useradd [options] username`       | Create a new user                       | useradd john                  |
| useradd -m  | `useradd -m username`              | Create user with home directory         | useradd -m alice              |
| useradd -s  | `useradd -s /bin/bash username`    | Assign login shell                      | useradd -s /bin/zsh devuser   |
| passwd      | `passwd username`                  | Set/change user password                | passwd john                   |
| chpasswd    | `echo "user:password" \| chpasswd` | Set passwords in bulk (read from input) | echo "alice:1234" \| chpasswd |
| chage       | `chage [options] username`         | Manage password aging policies          | chage -l alice                |
| usermod     | `usermod [options] username`       | Modify existing user                    | usermod -s /bin/bash alice    |
| usermod -aG | `usermod -aG group username`       | Add user to a supplementary group       | usermod -aG sudo alice        |
| deluser     | `deluser username`                 | Delete user (Debian/Ubuntu)             | deluser bob                   |
| userdel     | `userdel username`                 | Delete user (RHEL/Fedora)               | userdel john                  |
| userdel -r  | `userdel -r username`              | Delete user + home directory            | userdel -r alice              |

### **useradd** options :

| Options | Description                            |
| ------- | -------------------------------------- |
| `-m`    | Create home directory (/home/username) |
| `-d`    | Specify custom home directory          |
| `-s`    | Specify login shell                    |
| `-u`    | Assign custom UID                      |
| `-g`    | Assign primary group                   |
| `-G`    | Assign supplementary groups            |
| `-c`    | Add description (GECOS field)          |
| `-e`    | Set account expiration date            |
| `-f`    | Set password inactivity before lock    |

### **passwd** options :

| Options     | Description                                               |
| ----------- | --------------------------------------------------------- |
| `No option` | Change current user’s password                            |
| `username ` | Change another user’s password (root only)                |
| `-d`        | Delete password (no password required to login, insecure) |
| `-l`        | Lock password (disable login)                             |
| `-u`        | Unlock password                                           |
| `-e`        | Force password change at next login                       |

### **usermod** options:

| Options      | Description                                                              |
| ------------ | ------------------------------------------------------------------------ |
| `-l NEWNAME` | Change username                                                          |
| `-d DIR    ` | Change home directory (use -m to move files too)                         |
| `-s SHELL  ` | Change login shell                                                       |
| `-u UID    ` | Change UID                                                               |
| `-g GID    ` | Change primary group                                                     |
| `-aG GROUPS` | Add to supplementary groups (-a is important, or groups get overwritten) |
| `-L`         | Lock account                                                             |
| `-U`         | Unlock account                                                           |
| `-e DATE`    | Set account expiration                                                   |

---

## 2. Group Management

| Command  | Syntax                        | Description                      | Example                     |
| -------- | ----------------------------- | -------------------------------- | --------------------------- |
| groupadd | `groupadd groupname`          | Create a new group               | groupadd developers         |
| groupdel | `groupdel groupname`          | Delete a group                   | groupdel developers         |
| groupmod | `groupmod -n newname oldname` | Rename a group                   | groupmod -n devs developers |
| gpasswd  | `gpasswd groupname`           | Set group password               | gpasswd devs                |
| chgrp    | `chgrp group file`            | Change group ownership of a file | chgrp developers file.txt   |
| newgrp   | `newgrp groupname`            | Switch to a new group            | newgrp developers           |

---

## 3. Viewing & Managing Users

| Command | Syntax            | Description                          | Example      |
| ------- | ----------------- | ------------------------------------ | ------------ |
| id      | `id username`     | Show user ID, group ID, and groups   | id alice     |
| groups  | `groups username` | Show groups a user belongs to        | groups bob   |
| whoami  | `whoami`          | Show current logged-in user          | whoami       |
| who     | `who`             | Show logged-in users                 | who          |
| w       | `w`               | Show logged-in users + activity      | w            |
| last    | `last`            | Show last login history              | last         |
| finger  | `finger username` | Display user details (needs package) | finger alice |
| login   | `login username`  | Start a new login session            | login bob    |
| logout  | `logout`          | Terminate current session            | logout       |

---

## 4. User Privileges & Access

| Command / File | Syntax / Location | Description              | Example         |
| -------------- | ----------------- | ------------------------ | --------------- |
| su             | `su - username`   | Switch user              | su - alice      |
| sudo           | `sudo command`    | Run command as root      | sudo apt update |
| visudo         | `visudo`          | Safely edit sudoers file | visudo          |

---

## 5. System Files Related to Users

| File              | Description                                                    |
| ----------------- | -------------------------------------------------------------- |
| `/etc/passwd`     | Stores user account info (username, UID, GID, shell, home dir) |
| `/etc/shadow`     | Stores encrypted user passwords                                |
| `/etc/group`      | Stores group info                                              |
| `/etc/gshadow`    | Stores group information including encrypted group passwords   |
| `/etc/sudoers`    | Controls sudo privileges                                       |
| `/etc/login.defs` | Sets default for user creation and password policies.          |
