# NAS (Network Attached Storage)

## **`NAS Device`**

- NAS (Network Attached Storage) is a dedicated storage server/device connected to the network, allowing multiple clients to store and share files.

---

<br/>

## **`File-Sharing Protocols`**

## 1. NFS (Network File System)

- Allows files/folders to be shared over the network so that remote systems can access them as if they were local directories.
- Enables centralized storage: multiple Linux clients can use the same shared directory

### NFS Architecture (Brief)

- NFS Server → Exports (shares) directories
- NFS Client → Mounts those directories

### NFS Configuration

- ### **NFS Server**

  | Step | Command                                                                   | Purpose                                   |
  | ---- | ------------------------------------------------------------------------- | ----------------------------------------- |
  | 1    | `dnf install nfs-utils -y`                                                | Install NFS server package                |
  | 2    | `mkdir -p /data/share`                                                    | Create a directory to share               |
  | 3    | `chmod 777 /data/share`                                                   | Set permissions for shared access         |
  | 4    | Edit `/etc/exports` and add: <br> `/data/share *(rw,sync,no_root_squash)` | Define directory share and permissions    |
  | 5    | `exportfs -r`                                                             | Apply/refresh export configuration        |
  | 6    | `systemctl enable --now nfs-server`                                       | Start and enable NFS service              |
  | 7    | `exportfs -v`                                                             | Verify shared directories and permissions |

  ***

- ### **NFS Client**

  | Step | Command                                       | Purpose                         |
  | ---- | --------------------------------------------- | ------------------------------- |
  | 1    | `dnf install nfs-utils -y`                    | Install NFS client tools        |
  | 2    | `mkdir /mnt/nfsshare`                         | Create local mount directory    |
  | 3    | `mount <server_ip>:/data/share /mnt/nfsshare` | Mount the shared folder         |
  | 4    | `df -h`                                       | Verify that mount is successful |

---

<br/>

## 2. Samba

- Service that allows file and printer sharing between Linux and Windows systems.
- Enables Linux to share folders so Windows can access them, and vice-versa.

### Samba Architecture (Brief)

- `Linux Server (Samba)`
  <-->
  `SMB (Server Message Block) / CIFS (Common Internet File System) Protocol`
  <-->
  `Windows / Linux Clients`

### Samba Configuration

- ### **Samba Server**

  | Step | Command                                                                                                                                                                      | Purpose                                      |
  | ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
  | 1    | `yum install samba -y` **or** `apt install samba -y`                                                                                                                         | Install Samba server package                 |
  | 2    | `mkdir -p /data/sambashare`                                                                                                                                                  | Create shared directory                      |
  | 3    | `chmod 777 /data/sambashare`<br/>`chown -R nobody:nobody /data/sambashare`                                                                                                   | Set full permissions (optional / demo setup) |
  | 4    | Edit config file: `/etc/samba/smb.conf` <br> Add: <br> [share] <br> path = /data/sambashare <br> browsable = yes <br> writable = yes <br> guest ok = yes <br> read only = no | Define Samba share settings                  |
  | 5    | `systemctl enable --now smb nmb`                                                                                                                                             | Start and enable Samba services              |
  | 6    | `firewall-cmd --add-service=samba --permanent && firewall-cmd --reload`                                                                                                      | Allow Samba through firewall (RHEL-based)    |
  | 7    | **Create Samba user account** <br> `useradd sambauser` <br> `smbpasswd -a sambauser`                                                                                         | Create and enable Samba login user           |
  | 8    | `testparm`                                                                                                                                                                   | Validate Samba configuration syntax          |

  ***

- ### **Samba Client (Linux)**

  | Step | Command                                                                   | Purpose                  |
  | ---- | ------------------------------------------------------------------------- | ------------------------ |
  | 1    | `yum install samba-client -y` **or** `apt install cifs-utils -y`          | Install SMB client tools |
  | 2    | `mkdir /mnt/sambashare`                                                   | Create mount directory   |
  | 3    | `mount -t cifs //<server_ip>/share /mnt/sambashare -o username=sambauser` | Mount Samba share        |
  | 4    | `df -h`                                                                   | Verify mounted share     |

  ***
