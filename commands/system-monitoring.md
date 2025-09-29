# System Monitoring Commands

## 0. Overall System Monitoring

| Command                  | Syntax   | Description                                                    | Example    |
| ------------------------ | -------- | -------------------------------------------------------------- | ---------- |
| uptime                   | `uptime` | Show uptime and system load averages                           | uptime     |
| [sar](./detailed/sar.md) | `sar`    | Collect and report system activity (CPU, memory, I/O, network) | sar -q 1 3 |

---

## 1. CPU Monitoring

| Command           | Syntax              | Description                                                   | Example           |
| ----------------- | ------------------- | ------------------------------------------------------------- | ----------------- |
| uptime            | `uptime`            | Show system uptime and load average                           | uptime            |
| top               | `top`               | Real-time view of processes, CPU, and memory                  | top               |
| htop              | `htop`              | Interactive process viewer (like top but better)              | htop              |
| mpstat            | `mpstat 1`          | CPU usage per processor (requires sysstat)                    | mpstat -P ALL 1   |
| sar -u            | `sar -u 1 3`        | Historical CPU usage (from sysstat)                           | sar -u 1 5        |
| cat /proc/cpuinfo | `cat /proc/cpuinfo` | Contains detailed information about the CPU(s) on your system | cat /proc/cpuinfo |

---

## 2. Memory Monitoring

| Command           | Syntax              | Description                                                    | Example           |
| ----------------- | ------------------- | -------------------------------------------------------------- | ----------------- |
| top               | `top`               | Show real-time memory usage                                    | top               |
| htop              | `htop`              | Interactive memory usage monitoring                            | htop              |
| free              | `free -h`           | Show total, used, and free memory (RAM + swap)                 | free -h           |
| vmstat            | `vmstat 1`          | Show processes, memory, swap, I/O, system activity             | vmstat 2 5        |
| sar -r            | `sar -r 1 3`        | Memory usage statistics (requires sysstat)                     | sar -r 2 5        |
| cat /proc/meminfo | `cat /proc/meminfo` | Contains detailed information about memory (RAM + swap) usage. | cat /proc/meminfo |

---

## 3. Disk & Filesystem Monitoring

| Command | Syntax         | Description                                      | Example                 |
| ------- | -------------- | ------------------------------------------------ | ----------------------- |
| df      | `df -h`        | Show disk space usage per filesystem             | df -h                   |
| du      | `du -sh <dir>` | Show total size of a directory                   | du -sh /var/log         |
| iostat  | `iostat 1`     | CPU and I/O stats for devices (requires sysstat) | iostat -xz 1            |
| lsblk   | `lsblk`        | Show block devices and mount points              | lsblk -f                |
| mount   | `mount`        | Show mounted filesystems                         | mount \| grep /dev/sda1 |

---

## 4. Network Monitoring

| Command  | Syntax             | Description                                      | Example           |
| -------- | ------------------ | ------------------------------------------------ | ----------------- |
| ifconfig | `ifconfig`         | Show network interfaces and IP addresses         | ifconfig eth0     |
| ip addr  | `ip addr`          | Show network interfaces (modern replacement)     | ip addr show eth0 |
| ping     | `ping <host>`      | Test network connectivity                        | ping google.com   |
| ss       | `ss -tulnp`        | Show listening sockets (replacement for netstat) | ss -tulnp         |
| netstat  | `netstat -tulnp`   | Show active connections (deprecated)             | netstat -tulnp    |
| iftop    | `iftop -i <iface>` | Real-time bandwidth usage (needs install)        | iftop -i eth0     |
| nload    | `nload`            | Real-time network traffic per interface          | nload eth0        |

---

## 5. Process Monitoring

| Command | Syntax         | Description                              | Example             |
| ------- | -------------- | ---------------------------------------- | ------------------- |
| top -H  | `top -H`       | Show threads per process                 | top -H              |
| ps      | `ps aux`       | List running processes                   | ps aux \| grep sshd |
| pstree  | `pstree`       | Show processes in a tree structure       | pstree -p           |
| pidstat | `pidstat 1`    | Monitor per-process statistics (sysstat) | pidstat -u 1        |
| pgrep   | `pgrep <name>` | Find PIDs by process name                | pgrep apache2       |

---

## 6. Logs & System Activity

| Command    | Syntax              | Description                                                                                                                                                                                              | Example           |
| ---------- | ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| uptime     | `uptime`            | Show uptime and load averages                                                                                                                                                                            | uptime            |
| dmesg      | `dmesg \| less`     | Kernel ring buffer messages (hardware, drivers, boot logs)                                                                                                                                               | dmesg \| grep usb |
| journalctl | `journalctl -xe`    | View systemd logs (errors, warnings)                                                                                                                                                                     | journalctl -xe    |
| last       | `last`              | Show last login sessions                                                                                                                                                                                 | last              |
| who        | `who`               | Show who is logged in                                                                                                                                                                                    | who               |
| w          | `w`                 | Show logged-in users + activity                                                                                                                                                                          | w                 |
| history    | `history [options]` | history shows a list of commands you’ve run in your current shell session<br/>Commands are numbered so you can easily re-execute them(i.e. `!Command_Number`)<br/>History is stored in `/.bash_history`. | history           |

**`/var/log`** -> Central directory where most system and service logs are stored

### Common Log Files / Directories:

| File/Directory      | Type      | Description                                                         |
| ------------------- | --------- | ------------------------------------------------------------------- |
| `/var/log/httpd`    | Directory | Apache web server logs                                              |
| `/var/log/chronyd`  | Directory | Stores chronyd log file for monitoring system clock synchronization |
| `/var/log/messages` | File      | General system messages.                                            |
| `/var/log/secure`   | File      | Authentication logs                                                 |
| `/var/log/dmseg`    | File      | Boot & hardware logs                                                |
| `/var/log/boot.log` | File      | Boot process logs                                                   |
| `/var/log/cron`     | File      | Cron jobs logs                                                      |
| `/var/log/maillog`  | File      | Mail server logs                                                    |

---
