# Disk Management

- Disk management involves creating, viewing, formatting, and mounting partitions for data storage and system organization.

- ## systemd ( system daemon ) service manager

  - systemd is the init system and service manager for most modern Linux distributions.
  - It is the first process (PID 1) started by the Linux kernel during boot and is responsible for initializing the system, managing services, and maintaining system state.
  - Replaces older init systems such as SysVinit and Upstart.
  - Purpose : System Initialization, Service Management, Parallel Startup, State Management, Logging and Monitoring, and Session Management etc.

---

<br/>

## Concepts

- ### [Systemd Targets and Runlevels](../concepts/targets-n-runlevels.md)
- ### [Disk Management Related Components](../concepts/disk-mng-components.md)
- ### [Disk Management Important Files/Directories](../concepts/disk-mng-files-dir.md)

---

<br/>

## Boot Process

- ### [Boot Process Components](../concepts/boot-process-components.md)
- ### [Computer Boot Process](../concepts/boot-process-computer.md)
- ### [Linux Boot Process](../concepts/boot-process-linux.md)

---

<br/>

## Configuration

- ### [Mounting Partition](../configurations/partition-standard-mount.md)
- ### [Mounting LVM-Partition](../configurations/partition-lvm-mount.md)
- ### [Extend LVM-Partition Storage](../configurations/partition-lvm-extend.md)
- ### [Swap Space](../configurations/swap-space.md)
- ### [Stratis Storage](../configurations/stratis.md)
- ### [NAS Setup](../configurations/nas-setup.md)
- ### [Database Setup](../configurations/database-setup.md)

---

<br/>
<br/>

## Commands

### 1. Runlevels / Systemd Targets

| Mode       | Purpose                       | Command                                 |
| ---------- | ----------------------------- | --------------------------------------- |
| `Runlevel` | Boot with specified run level | init \<runlevel>                        |
| `Target`   | Boot with specified target    | systemctl isolate/set-default \<target> |

<br/>

### 2. Boot Performance

| Command                          | Purpose                     |
| -------------------------------- | --------------------------- |
| `systemd-analyze [options]`      | To measure boot performance |
| `systemd-analyze blame`          | List slow services          |
| `systemd-analyze critical-chain` | Show boot dependency delays |

<br/>

### 3. Disk & Device Identification

| Command                           | Purpose                                                                 | Example                                                                                                                                         |
| --------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `dd if=<src> of=<dest> [options]` | Clone disks, backup images, wipe drives, write ISOs.                    | `dd if=/dev/sda of=/backup.img bs=10M count=4000`<br/> (bs=Block size, Larger block size = faster copy and<br/> count=Number of blocks to copy) |
| `lsblk`                           | List all disks and partitions in the system.                            | `lsblk`                                                                                                                                         |
| `fdisk [options]`                 | create, view, delete, or modify disk partitions on **MBR**-based disks. | `fdisk /dev/sda`                                                                                                                                |
| `gdisk [options]`                 | Create or modify partitions on **GPT** disks.                           | `gdisk /dev/sdb`                                                                                                                                |
| `cfdisk`                          | Partition disks using an easy menu-based UI.                            | `cfdisk /dev/sdc`                                                                                                                               |
| `parted`                          | Create, resize, and manage partitions.                                  | `parted /dev/sda`                                                                                                                               |
| `partprobe`                       | Refresh kernel partition table without reboot.                          | `partprobe`                                                                                                                                     |
| `blkid`                           | Display filesystem UUIDs and labels.                                    | `blkid`                                                                                                                                         |
| `dmesg \| grep sd`                | View kernel messages about new disks.                                   | `dmesg \| grep sd`                                                                                                                              |
| `lsmem`                           | Displays memory block layout and total available memory.                | `lsmem`                                                                                                                                         |

<br/>

### 4. Mount / Unmount & Storage Usage

| Command                           | Purpose                             | Example                |
| --------------------------------- | ----------------------------------- | ---------------------- |
| `mount \<device> \<mount-point> ` | Attach (mount) a filesystem.        | `mount /dev/sda1 /mnt` |
| `umount \<mount-point>`           | Detach (unmount) a filesystem.      | `umount /mnt`          |
| `df [options]`                    | Show mounted filesystems and space. | `df -h`                |
| `du [options]`                    | Show disk usage of directory.       | `du -sh /var/log`      |

<br/>

### 5. Filesystem Creation & Maintenance

