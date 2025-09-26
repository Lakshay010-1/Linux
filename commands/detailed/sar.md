# **`sar`** (System Activity Reporter)

- Collects, reports, and saves system performance data.
- Useful for CPU, memory, I/O, network, and system activity monitoring.
- Can be used in real-time or to view historical performance logs.

## Syntax

```
sar [options] [interval] [count]
  - interval → seconds between samples
  - count → number of samples to collect
```

## 🔹sar Monitoring Commands (from sysstat package)

| Command         | Syntax                               | Description                                | Example                 |
| --------------- | ------------------------------------ | ------------------------------------------ | ----------------------- |
| sar             | `sar`                                | Show CPU usage summary since system boot   | sar                     |
| sar 5 5         | `sar 5 5`                            | Show CPU usage every 5 seconds, 5 times    | sar 5 5                 |
| sar -u          | `sar -u [interval] [count]`          | CPU usage (%user, %system, %idle, etc.)    | sar -u 2 3              |
| sar -r          | `sar -r [interval] [count]`          | Memory usage (used, free, available)       | sar -r 1 5              |
| sar -q          | `sar -q [interval] [count]`          | Run queue and load average                 | sar -q 2 4              |
| sar -n DEV      | `sar -n DEV [interval] [count]`      | Network device statistics                  | sar -n DEV 2 5          |
| sar -n TCP,ETCP | `sar -n TCP,ETCP [interval] [count]` | TCP/UDP statistics                         | sar -n TCP,ETCP 1 3     |
| sar -b          | `sar -b [interval] [count]`          | I/O and transfer rate statistics           | sar -b 1 5              |
| sar -d          | `sar -d [interval] [count]`          | Per-device disk activity                   | sar -d 2 3              |
| sar -f          | `sar -f /var/log/sa/saXX`            | View historical data (`XX` = day of month) | sar -f /var/log/sa/sa26 |
