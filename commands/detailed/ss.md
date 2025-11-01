# `ss` Command

- ### `ss [options] [filter]`
- ss — Socket Statistics
- Displaying detailed information about network sockets (TCP, UDP, Unix, etc.)

## ss Commands

| Category                   | Command / Option       | Description                                           | Example                               |
| -------------------------- | ---------------------- | ----------------------------------------------------- | ------------------------------------- |
| **General Information**    | `ss -a`                | Show all sockets (listening + non-listening)          | `ss -a`                               |
|                            | `ss -l`                | Show listening sockets only                           | `ss -l`                               |
|                            | `ss -t`                | Show TCP connections only                             | `ss -t`                               |
|                            | `ss -u`                | Show UDP sockets only                                 | `ss -u`                               |
|                            | `ss -n`                | Show numerical addresses (no DNS resolution)          | `ss -tn`                              |
| **Statistics / Info**      | `ss -s`                | Display socket summary statistics (like `netstat -s`) | `ss -s`                               |
|                            | `ss -i`                | Show internal TCP details (timers, retransmits, etc.) | `ss -ti`                              |
| **Performance / Advanced** | `ss -m`                | Show memory usage per socket                          | `ss -m`                               |
|                            | `ss -4`                | Show only IPv4 sockets                                | `ss -4 -tuna`                         |
|                            | `ss -6`                | Show only IPv6 sockets                                | `ss -6 -tuna`                         |
| **Combined Filters**       | `ss -tuln`             | Show listening TCP/UDP sockets (no DNS)               | `ss -tuln`                            |
|                            | `ss -tuna`             | Show all TCP & UDP connections (no DNS)               | `ss -tuna`                            |
| **Show Process Info**      | `ss -tulpn`            | List listening ports with process & PID info          | `ss -tulpn`                           |
| **State Filters**          | `ss state established` | Show only established connections                     | `ss -t state established`             |
|                            | `ss state listening`   | Show only listening sockets                           | `ss -t state listening`               |
| **Filter by Port/IP**      | `ss dport = :80`       | Filter by destination port                            | `ss -t state established dport = :80` |
|                            | `ss src 10.0.0.1`      | Show connections from a specific source IP            | `ss src 10.0.0.1`                     |
