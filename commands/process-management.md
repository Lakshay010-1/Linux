# Process, Job, and Service Commands

```
Process :
A running instance of a program with a PID(Process Id).

Job :
A shell-managed process(or group of processes) in terminal session.

Service :
A background process managed by the system, usually starts at boot.

Daemon :
A special type of service process that runs continuously, often ending in 'd'.

Application :
A program designed for the user or system tasks.

Script :
A file with commands executed by an interpreter.

Threads :
A lightweight execution unit inside a process.
```

```
Process States
R --> Running ( or Runnable )
S --> Sleeping ( Waiting for event )
D --> Uninterruptible Sleep
T --> Stopped ( Suspended )
Z --> Zombie ( finished but still in process table )
```

## 🔹Process Management Commands

| Command | Syntax                       | Description                                                                | Example                  |
| ------- | ---------------------------- | -------------------------------------------------------------------------- | ------------------------ |
| ps      | `ps -e`                      | Show all running processes                                                 | ps -e                    |
| ps      | `ps aux`                     | Show all running processes in BSD format                                   | ps aux                   |
| ps      | `ps -ef`                     | Show all running processes in full format listing                          | ps -ef                   |
| ps      | `ps -u [username]`           | Show all processes by username                                             | ps -u lakshayg           |
| top     | `top`                        | Real-time view of processes and resource usage (Refreshes every 3 seconds) | top                      |
| top     | `top -u [username]`          | Real-time view of processes and resource usage by user                     | top -u [username]        |
| top     | `top then press c`           | show commands absolute path                                                | top, press c             |
| top     | `top then press k`           | kill a process by pid within top session                                   | top, press k             |
| top     | `top then press m and p`     | Sort processes by memory usage                                             | top, press m and p       |
| htop    | `htop`                       | Interactive process viewer (scrollable)                                    | htop                     |
| kill    | `kill [signal] <PID>`        | Terminate a process by PID                                                 | kill 1234                |
| killall | `killall <name>`             | Kill process by name                                                       | killall firefox          |
| pkill   | `pkill <pattern>`            | Kill process by pattern                                                    | pkill -u user1           |
| nice    | `nice -n <value> <command>`  | Start process with priority (-20 high, 19 low)                             | nice -n 10 gzip file.tar |
| renice  | `renice <priority> -p <PID>` | Change priority of a running process                                       | renice 5 -p 1234         |
| pstree  | `pstree`                     | Show processes in tree format                                              | pstree -p                |
| pgrep   | `pgrep <name>`               | Find PIDs by process name                                                  | pgrep apache2            |

---

## 🔹Job Control Commands

| Command   | Syntax                        | Description                                             | Example                      |
| --------- | ----------------------------- | ------------------------------------------------------- | ---------------------------- |
| jobs      | `jobs`                        | List background jobs in shell                           | jobs                         |
| bg        | `bg %<job>`                   | Resume suspended job in background                      | bg %1                        |
| command & | `<command> &`                 | Run process in background                               | sleep 100 &                  |
| fg        | `fg %<job>`                   | Bring background job to foreground                      | fg %1                        |
| disown    | `disown %<job>`               | Detach job from shell (survive logout)                  | disown %1                    |
| nohup     | `nohup command [arguments] &` | Runs in background and ignores SIGHUP (survives logout) | nohup /home/user/backup.sh & |
|           |

---

## 🔹Service Management Commands (systemd)

| Command                   | Syntax                                     | Description                  | Example                                  |
| ------------------------- | ------------------------------------------ | ---------------------------- | ---------------------------------------- |
| systemctl start           | `systemctl start <service>`                | Start a service              | systemctl start nginx                    |
| systemctl stop            | `systemctl stop <service>`                 | Stop a service               | systemctl stop nginx                     |
| systemctl restart         | `systemctl restart <service>`              | Restart a service            | systemctl restart nginx                  |
| systemctl reload          | `systemctl reload <service>`               | Reload service configuration | systemctl reload sshd                    |
| systemctl status          | `systemctl status <service>`               | Show service status          | systemctl status firewalld               |
| systemctl enable          | `systemctl enable <service>`               | Enable service at boot       | systemctl enable chronyd                 |
| systemctl disable         | `systemctl disable <service>`              | Disable service at boot      | systemctl disable httpd                  |
| systemctl is-active       | `systemctl is-active <service>`            | Check if service is active   | systemctl is-active nginx                |
| systemctl list-units      | `systemctl list-units --type=service`      | Show running services        | systemctl list-units --type=service      |
| systemctl list-unit-files | `systemctl list-unit-files --type=service` | Show all installed services  | systemctl list-unit-files --type=service |

- To add a service under systemctl management:<br/>
  Create a file in `etc/systemd/system/servicename.service`

---
