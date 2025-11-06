# Creating LVM Partition from new disk (format & mount)

| Step  | Purpose                                                  | Command / Action                                                                         |
| ----- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| **1** | Identify the new disk.                                   | `lsblk`                                                                                  |
| **2** | Create LVM-compatible partition `/dev/sdb1`.             | `fdisk /dev/sdb` <br/> use `n` (new), `t` (set type to **8e** for LVM), then `w` (write) |
| **3** | Convert the partition into a Physical Volume (PV).       | `pvcreate /dev/sdb1`                                                                     |
| **4** | Create a Volume Group (VG) named `vgdata`.               | `vgcreate vgdata /dev/sdb1`                                                              |
| **5** | Create a Logical Volume (LV) named `lvapp` of size 10GB. | `lvcreate -L 10G -n lvapp vgdata`                                                        |
| **6** | Create a filesystem on the LV.                           | `mkfs.ext4 /dev/vgdata/lvapp`                                                            |
| **7** | Create mount point directory.                            | `mkdir /app`                                                                             |
| **8** | Mount the logical volume.                                | `mount /dev/vgdata/lvapp /app`                                                           |
| **9** | Make mount persistent after reboot.                      | Add entry to `/etc/fstab`                                                                |
