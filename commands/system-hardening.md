# System Security & Hardening

- | Area                   | Action                              | Command / File                                                         |
  | ---------------------- | ----------------------------------- | ---------------------------------------------------------------------- |
  | **User Security**      | Disable root SSH login              | `/etc/ssh/sshd_config` → `PermitRootLogin no`                          |
  |                        | Enforce strong passwords            | `/etc/security/pwquality.conf`                                         |
  |                        | Set password aging                  | `chage -M 90 user`                                                     |
  |                        | Use sudo instead of root            | `/etc/sudoers`                                                         |
  | **SSH Hardening**      | Change SSH port                     | `/etc/ssh/sshd_config` → `Port 2222`                                   |
  |                        | Allow specific users                | `/etc/ssh/sshd_config` → `AllowUsers adminuser`                        |
  |                        | Disable password login              | `/etc/ssh/sshd_config` → `PasswordAuthentication no`                   |
  | **File Security**      | Check file permissions              | `ls -l`                                                                |
  |                        | Restrict sensitive files            | `chmod 600 <file>`                                                     |
  |                        | Protect system files                | `chattr +i /etc/passwd`                                                |
  | **Network Security**   | Show open ports                     | `ss -tuln`                                                             |
  |                        | Configure firewall                  | `firewall-cmd --add-service=http --permanent && firewall-cmd --reload` |
  |                        | Disable unused services             | `systemctl disable --now <service>`                                    |
  |                        | Enable SELinux                      | `/etc/selinux/config` → `SELINUX=enforcing`                            |
  | **Software & Updates** | Update system                       | `dnf update -y`                                                        |
  |                        | Remove unused packages              | `dnf remove <package>`                                                 |
  | **Logging & Auditing** | Enable audit service                | `systemctl enable --now auditd`                                        |
  |                        | View logs                           | `journalctl` or `/var/log/messages`                                    |
  |                        | Check audit rules                   | `/etc/audit/audit.rules`                                               |
  | **Kernel & Sysctl**    | Apply sysctl security settings      | `/etc/sysctl.conf` → `net.ipv4.icmp_echo_ignore_all=1`                 |
  |                        | Disable IPv6 (if unused)            | `/etc/sysctl.conf` → `net.ipv6.conf.all.disable_ipv6=1`                |
  | **Tools**              | Fail2ban for brute-force protection | `dnf install fail2ban -y`                                              |
  |                        | Lynis for security auditing         | `lynis audit system`                                                   |
  |                        | Rootkit check                       | `rkhunter --check`                                                     |
  | **Physical Security**  | Set BIOS password                   | Configure in BIOS setup                                                |
  |                        | Auto logout inactive users          | `/etc/profile` → `TMOUT=300`                                           |
  |                        | Mount /tmp with noexec              | `/etc/fstab` (add `noexec` option for `/tmp`)                          |

---

<br/>

# System Backup

- The process of copying system data and configurations so they can be restored in case of failure.
- Protects data from loss due to hardware failure, human errors, corruption, malware, or disaster.

- ## Common Backup Tools/Commands

  | Type                             | Tool                      | Purpose                                                     |
  | -------------------------------- | ------------------------- | ----------------------------------------------------------- |
  | Disk Clone / Image Backup        | **`dd`**                  | Create full disk or partition image (bit-by-bit copy).      |
  | LVM Snapshot                     | **`lvcreate --snapshot`** | Take point-in-time snapshots of LVM volumes for restore.    |
  | Storage Snapshot                 | **`stratis snapshot`**    | Create filesystem snapshots when using Stratis pool.        |
  | File Archive                     | **`tar`**                 | Manual backup of files & folders (creates `.tar` archives). |
  | Incremental Backup               | **`rsync`**               | Sync or backup data locally or over network efficiently.    |
  | Remote Copy                      | **`scp / sftp`**          | Securely copy files over SSH to another system.             |
  | System Snapshot Backup (Desktop) | **`timeshift`**           | Rollback system to earlier state (commonly on desktops).    |
  | Deduplicated Backup              | **`borgbackup / restic`** | Efficient, encrypted backups with deduplication support.    |

  ***
