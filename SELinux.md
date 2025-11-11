# SELinux (Security Enhanced Linux)

- SELinux controls what processes can access which files, directories, ports, devices, etc.<br/>Even root is restricted — not just normal users.

- SELinux applies security rules based on:

| Concept                            | Meaning / Purpose                                                                                                                                                                     | Example                                                                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| **Type Enforcement (TE) / Domain** | SELinux uses _types_ (for files) and _domains_ (for processes). They define what a process can access. A process runs _in a domain_ and can only read/write files of certain _types_. | `httpd_t` (Apache process domain), `ssh_t` (SSH daemon domain), `user_home_t` (home directory file type) |
| **Context Label**                  | Every file, process, and port in SELinux has a **security context**, which controls access rules. A context consists of 4 parts: _User:Role:Type:Level (MLS)_                         | `user_u:object_r:httpd_sys_content_t:s0`                                                                 |

---

## Booleans

- SELinux Booleans are on/off (true/false) switches that enable or disable specific SELinux policy behaviors.
- They do not change labels, they just adjust permissions within existing policies.
- Example :
  - Apache (httpd_t) normally cannot connect to network services like databases.<br/>
    To allow it -->
    setsebool -P httpd_can_network_connect on

## Key Files & Directories

| File / Command               | Purpose                                                             | Example / Notes                                   |
| ---------------------------- | ------------------------------------------------------------------- | ------------------------------------------------- |
| **/etc/selinux/config**      | Main SELinux mode configuration (Enforcing / Permissive / Disabled) | Edit this file to permanently change SELinux mode |
| **/var/log/audit/audit.log** | Primary log where SELinux denials (AVC messages) are recorded       | Use `ausearch` or `sealert` to analyze failures   |
| **/etc/selinux/**            | Base directory for SELinux policies and context configuration       | Contains policy store + context rules             |
| **/sys/fs/selinux/**         | Kernel SELinux status & control interface                           | View enforcement state at runtime                 |

## Commands

## 🔹 Essential SELinux Commands

| Command            | Purpose                                                     | Example                                                         |
| ------------------ | ----------------------------------------------------------- | --------------------------------------------------------------- |
| **sestatus**       | Display detailed SELinux status                             | `sestatus`                                                      |
| **getenforce**     | Show current SELinux mode (Enforcing/Permissive/Disabled)   | `getenforce`                                                    |
| **setenforce 0/1** | Temporarily change mode (0 = Permissive, 1 = Enforcing)     | `setenforce 0`                                                  |
| **ls -Z**          | Show SELinux label of files/directories                     | `ls -lZ /usr/sbin/httpd`(file) and `ls -dZ /etc/httpd`(dir)     |
| **ps -eZ**         | Show SELinux label of running processes                     | `ps -eZ`                                                        |
| **id -Z**          | Show SELinux context of current user session                | `id -Z`                                                         |
| **semanage**       | Manage persistent SELinux rules (fcontext, ports, booleans) | `semanage fcontext -a -t httpd_sys_content_t "/data/www(/.*)?"` |

### 🔹 File & Directory Label Management

| Command                                           | Purpose                                                   | Example                                                        |
| ------------------------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------- |
| **semanage fcontext -a -t <type> "/path(/.\*)?"** | Add _permanent_ file labeling rule                        | `semanage fcontext -a -t httpd_sys_content_t "/webdata(/.*)?"` |
| **semanage fcontext -d "/path(/.\*)?"**           | Remove a previously assigned custom label rule            | `semanage fcontext -d "/webdata(/.*)?"`                        |
| **chcon -t <type> <file>**                        | Change label temporarily (resets after restorecon/reboot) | `chcon -t httpd_sys_content_t index.html`                      |
| **restorecon -Rv <path>**                         | Apply default or configured SELinux labels to files       | `restorecon -Rv /webdata`                                      |

### 🔹 Port Management

| Command                                          | Purpose                            | Example                                       |
| ------------------------------------------------ | ---------------------------------- | --------------------------------------------- |
| **semanage port -l**                             | List port → SELinux type mappings  | `semanage port -l`                            |
| **semanage port -a -t <type> -p <proto> <port>** | Assign a new port to a domain/type | `semanage port -a -t http_port_t -p tcp 8080` |

### 🔹 Boolean Controls (Feature Toggles)

| Command                           | Purpose                                       | Example                                     |
| --------------------------------- | --------------------------------------------- | ------------------------------------------- |
| **getsebool -a**                  | List all SELinux booleans                     | `getsebool -a`                              |
| **setsebool <boolean> on/off**    | Change boolean temporarily                    | `setsebool httpd_can_network_connect on`    |
| **setsebool -P <boolean> on/off** | Change boolean permanently (writes to policy) | `setsebool -P httpd_can_network_connect on` |

### 🔹 Logging & Troubleshooting

| Command                          | Purpose                                                       | Example                               |
| -------------------------------- | ------------------------------------------------------------- | ------------------------------------- |
| **ausearch**                     | Search audit logs for SELinux denials                         | `ausearch -m avc -ts recent`          |
| **journalctl -t setroubleshoot** | Show SELinux violation summaries                              | `journalctl -t setroubleshoot`        |
| **sealert**                      | Converts AVC logs into readable explanations with suggestions | `sealert -a /var/log/audit/audit.log` |

### 🔹 System-Wide Relabeling (Use Only if Needed)

| Command                           | Purpose                                       | Example                         |
| --------------------------------- | --------------------------------------------- | ------------------------------- |
| **fixfiles onboot**               | Relabel all system files on next boot         | `fixfiles onboot` then reboot   |
| **touch /.autorelabel && reboot** | Force complete filesystem relabel immediately | `touch /.autorelabel && reboot` |
