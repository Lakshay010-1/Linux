## Important Disk Management Files/Directory(s)

| File             | Purpose                                                                                                          | Format                                                             |
| ---------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| **`/etc/fstab`** | Controls **persistent mounts** (auto-mount at boot).<br/>Used to mount partitions, LVMs, NFS shares permanently. | `<device> <mount_point> <filesystem_type> <options> <dump> <pass>` |

- | Field               | Meaning                                             | Purpose / Explanation                                                                          | Example Value                                              |
  | ------------------- | --------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
  | **device**          | Identifies **which storage** to mount               | Specifies the disk/partition/LV that will be mounted. Using UUID is recommended for stability. | `/dev/sda1`, `UUID=af12-34cd`, `/dev/mapper/vgdata-lvhome` |
  | **mount_point**     | Location in the filesystem where the device appears | Determines where the contents of the device become accessible.                                 | `/`, `/home`, `/var`, `/mnt/data`                          |
  | **filesystem_type** | The **type of filesystem** on the device            | Informs the kernel how to read and manage the data layout.                                     | `ext4`, `xfs`, `nfs`, `vfat`, `btrfs`                      |
  | **options**         | Behavior / mount configuration                      | Controls how the filesystem behaves (permissions, read/write, security, performance).          | `defaults`, `rw`, `noexec`, `nosuid`, `nodev`              |
  | **dump**            | Backup indicator for the `dump` utility             | `1` = include in dump backup; `0` = ignore. Usually set to `0`.                                | `0` or `1`                                                 |
  | **pass**            | Filesystem check order at boot (fsck)               | `1` = check root filesystem first; `2` = check other filesystems; `0` = skip fsck.             | `0`, `1`, `2`                                              |

<br/>
<br/>

| File / Directory          | Purpose                                                     | Example / Notes                                 |
| ------------------------- | ----------------------------------------------------------- | ----------------------------------------------- |
| **`/proc/mounts`**        | Kernel’s **real-time view** of mounted filesystems.         | More accurate than `/etc/mtab`.                 |
| **`/dev/`**               | Contains device files representing disks & partitions.      | `/dev/sda`, `/dev/nvme0n1`, `/dev/mapper/vg-lv` |
| **`/dev/mapper/`**        | Where **LVM Logical Volumes** appear.                       | `/dev/mapper/vgdata-lvhome`                     |
| **`/dev/mapper/`**        | Where **LVM Logical Volumes** appear.                       | `/dev/mapper/vgdata-lvhome`                     |
| **`/etc/motd`**           | Message displayed when a user logs in (Message-of-the-Day). |                                                 |
| **`/etc/samba/smb.conf`** | Defines **SMB/Samba shares** for Windows/Linux.             |                                                 |

<br/>

| Area                       | Key Files                                        |
| -------------------------- | ------------------------------------------------ |
| **Mounting & Filesystems** | `/etc/fstab`, `/proc/mounts`                     |
| **RAID**                   | `/etc/mdadm.conf`                                |
| **LVM**                    | `/etc/lvm/lvm.conf`, `/etc/lvm/{backup,archive}` |
| **Storage Device Naming**  | `/dev/mapper/`, `/dev/disk/by-uuid/`             |
| **Bootloader**             | `/etc/default/grub`, `/boot/grub2/grub.cfg`      |
| **Network Shares**         | `/etc/exports`, `/etc/samba/smb.conf`            |

---
