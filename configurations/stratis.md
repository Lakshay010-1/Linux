# Stratis

## Stratis Structure (Simple)

- Disk(s) → Stratis Pool → Stratis Filesystem → Mount point

- | Level                  | Meaning                           | Example    |
  | ---------------------- | --------------------------------- | ---------- |
  | **Block device**       | Physical disk or device           | `/dev/sdb` |
  | **Stratis Pool**       | Logical storage pool              | `mypool`   |
  | **Stratis Filesystem** | Usable filesystem inside the pool | `myfs`     |

## Stratis Setup

| Step | Purpose                                                  | Command                                              |
| ---- | -------------------------------------------------------- | ---------------------------------------------------- |
| 1    | Identify available disk(s) to use in Stratis             | `lsblk`                                              |
| 2    | Create a Stratis storage pool                            | `stratis pool create <pool_name> <disk>`             |
| 3    | Create a filesystem within the Stratis pool              | `stratis filesystem create <pool_name> <fs_name>`    |
| 4    | Create a mount directory if not present                  | `mkdir <mount_point>`                                |
| 5    | Mount the Stratis filesystem                             | `mount /stratis/<pool_name>/<fs_name> <mount_point>` |
| 6    | Make filesystem mount persistent after reboot            | Edit `/etc/fstab`                                    |
| 7    | Validate `/etc/fstab` entry (no errors)                  | `mount -a`                                           |
| 8    | **Expand the Stratis storage pool** by adding a new disk | `stratis blockdev add <pool_name> <new_disk>`        |
