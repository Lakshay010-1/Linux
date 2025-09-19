# 🔹File Permissions

## 1. Basic File Permissions

- | Command          | Syntax                        | Description                                      | Example             |
  | ---------------- | ----------------------------- | ------------------------------------------------ | ------------------- |
  | ls -l            | `ls -l <file>`                | List file permissions, ownership, size, and date | ls -l file.txt      |
  | chmod            | `chmod [options] mode file`   | Change file permissions (read/write/execute)     | chmod 755 script.sh |
  | chmod (symbolic) | `chmod [ugoa][+-=][rwx] file` | Modify permissions using symbolic notation       | chmod u+x script.sh |
  | umask            | `umask [value]`               | Set default permission mask for new files/dirs   | umask 022           |

---

## 2. File Ownership

- | Command             | Syntax                       | Description                    | Example                   |
  | ------------------- | ---------------------------- | ------------------------------ | ------------------------- |
  | chown               | `chown [owner][:group] file` | Change file owner and/or group | chown alice file.txt      |
  | chown (owner+group) | `chown owner:group file`     | Change both owner and group    | chown alice:devs project/ |
  | chgrp               | `chgrp <group> file`         | Change group ownership only    | chgrp staff report.doc    |

---

## 3. Access Control Lists (ACLs)

- | Command            | Syntax                                | Description                                  | Example                           |
  | ------------------ | ------------------------------------- | -------------------------------------------- | --------------------------------- |
  | getfacl            | `getfacl <file>`                      | Show ACLs of file/directory                  | getfacl file.txt                  |
  | setfacl -d         | `setfacl -d -m u:<user>:<perm> <dir>` | Set default ACL for new files in a directory | setfacl -d -m u:alice:rw Project/ |
  | setfacl -m         | `setfacl -m u:<user>:<perm> <file>`   | Modify ACL (set permissions for user)        | setfacl -m u:alice:rw file.txt    |
  | setfacl -m (group) | `setfacl -m g:<group>:<perm> <file>`  | Grant group access                           | setfacl -m g:devs:r file.txt      |
  | setfacl -x         | `setfacl -x u:<user> <file>`          | Remove ACL for a user                        | setfacl -x u:alice file.txt       |
  | setfacl -b         | `setfacl -b <file>`                   | Remove all ACL entries                       | setfacl -b file.txt               |

---

## 4. Special Permission Bits

- | Command         | Syntax              | Description                               | Example                     |
  | --------------- | ------------------- | ----------------------------------------- | --------------------------- |
  | chmod 4xxx file | `chmod 4xxx <file>` | Setuid: run with owner’s permissions      | chmod 4755 /usr/bin/program |
  | chmod 2xxx dir  | `chmod 2xxx <dir>`  | Setgid: new files inherit group ownership | chmod 2755 shared_dir/      |
  | chmod 1xxx dir  | `chmod 1xxx <dir>`  | Sticky bit: restrict deletion inside dir  | chmod 1777 /tmp             |

---
