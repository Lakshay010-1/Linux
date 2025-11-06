# Extend LVM Storage

## **Scenario 1: VG Already Has Free Space**

| Step                     | Purpose                                           | Command                             |
| ------------------------ | ------------------------------------------------- | ----------------------------------- |
| Extend LV                | Add 5GB to the logical volume.                    | `lvextend -L +5G /dev/vgdata/lvapp` |
| Resize filesystem (EXT4) | Expand the EXT4 filesystem to use the new space.  | `resize2fs /dev/vgdata/lvapp`       |
| Resize filesystem (XFS)  | Expand the XFS filesystem (requires mount point). | `xfs_growfs /app`                   |

---

## **Scenario 2: VG Has No Free Space → Add a New Disk**

| Step                    | Purpose                                        | Command                                       |
| ----------------------- | ---------------------------------------------- | --------------------------------------------- |
| Detect new disk         | Identify new disk.                             | `lsblk`(e.g., `/dev/sdc`)                     |
| Partition disk as LVM   | Create an LVM-compatible partition.            | `fdisk /dev/sdc` → set type to `8e`           |
| Convert partition to PV | Initialize the partition as a Physical Volume. | `pvcreate /dev/sdc1`                          |
| Extend VG               | Add PV to Volume Group.                        | `vgextend vgdata /dev/sdc1`                   |
| Extend LV               | Increase LV size by 10GB.                      | `lvextend -L +10G /dev/vgdata/lvapp`          |
| Resize filesystem       | Expand filesystem to use new space.            | `resize2fs` (EXT4) or `xfs_growfs /app` (XFS) |
