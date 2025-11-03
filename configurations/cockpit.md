# Cockpit

It lets you monitor and manage your system via a browser — view logs, update packages, start/stop services, manage storage, networking, and even open a terminal — all securely over HTTPS.

---

<br/>
<br/>

## Cockpit Installation and Configuration Steps

| Step   | Action                                 | Command / Details                                                                                         | Notes                                                                 |
| ------ | -------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| **1️** | Update system packages                 | `sudo apt update && sudo apt upgrade -y` _(Debian/Ubuntu)_<br>`sudo dnf update -y` _(RHEL/CentOS/Fedora)_ | Keeps packages up to date.                                            |
| **2️** | Install Cockpit                        | `sudo apt install cockpit -y` _(Debian/Ubuntu)_<br>`sudo dnf install cockpit -y` _(RHEL/CentOS/Fedora)_   | Installs Cockpit and dependencies.                                    |
| **3️** | Enable and start Cockpit service       | `sudo systemctl enable --now cockpit.socket`                                                              | Starts the Cockpit web service and enables it on boot.                |
| **4️** | Open firewall port 9090                | `sudo firewall-cmd --permanent --add-service=cockpit`<br>`sudo firewall-cmd --reload`                     | Required only if _firewalld_ is active (RHEL-based).                  |
| **5️** | Access Cockpit web UI                  | Open browser → `https://<server-ip>:9090`                                                                 | Log in using Linux system user credentials (e.g., root or sudo user). |
| **6️** | (Optional) Enable on multiple servers  | Add servers inside the web UI: “**+ Add system**” → enter hostname/IP + credentials                       | Allows centralized management of multiple servers.                    |
| **7️** | (Optional) Secure with SSL certificate | Configure in `/etc/cockpit/ws-certs.d/`                                                                   | Replace self-signed certificates with trusted SSL certs if required.  |
| **8️** | Check Cockpit status                   | `sudo systemctl status cockpit.socket`                                                                    | Confirms service is active and listening on port 9090.                |

---