| Command            | Purpose                                  | Example                |
| ------------------ | ---------------------------------------- | ---------------------- |
| `mkfs`             | General command to create filesystems.   | `mkfs.ext4 /dev/sda1`  |
| `mkfs.xfs`         | Format partition as XFS filesystem.      | `mkfs.xfs /dev/sdb1`   |
| `xfs_info`         | Display XFS filesystem metadata.         | `xfs_info /data`       |
| `e2fsck` (or fsck) | Check/repair ext2/ext3/ext4 filesystems. | `e2fsck /dev/sda1`     |
| `xfs_repair`       | Repair XFS filesystem.                   | `xfs_repair /dev/sdb1` |
| `resize2fs`        | Extend/Shrink ext-based filesystems.     | `resize2fs /dev/sda1`  |
| `xfs_growfs`       | Extend XFS filesystem size.              | `xfs_growfs /data`     |

<br/>

### 6. LVM Management

| Step      | Command                     | Purpose                      | Example                                                                                                                                                                  |
| --------- | --------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Create PV | `pvcreate`                  | Initialize disk for LVM use. | `pvcreate /dev/sdb1`                                                                                                                                                     |
| Create VG | `vgcreate`                  | Create a Volume Group (VG).  | `vgcreate vgdata /dev/sdb1`                                                                                                                                              |
| Create LV | `lvcreate`                  | Create Logical Volume (LV).  | `lvcreate -L 10G -n lvdata vgdata`<br/>(-n <name>=Name of the Logical Volume,<br/>-L <size>=Create LV with fixed size and<br/>-l <PE size>=Create LV using % or extents) |
| Extend LV | `lvextend`                  | Extend size of LV.           | `lvextend -L +5G /dev/vgdata/lvdata`                                                                                                                                     |
| Extend FS | `resize2fs` or `xfs_growfs` | Expand filesystem            | `xfs_growfs /data`                                                                                                                                                       |
|           | `pvs`                       | Show PV(s) info              | `pvs`                                                                                                                                                                    |
|           | `vgs`                       | Show VG(s) info              | `vgs`                                                                                                                                                                    |
|           | `lvs`                       | Show LV(s) info              | `lvs`                                                                                                                                                                    |
|           | `pvdisplay`                 | Detailed PV(s) info          | `pvdisplay`                                                                                                                                                              |
|           | `vgdisplay`                 | Detailed VG(s) info          | `vgdisplay`                                                                                                                                                              |
|           | `lvdisplay`                 | Detailed LV(s) info          | `lvdisplay`                                                                                                                                                              |

<br/>

### 7. Swap Space Management

| Command   | Purpose                   | Example                                      |
| --------- | ------------------------- | -------------------------------------------- |
| `mkswap`  | Prepare swap area.        | `mkswap /dev/sda2`                           |
| `dd`      | Create a swap file.       | `dd if=/dev/zero of=/swapfile bs=1G count=2` |
| `swapon`  | Enable swap space.        | `swapon /dev/sda2`                           |
| `swapoff` | Disable swap space.       | `swapoff /dev/sda2`                          |
| `free -h` | Show memory & swap usage. | `free -h`                                    |

<br/>

### 8. Stratis (Modern LVM-like Storage)

| Step | Command                                              | Purpose                                                                                 | Example                                 |
| ---- | ---------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------- |
|      | `stratis`                                            | Manage pools & filesystems.                                                             | `stratis pool list`                     |
|      | `stratis pool/filesystem/blockdev list`              | Show existing Stratis pools<br/>List Stratis filesystems<br/>Show disks used by Stratis | `stratis pool list`                     |
| 1    | `lsblk`                                              | Identify available disk(s) to use in Stratis                                            | `lsblk`                                 |
| 2    | `stratis pool create <pool_name> <disk>`             | Create a Stratis storage pool                                                           | `stratis pool create mypool /dev/sdb`   |
| 3    | `stratis filesystem create <pool_name> <fs_name>`    | Create a filesystem within the Stratis pool                                             | `stratis filesystem create mypool myfs` |
| 4    | `mkdir <mount_point>`                                | Create a mount directory if not present                                                 | `mkdir /mnt`                            |
| 5    | `mount /stratis/<pool_name>/<fs_name> <mount_point>` | Mount the Stratis filesystem                                                            | `mount /stratis/mypool/myfs /mnt`       |
| 6    | Edit `/etc/fstab`                                    | Make filesystem mount persistent after reboot                                           | `UUID=<uuid> /mnt xfs defaults 0 0`     |
| 7    | `mount -a`                                           | Validate `/etc/fstab` entry (no errors)                                                 | `mount -a`                              |
| 8    | `stratis blockdev add <pool_name> <new_disk>`        | **Expand the Stratis storage pool** by adding a new disk                                | `stratis blockdev add mypool /dev/sdc`  |

---
