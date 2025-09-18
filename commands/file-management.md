# 🔹File and Directory Mangement

## 1. Listing and Viewing Files/Directories

- `ls` – List files and directories  
  | **Option** | **Description**   |
  |------|-------------------------|
  | `-l` | (long format)           |
  | `-a` | (all, including hidden) |
  | `-h` | (human-readable sizes)  |

- `tree` – Display directories in a tree-like structure
- `pwd` - Print current working directory

---

## 2. Changing Directories

- | **Command**      | **Description**          |
  | ---------------- | ------------------------ |
  | `cd <directory>` | Change current directory |
  | `cd ..`          | Move up one directory    |
  | `cd ~` or `cd`   | Go to home directory     |

---

## 3. Creating Directories

- | **Command**         | **Description**        |
  | ------------------- | ---------------------- |
  | `mkdir <directory>` | Create a new directory |

  | **Option** | **Description**                                 |
  | ---------- | ----------------------------------------------- |
  | `-p`       | (create parent directories if they don’t exist) |

---

## 4. Removing Directories

- | **Command**         | **Description**                                 |
  | ------------------- | ----------------------------------------------- |
  | `rmdir <directory>` | Remove an empty directory                       |
  | `rm -r <directory>` | Remove a directory and its contents recursively |

---

## 5. Creating Files

- | **Command**        | **Description**                               |
  | ------------------ | --------------------------------------------- |
  | `touch <filename>` | Create an empty file or update file timestamp |

---

## 6. Copying Files and Directories

- `cp <source> <destination>` – Copy files or directories

  | **Options** | **Description**                |
  | ----------- | ------------------------------ |
  | `-r`        | (recursive for directories)    |
  | `-i`        | (prompt before overwrite)      |
  | `-u`        | (copy only if source is newer) |

---

## 7. Moving/Renaming Files and Directories

- `mv <source> <destination>` – Move or rename files/directories  
   | **Option** | **Description**|
  |---------|------------|
  |`-i`| prompt before overwrite |

---

## 8. Removing Files

- `rm <filename>` – Remove file(s)

  | **Command** | **Description**            |
  | ----------- | -------------------------- |
  | `-f`        | (force, no prompt)         |
  | `-i`        | (interactive confirmation) |
  | `-r`        | (for directories)          |

---

## 9. Viewing File Details

- | **Command**   | **Description**                                                |
  | ------------- | -------------------------------------------------------------- |
  | `stat <file>` | Show detailed file information (size, permissions, timestamps) |
  | `file <file>` | Show file type                                                 |

---

## 10. Finding Files

- | **Command**                     | **Description**                                           |
  | ------------------------------- | --------------------------------------------------------- |
  | `find <path> -name "<pattern>"` | Search files/directories                                  |
  | `locate <filename>`             | Quickly locate files using database (requires `updatedb`) |
  | `which <command>`               | Show full path of a command                               |

---

## 11. Linking Files

- | **Command**             | **Description**               |
  | ----------------------- | ----------------------------- |
  | `ln <target> <link>`    | Create a hard link            |
  | `ln -s <target> <link>` | Create a symbolic (soft) link |

---

## 12. Disk Usage for Files/Directories

- `du <directory>` – Show disk usage

  | **Option** | **Description**  |
  | ---------- | ---------------- |
  | `-h`       | (human-readable) |
  | `-s`       | (summary only)   |

- `df` – Show filesystem disk usage
