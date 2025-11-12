# Package Management

## 🔹 RHEL / CentOS / Fedora

### File Downloader

- It simply retrieves data from a URL (HTTP, HTTPS, FTP).

| File Downloader | Basic Commands                         | Description                                                                         | Example                                      |
| --------------- | -------------------------------------- | ----------------------------------------------------------------------------------- | -------------------------------------------- |
| wget            | wget [options] <url>                   | The Classic File Downloader                                                         | wget https://example.com/file.zip            |
| curl            | curl [option] <url>                    | Universal Data Transfer Tool<br/>Can download or upload data with various protocols | curl -O https://example.com/file.zip         |
| scp             | scp [options] <source> <destination>   | Used to copy files securely over SSH.                                               | scp file.txt user@192.168.1.10:/home/user/   |
| rsync           | rsync [options] <source> <destination> | Efficiently sync files between systems.                                             | rsync file.txt user@192.168.1.10:/home/user/ |

### Package Manager

- Software management systems — they locate, download, verify, install, and update software packages with dependencies.

| Package Manager           | Basic Commands                                              | Description                                                                               | Example                       |
| ------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------- |
| [rpm](./detailed/rpm.md)  | rpm [OPTIONS] [PACKAGE-FILE or PACKAGE-NAME]                | Low-level package manager for installing, querying, verifying, and removing .rpm packages | rpm -ivh package.rpm          |
| yum (older) / dnf (newer) | `sudo yum install <package>` / `sudo dnf install <package>` | Install package                                                                           | sudo dnf install httpd        |
|                           | `sudo yum remove <package>` / `sudo dnf remove <package>`   | Remove package                                                                            | sudo dnf remove httpd         |
|                           | `sudo yum update` / `sudo dnf update`                       | Update all packages                                                                       | sudo dnf update -y            |
|                           | `sudo yum upgrade` / `sudo dnf upgrade`                     | Upgrade all packages                                                                      | sudo dnf upgrade -y           |
|                           | `sudo yum history ` / `sudo dnf history `                   | View Update History                                                                       | sudo dnf history              |
|                           | `sudo dnf history redo <package>`                           | Redo a Rollback                                                                           | sudo dnf history redo 15      |
|                           | `sudo yum history undo <id>` / `sudo dnf history undo <id>` | Roll Back (Undo) a Specific Transaction                                                   | sudo dnf history undo 15      |
|                           | `sudo dnf downgrade <package>`                              | Roll Back a Specific Package                                                              | sudo dnf downgrade nginx      |
|                           | `sudo yum list installed` / `sudo dnf list installed`       | List installed packages                                                                   | dnf list installed            |
|                           | `sudo yum search <package>` / `sudo dnf search <package>`   | Search for packages                                                                       | dnf search nginx              |
|                           | `sudo dnf autoremove`                                       | Remove Orphan Packages                                                                    | sudo dnf autoremove           |
| yum-utils                 | sudo package-cleanup --\<leaves or orphans>                 | Remove Orphan Packages                                                                    | sudo package-cleanup --leaves |

---

## 🔹 Debian / Ubuntu

| Package Manager | Basic Commands               | Description                     | Example                |
| --------------- | ---------------------------- | ------------------------------- | ---------------------- |
| apt             | `sudo apt update`            | Update package lists            | sudo apt update        |
|                 | `sudo apt upgrade`           | Upgrade all installed packages  | sudo apt upgrade -y    |
|                 | `sudo apt install <package>` | Install a package               | sudo apt install nginx |
|                 | `sudo apt remove <package>`  | Remove a package (keep config)  | sudo apt remove nginx  |
|                 | `sudo apt purge <package>`   | Remove package including config | sudo apt purge nginx   |
|                 | `sudo apt search <package>`  | Search packages                 | apt search docker      |
|                 | `apt show <package>`         | Show package info               | apt show python3       |

---

## 🔹 SUSE / openSUSE

| Package Manager | Basic Commands                  | Description        | Example                 |
| --------------- | ------------------------------- | ------------------ | ----------------------- |
| zypper          | `sudo zypper refresh`           | Refresh repository | sudo zypper refresh     |
|                 | `sudo zypper install <package>` | Install package    | sudo zypper install vim |
|                 | `sudo zypper remove <package>`  | Remove package     | sudo zypper remove vim  |
|                 | `sudo zypper search <package>`  | Search package     | sudo zypper search git  |

---

## 🔹 Arch Linux

| Package Manager | Basic Commands              | Description     | Example              |
| --------------- | --------------------------- | --------------- | -------------------- |
| pacman          | `sudo pacman -Syu`          | Update system   | sudo pacman -Syu     |
|                 | `sudo pacman -S <package>`  | Install package | sudo pacman -S nginx |
|                 | `sudo pacman -R <package>`  | Remove package  | sudo pacman -R nginx |
|                 | `sudo pacman -Ss <package>` | Search package  | pacman -Ss python    |

---
