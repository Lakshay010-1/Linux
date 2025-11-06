# Swap Space

- Swap space acts as virtual memory on disk.
- If RAM becomes full, Linux temporarily moves inactive data to swap → preventing crashes.

---

<br/>

# Configuration

## **Method 1: Create Swap as a Partition**

| Step | Purpose                                  | Command / Action                                             |
| ---- | ---------------------------------------- | ------------------------------------------------------------ |
| 1    | Identify available disks and partitions. | `lsblk`                                                      |
| 2    | Change partition type to Linux Swap      | `fdisk /dev/sdb → t → type 82 → w`                           |
| 3    | Format the partition as swap space.      | `mkswap /dev/sdb2`                                           |
| 4    | Enable the swap immediately.             | `swapon /dev/sdb2`                                           |
| 5    | Make swap persistent across reboots.     | Add to `/etc/fstab`: <br> `/dev/sdb2 swap swap defaults 0 0` |
| 6    | Verify swap is active.                   | `free -h` or `swapon --show`                                 |

<br/>

## **Method 2: Create Swap from a File (Recommended / Flexible)**

| Step | Purpose                                     | Command / Action                                             |
| ---- | ------------------------------------------- | ------------------------------------------------------------ |
| 1    | Create the swap file                        | `dd if=/dev/zero of=/swapfile bs=1G count=4`                 |
| 2    | Secure file to prevent unauthorized access. | `chmod 600 /swapfile`                                        |
| 3    | Convert file to swap space                  | `mkswap /swapfile`                                           |
| 4    | Enable the swap immediately.                | `swapon /swapfile`                                           |
| 5    | Make swap persistent across reboots.        | Add to `/etc/fstab`: <br> `/swapfile swap swap defaults 0 0` |
| 6    | Verify active swap space.                   | `swapon --show` or `free -h`                                 |
