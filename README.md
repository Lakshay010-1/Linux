# Linux

### Linux scripts and configurations for automation, optimization, and productivity

## Command Syntax

- #### command [options] [arguments]
  - `command` → the program you want to run (e.g., ls, cp, grep).
  - `options` (flags, switches) → modify the behavior of the command. Usually start with - or --.
  - `arguments` → the target(s) the command works on (files, directories, text, etc.).

<br>

# Linux Commands

## 🔹Help Commands

- | Command                   | Description                       |
  | ------------------------- | --------------------------------- |
  | `man <command>`           | Full manual page                  |
  | `<command> --help`        | Quick usage guide                 |
  | `info <command>`          | More detailed docs (if available) |
  | `help <command>`          | For shell built-ins               |
  | `whatis <command>`        | One-line description              |
  | `which/whereis <command>` | Locate executable                 |
  | `type <command>`          | Identify command type             |
  ***

## 🔹Text Processing

- | Command                    | Description                             |
  | -------------------------- | --------------------------------------- |
  |                            |                                         |
  | `cat <file>`               | Display file content                    |
  | `tac <file>`               | Display file in reverse order           |
  | `more <file>`              | View file page by page                  |
  | `less <file>`              | Scrollable view with search             |
  | `head [-n N] <file>`       | Show first N lines (default 10)         |
  | `tail [-n N] <file>`       | Show last N lines                       |
  | `tail -f <file>`           | Show appended content in real time      |
  | `vi <file>`                | Open file in vi/vim editor              |
  | `awk '{print $N}' <file>`  | Print specific column(s)                |
  | `grep "pattern" <file>`    | Search for a pattern                    |
  | `grep -r "pattern" <dir>`  | Recursive search in directory           |
  | `egrep "pat1 pat2" <file>` | Extended regex search                   |
  | `fgrep "text" <file>`      | Fixed string search (faster than regex) |
  | `wc [options] <file>`      | Count lines, words, characters          |
  | `cut -cN-M <file>`         | Extract character range                 |
  | `cut -d':' -fN <file>`     | Extract fields by delimiter             |
  | `sort <file>`              | Sort lines alphabetically               |
  | `uniq <file>`              | Remove duplicate lines                  |
  | `echo "text"`              | Print text                              |
  | `command > file`           | Redirect output (overwrite)             |
  | `command >> file`          | Redirect output (append)                |
  | `command < file`           | Redirect input from file                |
  | `cat > file`               | Create/overwrite file                   |
  | `cat >> file`              | Append manually typed text              |
  | `tee \| command`           | tee file                                |
  | `diff <file1> <file2>`     | Show line differences                   |
  | `cmp <file1> <file2>`      | Compare files byte by byte              |
  | `tr 'set1' 'set2' < file`  | Translate characters                    |
  | `nl <file>`                | Number lines in file                    |
  | `strings <binary>`         | Extract readable text from binary       |

  ***

## 🔹File Permissions

- | Command                               | Description                                                            |
  | ------------------------------------- | ---------------------------------------------------------------------- |
  | `ls -l <file>`                        | List file permissions, ownership, size, and date                       |
  | `chmod [options] mode file`           | Change file permissions using octal numeric value (read/write/execute) |
  | `chmod [ugoa][+-=][rwx] file`         | Modify permissions using symbolic notation                             |
  | `umask [value]`                       | Set default permission mask for new files/dirs                         |
  | `chown [owner][:group] file`          | Change file owner and/or group                                         |
  | `chown owner:group file`              | Change both owner and group                                            |
  | `chgrp <group> file`                  | Change group ownership only                                            |
  | `getfacl <file>`                      | Show ACLs of file/directory                                            |
  | `setfacl -m u:<user>:<perm> <file>`   | Modify ACL (set permissions for user)                                  |
  | `setfacl -m g:<group>:<perm> <file>`  | Grant group access                                                     |
  | `setfacl -x u:<user> <file>`          | Remove ACL for a user                                                  |
  | `setfacl -b <file>`                   | Remove all ACL entries                                                 |
  | `setfacl -d -m u:<user>:<perm> <dir>` | Set default ACL for new files in a directory                           |
  | `chmod 4xxx <file>`                   | Setuid: run with owner’s permissions                                   |
  | `chmod 2xxx <dir>`                    | Setgid: new files inherit group ownership                              |
  | `chmod 1xxx <dir>`                    | Sticky bit: restrict deletion inside dir                               |

---

## 🔹File and Directory Mangement

- | Command                               | Description                      |
  | ------------------------------------- | -------------------------------- |
  | `ls`                                  | List files and directories       |
  | `tree`                                | Display directories as tree      |
  | `cd <dir>`                            | Change directory                 |
  | `cd ..`                               | Up one level                     |
  | `cd ~`                                | Home directory                   |
  | `pwd`                                 | Print working directory          |
  | `mkdir <dir>`                         | Make a directory                 |
  | `rmdir <dir>`                         | Remove empty directory           |
  | `rm -r <dir>`                         | Remove directory and contents    |
  | `touch <file>`                        | Create empty file                |
  | `cp <src> <dest>`                     | Copy files or directories        |
  | `mv <src> <dest>`                     | Move or rename                   |
  | `rm <file>`                           | Remove file                      |
  | `stat <file>`                         | Show detailed file info          |
  | `file <file>`                         | Show file type                   |
  | `find <path>name "<pattern>"`         | Search files/directories         |
  | `locate <file>`                       | Locate file                      |
  | `which <cmd>`                         | Show command path                |
  | `ln <target> <link>`                  | Hard link                        |
  | `ln -s <target> <link>`               | Symbolic link                    |
  | `du <dir>`                            | Show disk usage                  |
  | `df`                                  | Show filesystem usage            |
  | `gzip <file>`                         | Compress file → .gz              |
  | `gzip -k <file>`                      | Compress but keep original       |
  | `bzip2 <file>`                        | Compress file → .bz2             |
  | `xz <file>`                           | Compress file → .xz              |
  | `tar -cvf <archive.tar> <files>`      | Create archive                   |
  | `tar -zcvf <archive.tar.gz> <files>`  | Create compressed .tar.gz        |
  | `tar -jcvf <archive.tar.bz2> <files>` | Create compressed .tar.bz2       |
  | `gunzip <file.gz>`                    | Decompress .gz file              |
  | `bunzip2 <file.bz2>`                  | Decompress .bz2 file             |
  | `unxz <file.xz>`                      | Decompress .xz file              |
  | `tar -xvzf <file.tar.gz>`             | Extract .tar.gz archive          |
  | `tar -xvjf <file.tar.bz2>`            | Extract .tar.bz2 archive         |
  | `tar -xvJf <file.tar.xz>`             | Extract .tar.xz archive          |
  | `zip <archive.zip> <files>`           | Create .zip file                 |
  | `zip -r <archive.zip> <dir>`          | Compress directory               |
  | `unzip <archive.zip>`                 | Extract .zip archive             |
  | `split -b <size> <file> <prefix>`     | Split file into chunks by size   |
  | `split -l <N> <file> <prefix>`        | Split file into chunks by lines  |
  | `cat <parts> > <file>`                | Combine split files              |
  | `truncate -s <size> <file>`           | Shrink/expand file to given size |

---
