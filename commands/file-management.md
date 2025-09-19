# 🔹File and Directory Mangement

## 1. Listing and Viewing Files/Directories

- `ls` – List files and directories  
  | **Option** | **Description** |
  |------|------------------------|
  | `-l` | (long format) |
  | `-a` | (all, including hidden)|
  | `-h` | (human-readable sizes) |

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

---

## 13. Compress

- | Command | Syntax           | Description                | Example                         |
  | ------- | ---------------- | -------------------------- | ------------------------------- |
  | gzip    | `gzip <file>`    | Compress file → .gz        | gzip report.txt → report.txt.gz |
  | gzip -k | `gzip -k <file>` | Compress but keep original | gzip -k report.txt              |
  | bzip2   | `bzip2 <file>`   | Compress file → .bz2       | bzip2 data.csv                  |
  | xz      | `xz <file>`      | Compress file → .xz        | xz archive.tar                  |

---

## 14. De-Compress

- | Command | Syntax               | Description          | Example              |
  | ------- | -------------------- | -------------------- | -------------------- |
  | gunzip  | `gunzip <file.gz>`   | Decompress .gz file  | gunzip report.txt.gz |
  | bunzip2 | `bunzip2 <file.bz2>` | Decompress .bz2 file | bunzip2 data.csv.bz2 |
  | unxz    | `unxz <file.xz>`     | Decompress .xz file  | unxz archive.tar.xz  |

---

## 15. Archive

- | Command   | Syntax                                | Description                | Example                           |
  | --------- | ------------------------------------- | -------------------------- | --------------------------------- |
  | tar -cvf  | `tar -cvf <archive.tar> <files>`      | Create archive             | tar -cvf project.tar file1 file2  |
  | tar -zcvf | `tar -zcvf <archive.tar.gz> <files>`  | Create compressed .tar.gz  | tar -zcvf project.tar.gz \*.txt   |
  | tar -jcvf | `tar -jcvf <archive.tar.bz2> <files>` | Create compressed .tar.bz2 | tar -jcvf project.tar.bz2 \*.txt  |
  | zip       | `zip <archive.zip> <files>`           | Create .zip file           | zip docs.zip \*.pdf               |
  | zip -r    | `zip -r <archive.zip> <dir>`          | Compress directory         | zip -r project.zip ProjectFolder/ |

---

## 16. Extract Archive

- | Command   | Syntax                     | Description              | Example                  |
  | --------- | -------------------------- | ------------------------ | ------------------------ |
  | tar -xvzf | `tar -xvzf <file.tar.gz>`  | Extract .tar.gz archive  | tar -xvzf backup.tar.gz  |
  | tar -xvjf | `tar -xvjf <file.tar.bz2>` | Extract .tar.bz2 archive | tar -xvjf backup.tar.bz2 |
  | tar -xvJf | `tar -xvJf <file.tar.xz>`  | Extract .tar.xz archive  | tar -xvJf backup.tar.xz  |
  | unzip     | `unzip <archive.zip>`      | Extract .zip archive     | unzip docs.zip           |

---

## 17. Split and Joining Files

- | Command  | Syntax                            | Description                     | Example                           |
  | -------- | --------------------------------- | ------------------------------- | --------------------------------- |
  | split    | `split -b <size> <file> <prefix>` | Split file into chunks by size  | split -b 10M backup.tar part\_    |
  | split -l | `split -l <N> <file> <prefix>`    | Split file into chunks by lines | split -l 1000 bigfile.txt chunk\_ |
  | cat      | `cat <parts> > <file>`            | Combine split files             | cat part\_\* > backup.tar         |

---

## 18. Truncating Files

- | Command        | Syntax                      | Description                       | Example                                |
  | -------------- | --------------------------- | --------------------------------- | -------------------------------------- |
  | truncate       | `truncate -s <size> <file>` | Shrink/expand file to given size  | truncate -s 0 logfile.txt (empty file) |
  | echo -n > file | `echo -n > <file>`          | Overwrite file with empty content | echo -n > logfile.txt                  |

---
