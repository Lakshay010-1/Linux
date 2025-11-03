# System Utility Commands

## 🔹 1. System Maintenance

| Command            | Syntax                               | Description                                                       | Example                                                                           |
| ------------------ | ------------------------------------ | ----------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| shutdown           | `shutdown [OPTION] [TIME] [MESSAGE]` | Shuts down or reboots the system in a safe way.                   | shutdown -h now → Halt immediately <br> shutdown -r +10 "Rebooting in 10 minutes" |
| reboot             | `reboot`                             | Reboots the system immediately. Equivalent to `shutdown -r now`.  | sudo reboot                                                                       |
| halt               | `halt`                               | Stops all processes and halts the CPU. System remains powered on. | sudo halt                                                                         |
| poweroff           | `poweroff`                           | Powers off the machine completely.                                | sudo poweroff                                                                     |
| init               | `init <runlevel>`                    | Changes the system runlevel (SysVinit systems).                   | init 0 → Halt <br> init 6 → Reboot                                                |
| systemctl poweroff | `systemctl poweroff`                 | Powers off the system (systemd-based distros).                    | sudo systemctl poweroff                                                           |
| systemctl reboot   | `systemctl reboot`                   | Reboots the system (systemd).                                     | sudo systemctl reboot                                                             |
| systemctl halt     | `systemctl halt`                     | Halts the system (systemd).                                       | sudo systemctl halt                                                               |
| systemctl isolate  | `systemctl isolate <target>`         | Switches to a specific target (like runlevels).                   | systemctl isolate rescue.target                                                   |

---

```
Runlevels are (no level 2 and 4) :
- 0 for halt(shutdown),
- 1 for single-user (rescue) mode,
- 3 for multi-user mode (no GUI)
- 5 for multi-user mode (GUI)
- 6 for reboot
```

---

## 🔹 2. Date & Time Utilities

| Command     | Syntax                  | Description                         | Example                                                                                                                                                          |
| ----------- | ----------------------- | ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| date        | `date [options]`        | Display or set system date and time | date +"`Y`-`M`-`D` `H:M:S`"                                                                                                                                      |
| cal         | `cal [month] [year]`    | Display calendar                    | cal 09 2025                                                                                                                                                      |
| uptime      | `uptime`                | Show system uptime and load average | uptime<br/> (**Output**=`Current Linux System time`, `How long systems has been running`, `No. of logged-in Users`, `Average CPU Load:1, 5 and 15 per minutes` ) |
| timedatectl | `timedatectl [options]` | Manage system time and timezones    | timedatectl set-timezone UTC<br/>timedatectl set-ntp true<br/>timedatectl list-timezones<br/>timedatectl set-time 'YYYY-MM-DD HH:MM:SS'<br/>timedatectl status   |

---

## 🔹 3. System Information Utilities

| Command   | Syntax                | Description                                                           | Example          |
| --------- | --------------------- | --------------------------------------------------------------------- | ---------------- |
| uname     | `uname -a`            | Show system/kernel info                                               | uname -r         |
| hostname  | `hostname [newname]`  | Show or set hostname                                                  | hostname server1 |
| arch      | `arch`                | Show system architecture                                              | arch             |
| which     | `which command`       | Locate the path of a command                                          | which ls         |
| whereis   | `whereis command`     | Locate binary, source, and man page                                   | whereis bash     |
| type      | `type command`        | Show how a command is interpreted                                     | type ls          |
| dmidecode | `dmidecode [options]` | Extracts low-level hardware details directly from system firmware     | dmidecode        |
| sosreport | `sosreport [options]` | Run sosreport interactively (will prompt for case ID and description) | sosreport        |

---

## 🔹 4. Scheduling Tasks Commands

- ### crontab

  - Syntax= `* [minutes(0-59)]` `* [hour(0-23)]` `* [days_of_month(1-31)]` `* [month(1-12)]` `* [days_of_week(1-7)]` \<command>

  | Command              | Syntax                   | Description                                                                         | Example                                                           |
  | -------------------- | ------------------------ | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
  | crontab -e           | `crontab -e`             | Edit the current user’s cron jobs. Opens the editor to add, modify, or delete jobs. | crontab -e → Opens editor to add 0 3 \* \* \* /usr/bin/backup.sh` |
  | crontab -l           | `crontab -l`             | List all cron jobs for the current user.                                            | crontab -l → Shows all scheduled cron jobs                        |
  | crontab -r           | `crontab -r`             | Remove all cron jobs for the current user.                                          | crontab -r → Deletes all cron jobs                                |
  | crontab -u <user> -e | `crontab -u username -e` | Edit cron jobs for a specific user (requires root).                                 | crontab -u alice -e → Edit Alice’s cron jobs                      |

- ### at

  - Daemon/Service that manages `at` command is `atd`.

  | Command         | Syntax             | Description                                                                    | Example                                                           |
  | --------------- | ------------------ | ------------------------------------------------------------------------------ | ----------------------------------------------------------------- |
  | at <time>       | `at 14:00`         | Schedule a one-time task at a specific time. Opens a prompt to enter commands. | at 14:00`→ Then type`sh /home/user/backup.sh and press Ctrl+D     |
  | at now + <time> | `at now + 2 hours` | Schedule a one-time task after a time interval.                                | echo "shutdown -h now" \| at now + 1 hour → Shutdown after 1 hour |
  | atq             | `atq`              | List all pending `at` jobs for the current user.                               | atq`→ Shows jobs like`2 Thu Sep 25 14:00:00 2025 a user           |
  | atrm <job_id>   | `atrm 2`           | Remove a specific scheduled `at` job by its job ID.                            | atrm 2 → Deletes job ID 2 from the queue                          |
  | batch           | `batch`            | Schedule commands to run when system load is low. Input commands like `at`.    | echo "sh /home/user/cleanup.sh" \| batch → Run when load is low   |

---

## 🔹 5. Math & Utility Commands

| Command | Syntax             | Description                    | Example               |
| ------- | ------------------ | ------------------------------ | --------------------- |
| bc      | `echo "5+3" \| bc` | Command-line calculator        | echo "10/4" \| bc -l  |
| expr    | `expr 5 + 3`       | Evaluate expressions           | expr length "hello"   |
| factor  | `factor number`    | Show prime factors of a number | factor 12345          |
| yes     | `yes string`       | Output a string repeatedly     | yes hello             |
| true    | `true`             | Return success (exit code 0)   | true ; echo $? # → 0  |
| false   | `false`            | Return failure (exit code 1)   | false ; echo $? # → 1 |

---
