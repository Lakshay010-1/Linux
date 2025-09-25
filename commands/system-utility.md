# System Utility Commands

## 🔹 1. Date & Time Utilities

| Command     | Syntax                  | Description                         | Example                                                                                                                                                          |
| ----------- | ----------------------- | ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| date        | `date [options]`        | Display or set system date and time | date +"`Y`-`M`-`D` `H:M:S`"                                                                                                                                      |
| cal         | `cal [month] [year]`    | Display calendar                    | cal 09 2025                                                                                                                                                      |
| uptime      | `uptime`                | Show system uptime and load average | uptime<br/> (**Output**=`Current Linux System time`, `How long systems has been running`, `No. of logged-in Users`, `Average CPU Load:1, 5 and 15 per minutes` ) |
| timedatectl | `timedatectl [options]` | Manage system time and timezones    | timedatectl set-timezone UTC                                                                                                                                     |

---

## 🔹 2. System Information Utilities

| Command  | Syntax               | Description                         | Example          |
| -------- | -------------------- | ----------------------------------- | ---------------- |
| uname    | `uname -a`           | Show system/kernel info             | uname -r         |
| hostname | `hostname [newname]` | Show or set hostname                | hostname server1 |
| arch     | `arch`               | Show system architecture            | arch             |
| which    | `which command`      | Locate the path of a command        | which ls         |
| whereis  | `whereis command`    | Locate binary, source, and man page | whereis bash     |
| type     | `type command`       | Show how a command is interpreted   | type ls          |

---

## 🔹 3. Math & Utility Commands

| Command | Syntax             | Description                    | Example               |
| ------- | ------------------ | ------------------------------ | --------------------- |
| bc      | `echo "5+3" \| bc` | Command-line calculator        | echo "10/4" \| bc -l  |
| expr    | `expr 5 + 3`       | Evaluate expressions           | expr length "hello"   |
| factor  | `factor number`    | Show prime factors of a number | factor 12345          |
| yes     | `yes string`       | Output a string repeatedly     | yes hello             |
| true    | `true`             | Return success (exit code 0)   | true ; echo $? # → 0  |
| false   | `false`            | Return failure (exit code 1)   | false ; echo $? # → 1 |

---
