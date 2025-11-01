# rpm (RedHat Package Manager)

- Low-level package manager for installing, querying, verifying, and removing .rpm packages
- yum and dnf use rpm internally
- `rpm [options] [package name or file]`

# rpm Commands

## 🔹 Installation & Removal

| Task                       | Command                                   | Description                                                                   |
| -------------------------- | ----------------------------------------- | ----------------------------------------------------------------------------- |
| Install a new package      | `sudo rpm -ivh package.rpm`               | Installs a new package (`-i` = install, `-v` = verbose, `-h` = progress hash) |
| Upgrade or install package | `sudo rpm -Uvh package.rpm`               | Upgrades if installed, otherwise installs new package                         |
| Remove a package           | `sudo rpm -e package_name`                | Uninstalls the specified package                                              |
| Reinstall a package        | `sudo rpm -ivh --replacepkgs package.rpm` | Reinstalls a package (same version)                                           |

---

## 🔹 Query Installed Packages

| Task                            | Command                 | Description                                      |
| ------------------------------- | ----------------------- | ------------------------------------------------ |
| Check if a package is installed | `rpm -q package_name`   | Shows package version if installed               |
| List all installed packages     | `rpm -qa`               | Displays all installed packages                  |
| Show detailed package info      | `rpm -qi package_name`  | Displays version, release, vendor, summary, etc. |
| List files from a package       | `rpm -ql package_name`  | Shows all files installed by that package        |
| Find which package owns a file  | `rpm -qf /path/to/file` | Identifies package providing a specific file     |

---

## 🔹 Explore Package Metadata

| Task                             | Command                           | Description                                         |
| -------------------------------- | --------------------------------- | --------------------------------------------------- |
| Show config files from a package | `rpm -qc package_name`            | Lists configuration files installed by the package  |
| Show documentation files         | `rpm -qd package_name`            | Lists documentation files installed by the package  |
| Show changelog entries           | `rpm -q --changelog package_name` | Displays changelog of the package                   |
| Show dependencies                | `rpm -qR package_name`            | Lists libraries or packages required by the package |

---

## 🔹 Query RPM Files (Not Installed)

| Task                        | Command                | Description                                    |
| --------------------------- | ---------------------- | ---------------------------------------------- |
| Show info from an RPM file  | `rpm -qpi package.rpm` | Displays metadata without installing           |
| List files inside an RPM    | `rpm -qpl package.rpm` | Shows contents of the package                  |
| List dependencies of an RPM | `rpm -qpR package.rpm` | Displays required packages before installation |
