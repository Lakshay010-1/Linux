# rsyslog (Reliable System Logging Daemon)

- It collects, processes, and stores system logs (from kernel, services, and applications).
- It can also send logs to or receive logs from other systems — making it a central log server.

## Key Functions

- Remote logging
- Local logging
- Filtering
- Format
- Modules

## Central Logging Configuration

### A. On the Log Server

| Step   | Action                 | Command / File                                                                                                                                                          |
| ------ | ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1️⃣** | Install Rsyslog        | `sudo dnf install rsyslog -y`                                                                                                                                           |
| **2️⃣** | Enable Rsyslog service | `sudo systemctl enable --now rsyslog`                                                                                                                                   |
| **3️⃣** | Edit config file       | `/etc/rsyslog.conf`                                                                                                                                                     |
| **4️⃣** | Enable network modules | Uncomment or add the following lines:<br>`bash<br>module(load="imudp")<br>input(type="imudp" port="514")<br>module(load="imtcp")<br>input(type="imtcp" port="514")<br>` |
| **5️⃣** | Restart service        | `sudo systemctl restart rsyslog`                                                                                                                                        |
| **6️⃣** | Allow firewall ports   | `bash<br>sudo firewall-cmd --add-port=514/udp --permanent<br>sudo firewall-cmd --add-port=514/tcp --permanent<br>sudo firewall-cmd --reload<br>`                        |
| **7️⃣** | Verify listening       | `sudo ss -tuln`                                                                                                                                                         |
| **8️⃣** | Logs stored at         | `/var/log/remote/` _(can be customized in rsyslog.conf)_                                                                                                                |

---

### B. On the Client Machine

| Step   | Action                 | Command / File                                                   |
| ------ | ---------------------- | ---------------------------------------------------------------- |
| **1️⃣** | Install Rsyslog        | `sudo dnf install rsyslog -y`                                    |
| **2️⃣** | Enable Rsyslog service | `sudo systemctl enable --now rsyslog`                            |
| **3️⃣** | Edit config file       | `/etc/rsyslog.conf` or `/etc/rsyslog.d/remote.conf`              |
| **4️⃣** | Add remote server line | `*.* @@<server-ip>:514`<br>_(Use `@` for UDP, `@@` for TCP)_     |
| **5️⃣** | Restart Rsyslog        | `sudo systemctl restart rsyslog`                                 |
| **6️⃣** | Test log forwarding    | `logger "Test message from client"`                              |
| **7️⃣** | Check on server        | `grep "Test message" /var/log/messages` or `/var/log/remote/...` |
