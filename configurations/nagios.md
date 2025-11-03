# Nagios

Nagios is an open-source monitoring system that monitors:

- System metrics (CPU, memory, disk, load)
- Network devices (routers, switches)
- Services (HTTP, SMTP, SSH, MySQL, etc.)
- Remote hosts via agents like NRPE (Nagios Remote Plugin Executor)

It alerts administrators via email/SMS if something goes down or crosses thresholds.

## Components

| Component          | Description                                                      |
| ------------------ | ---------------------------------------------------------------- |
| **nagios-core**    | Main server/engine that performs checks and manages alerts       |
| **nagios-plugins** | Set of scripts that perform the actual health checks             |
| **NRPE**           | Agent installed on remote hosts so Nagios can monitor them       |
| **Apache (httpd)** | Web server used to serve the Nagios web interface                |
| **contacts.cfg**   | Configuration file defining alert recipients (who gets notified) |
| **hosts.cfg**      | Configuration file listing all monitored hosts                   |

---

## Configuration

### A. Installation Steps

| Step                                    | Action                                 | Command                                                                                                                                                                                                                                               |
| --------------------------------------- | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1. Install dependencies**             | Apache, PHP, compilers, and mail tools | `sudo dnf install httpd php gcc glibc glibc-common gd gd-devel make net-snmp -y`                                                                                                                                                                      |
| **2. Add Nagios user/group**            | Dedicated user for Nagios service      | `sudo useradd nagios; sudo usermod -a -G nagcmd nagios`                                                                                                                                                                                               |
| **3. Download and extract Nagios Core** | From official site                     | `cd /tmp && wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.14.tar.gz && tar -xzf nagios-4.4.14.tar.gz && cd nagios-4.4.14`                                                                                                   |
| **4. Compile and install**              | Build from source                      | `./configure --with-command-group=nagcmd && make all && sudo make install && sudo make install-init && sudo make install-commandmode && sudo make install-config`                                                                                     |
| **5. Install web interface**            | Apache integration                     | `sudo make install-webconf`                                                                                                                                                                                                                           |
| **6. Create Nagios admin user**         | For web login                          | `sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin`                                                                                                                                                                                   |
| **7. Install & enable Apache**          | Start web server                       | `sudo systemctl enable --now httpd`                                                                                                                                                                                                                   |
| **8. Install Nagios plugins**           | Required for service checks            | `cd /tmp && wget https://nagios-plugins.org/download/nagios-plugins-2.4.5.tar.gz && tar -xzf nagios-plugins-2.4.5.tar.gz && cd nagios-plugins-2.4.5 && ./configure --with-nagios-user=nagios --with-nagios-group=nagios && make && sudo make install` |

---

### B. Configuration Steps

| Step                         | Description                  | File / Command                                                                   |
| ---------------------------- | ---------------------------- | -------------------------------------------------------------------------------- |
| **1. Verify main config**    | Ensure syntax is correct     | `/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg`               |
| **2. Start Nagios service**  | Enable and start at boot     | `sudo systemctl enable nagios && sudo systemctl start nagios`                    |
| **3. Open web access**       | Allow HTTP through firewall  | `sudo firewall-cmd --add-service=http --permanent && sudo firewall-cmd --reload` |
| **4. Access Web UI**         | In browser                   | `http://<server-ip>/nagios`                                                      |
| **5. Login credentials**     | Username / Password          | `nagiosadmin / (set earlier)`                                                    |
| **6. Verify default checks** | Confirm localhost monitoring | _Services → Host → localhost_                                                    |

---

### C. Add Remote Host (Client) using NRPE

| Step                            | On     | Action                          | Command / File                                |
| ------------------------------- | ------ | ------------------------------- | --------------------------------------------- |
| **1. Install NRPE and plugins** | Client | Install required agent packages | `sudo dnf install nrpe nagios-plugins-all -y` |
| **2. Edit NRPE config**         | Client | Configure NRPE settings         | `/etc/nagios/nrpe.cfg`                        |
| **3. Allow Nagios server IP**   | Client | Update allowed hosts            | `allowed_hosts=127.0.0.1,<nagios_server_ip>`  |
| **4. Start NRPE service**       | Client | Enable and start NRPE           | `sudo systemctl enable --now nrpe`            |
| **5. Add host entry**           | Server | Add remote host definition      | `/usr/local/nagios/etc/objects/hosts.cfg`     |
| **6. Add service checks**       | Server | Define monitoring services      | `/usr/local/nagios/etc/objects/services.cfg`  |
| **7. Restart Nagios**           | Server | Apply new configurations        | `sudo systemctl restart nagios`               |

---

### D. Verify Setup

| Check                         | Command                                                            |
| ----------------------------- | ------------------------------------------------------------------ |
| **Test Nagios config syntax** | `/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg` |
| **View web dashboard**        | `http://<server-ip>/nagios`                                        |
| **View Nagios logs**          | `/usr/local/nagios/var/nagios.log`                                 |
| **Check service status**      | `systemctl status nagios`                                          |
