# Creating Partition from new disk (format & mount)

| Step No. | Action                                         | Command / Explanation                                                                                                                                             |
| -------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1**    | Identify the new disk                          | `lsblk` or `fdisk -l` <br/> Find the new device (e.g., `/dev/sdb`).                                                                                               |
| **2**    | Open disk in partition tool                    | `fdisk /dev/sdb`                                                                                                                                                  |
| **3**    | Create a new partition                         | Inside fdisk: <br> `n` → new partition <br> `p` → primary <br> `1` → partition number <br> Press _Enter_ to accept default start & end sectors (or specify size). |
| **4**    | Save changes and exit                          | In fdisk: `w`                                                                                                                                                     |
| **5**    | Verify partition creation                      | `lsblk` or `fdisk -l`<br/> You should now see `/dev/sdb1`.                                                                                                        |
| **6**    | Format the new partition                       | `mkfs.ext4 /dev/sdb1`                                                                                                                                             |
| **7**    | Create a mount point directory                 | `mkdir /data`                                                                                                                                                     |
| **8**    | Mount the partition                            | `mount /dev/sdb1 /data`                                                                                                                                           |
| **9**    | Verify mount                                   | `df -h` or `mount`                                                                                                                                                |
| **10**   | Make the mount persistent (Permanent Mounting) | Run: `blkid` → copy UUID <br> Edit: `nano /etc/fstab` <br> Add the line:<br> `UUID=<paste-UUID-here> /data ext4 defaults 0 0`                                     |
| **11**   | Test fstab entry                               | `mount -a` (Should return no errors)                                                                                                                              |
