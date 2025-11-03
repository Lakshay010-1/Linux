# Network Interface Configuration Files

| File/Directory                                          | Description                                                                                                                   |
| ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `/etc/nsswitch.conf`                                    | Defines order of lookup for system databases (users, hosts, groups, etc.)                                                     |
| `/etc/resolv.conf`                                      | DNS resolver configuration (sometimes managed by NetworkManager)                                                              |
| `/etc/hosts`                                            | Static hostname-to-IP mappings                                                                                                |
| `/etc/hostname`                                         | Stores the system hostname                                                                                                    |
| `/etc/sysconfig/network`                                | Enables networking and sets default gateway or hostname                                                                       |
| `/etc/sysconfig/network-scripts/ifcfg-<interface-name>` | Each interface has its own file.                                                                                              |
| `/etc/NetworkManager/system/connections/`               | List saved connections and Interfaces,</br>Bring up and Edit Connections<br/>(Configuration is stored as .nmconnection files) |

---

<br/>
<br/>

# Networking Commands

## 1️. View Network Interfaces & IPs

| Command                | Purpose                                                                                                       | Example / Notes                              |
| ---------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| [ip](./detailed/ip.md) | Used to view, configure, and manage network interfaces, routing, tunnels, IP addresses, ARP entries, and more | ip addr show eth0                            |
| `ip addr show or ip a` | List all network interfaces and IP addresses                                                                  | Shows IPv4, IPv6, and interface status       |
| `ip link show`         | Show interface names and their state                                                                          | Displays UP/DOWN, MAC addresses              |
| `ifconfig -a`          | Legacy command to show interfaces                                                                             | Not installed by default on modern distros   |
| `nmcli device status`  | Show NetworkManager-managed interfaces                                                                        | Displays interface type and connection state |

---

## 2️. Check Connectivity

| Command                          | Purpose                                       | Example                      |
| -------------------------------- | --------------------------------------------- | ---------------------------- |
| `ping <host>`                    | Test connectivity to host/IP                  | ping -c 4 8.8.8.8            |
| `ping6 <host>`                   | Test IPv6 connectivity                        |                              |
| `traceroute <host>`              | Show the route packets take                   | traceroute google.com        |
| `mtr <host>`                     | Combined ping & traceroute                    | mtr 8.8.8.8                  |
| `curl <url>`                     | Test HTTP/HTTPS connectivity                  | curl -I https://google.com   |
| `wget <url>`                     | Download file from network                    | wget http://example.com/file |
| `ethtool <interface>`            | Check interface hardware info and link status |                              |
| `iwconfig`                       | Check Wi-Fi interface status                  |                              |
| `nmcli con up/down <connection>` | Bring NetworkManager connections up/down      |                              |

---

## 3️. View Routing & Gateways

| Command             | Purpose                                     | Example                                  |
| ------------------- | ------------------------------------------- | ---------------------------------------- |
| `ip route`          | Show routing table and default gateway      | ip route show                            |
| `route -n`          | Legacy routing table view                   | Shows numeric IPs without DNS resolution |
| `ip route get <ip>` | Show which interface & gateway will be used | ip route get 8.8.8.8                     |

---

## 4️. DNS / Name Resolution

| Command                | Purpose                                                                   | Example             |
| ---------------------- | ------------------------------------------------------------------------- | ------------------- |
| `nslookup <host>`      | Query DNS servers used to resolve hostnames to IPs and vice versa         | nslookup google.com |
| `dig <host>`           | Advanced DNS query, used to test and troubleshoot DNS servers and records | dig google.com      |
| `host <host>`          | Simple DNS lookup                                                         | host google.com     |
| `cat /etc/resolv.conf` | View DNS servers                                                          | nameserver 8.8.8.8  |

---

## 5️. Network Connections & Listening Ports

| Command                  | Purpose                                                                           | Example                |
| ------------------------ | --------------------------------------------------------------------------------- | ---------------------- |
| [ss](./detailed/ss.md)   | Socket Statistics.<br/>It is a network utility used to display information about. | ss [options] [filter]  |
| `ss -tuln`               | Show listening TCP/UDP ports                                                      | ss -tuln               |
| `netstat -tulnp`         | Legacy command to show connections and processes                                  | netstat -tulnp         |
| `lsof -i`                | Show open network connections                                                     | lsof -i :22            |
| `tcpdump -i <interface>` | Capture network traffic                                                           | sudo tcpdump -i enp0s3 |

---
