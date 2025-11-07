# Disk Management Related Components

| Component                                     | Nature                                                 | Purpose                                                       |
| --------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------- |
| **`Physical Disk`**                           | The actual hardware storage device (HDD / SSD / NVMe). | Base storage layer where data physically resides.             |
| **`Partition`**                               | A divided section of a disk (e.g., /dev/sda1).         | Organizes disk into logical segments for use.                 |
| **`MBR / GPT`**                               | Partition table formats (MBR = legacy, GPT = modern).  | Defines how partitions are structured and recognized.         |
| **`Filesystem`** _(ext4, XFS, Btrfs, etc.)_   | Method for organizing files on a partition.            | Enables OS to read/write/manage files and directories.        |
| **`Swap Space`**                              | Disk area used when RAM becomes full.                  | Prevents system crashes due to memory exhaustion.             |
| **`LVM (Logical Volume Manager)`**            | Flexible layer for storage management.                 | Allows resizing, combining, and managing storage dynamically. |
| **`PV (Physical Volume)`**                    | A disk/partition prepared for LVM.                     | Acts as the base layer for LVM storage allocation.            |
| **`VG (Volume Group)`**                       | Storage pool made of one or more PVs.                  | Groups storage into a common pool for flexibility.            |
| **`LV (Logical Volume)`**                     | Resizable logical "partition" inside a VG.             | Mountable filesystem that applications and OS use.            |
| **`Stratis`**                                 | Modern Linux storage manager using pools + XFS.        | Simplifies storage management (LVM-like but easier).          |
| **`RAID`** _(software via mdadm or hardware)_ | Redundant disk array configuration.                    | Improves performance and/or provides disk failure tolerance.  |
| **`mdadm`**                                   | Linux utility to create/manage software RAID.          | Manages RAID levels (0/1/5/6/10).                             |
| **`NFS`**                                     | Network File System for Linux-to-Linux sharing.        | Allows shared directories across systems in a network.        |
| **`SMB / Samba`**                             | Windows-like file sharing protocol.                    | Enables folder sharing between Linux ↔ Windows systems.       |
| **`iSCSI`**                                   | Block storage served over an IP network.               | Used in SAN environments for remote block devices.            |
| **`/etc/fstab`**                              | Persistent filesystem mount configuration file.        | Ensures storage auto-mounts at boot.                          |
| **`systemd-udev`**                            | Device detection & naming subsystem.                   | Handles dynamic device creation (e.g., `/dev/sdX`).           |
| **`systemd-mount / automount`**               | System-managed mounting mechanism.                     | Automatically mounts devices when accessed.                   |
| **`systemd (targets)`**                       | Controls the system boot state (CLI / GUI).            | Indirectly determines when/which storage mounts occur.        |
