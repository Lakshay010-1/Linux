# `ip` command

- ### `ip` is used to view, configure, and manage network interfaces, routing, tunnels, IP addresses, ARP entries, and more. <br/>
- ### It replaces older tools like ifconfig, route, and netstat, and is part of the iproute2 suite.

---

## `ip` Commands

# 🌐 Essential `ip` Command Reference (Simplified)

| Category                       | Command / Option                      | Description                          | Example                                  |
| ------------------------------ | ------------------------------------- | ------------------------------------ | ---------------------------------------- |
| **Show IP Addresses**          | `ip addr show` / `ip a`               | Show all IP addresses                | ip addr show                             |
|                                | `ip addr show dev <iface>`            | Show IPs for one interface           | ip addr show dev eth0                    |
| **Show Only IPv6**             | `ip -6 addr show`                     | Display IPv6 addresses               | ip -6 addr show                          |
| **Show Interfaces**            | `ip link show`                        | List all network interfaces          | ip link show                             |
|                                | `ip -br link`                         | Brief (one-line) interface summary   | ip -br link                              |
| **Show Routes(Routing Table)** | `ip route show` / `ip r`              | Display routing table                | ip route show                            |
| **Show Statistics**            | `ip -s link`                          | Interface stats (RX/TX, errors)      | ip -s link                               |
| **ARP (Neighbor) Table**       | `ip neigh show` / `ip n`              | Display ARP cache                    | ip neigh show                            |
| **Manage Interfaces**          | `ip link set <iface> up`              | Bring interface up                   | ip link set eth0 up                      |
|                                | `ip link set <iface> down`            | Bring interface down                 | ip link set eth0 down                    |
|                                | `ip link set <iface> mtu <size>`      | Change MTU (packet size)             | ip link set eth0 mtu 1400                |
| **Add / Remove IP Addresses**  | `ip addr add <ip>/<mask> dev <iface>` | Assign IP address                    | ip addr add 192.168.1.10/24 dev eth0     |
|                                | `ip addr del <ip>/<mask> dev <iface>` | Remove IP address                    | ip addr del 192.168.1.10/24 dev eth0     |
| **Manage Routes**              | `ip route add <net>/<mask> via <gw>`  | Add static route                     | ip route add 10.0.0.0/24 via 192.168.1.1 |
|                                | `ip route del <net>/<mask>`           | Delete route                         | ip route del 10.0.0.0/24                 |
|                                | `ip route replace default via <gw>`   | Change default gateway               | ip route replace default via 192.168.1.1 |
| **Monitor Changes**            | `ip monitor all`                      | Live view of IP, link, route changes | ip monitor all                           |
| **Quick Summary View**         | `ip -br addr`                         | Compact view (like ifconfig)         | ip -br addr                              |
| **Flush Configuration**        | `ip addr flush dev <iface>`           | Remove all IPs from interface        | ip addr flush dev eth0                   |

---
