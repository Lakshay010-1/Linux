# Package Management

## 🔹 RHEL / CentOS / Fedora

| Package Manager           | Basic Commands                                              | Description             | Example                |
| ------------------------- | ----------------------------------------------------------- | ----------------------- | ---------------------- |
| yum (older) / dnf (newer) | `sudo yum update` / `sudo dnf update`                       | Update all packages     | sudo dnf update -y     |
|                           | `sudo yum install <package>` / `sudo dnf install <package>` | Install package         | sudo dnf install httpd |
|                           | `sudo yum remove <package>` / `sudo dnf remove <package>`   | Remove package          | sudo dnf remove httpd  |
|                           | `sudo yum list installed` / `sudo dnf list installed`       | List installed packages | dnf list installed     |
|                           | `sudo yum search <package>` / `sudo dnf search <package>`   | Search for packages     | dnf search nginx       |

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
