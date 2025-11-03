# Firewall

- A firewall is a security system that controls incoming and outgoing network traffic based on predefined rules.
- It protect user's system or network from unauthorized access while allowing legitimate communication.
- ufw (Ubuntu/Debian), firewalld (RHEL/CentOS/Fedora), iptables (legacy backend).

---

<br/>
<br/>

## Main Components of a Firewall

| Component                         | Description / Function                                                                          | Example / Notes                                                 |
| --------------------------------- | ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| **1️.Rules / Policies**           | Define which traffic is allowed or blocked based on IP, port, protocol, or direction.           | Example: Allow SSH on port 22; Deny Telnet on port 23.          |
| **2️.Zones (in firewalld)**       | Logical network areas with different trust levels — e.g., _public_, _internal_, _trusted_.      | Example: _public_ zone for Internet-facing; _internal_ for LAN. |
| **3️.Services**                   | Predefined sets of ports and protocols grouped under one name for easier management.            | Example: **http** = port 80/tcp; **https** = port 443/tcp.      |
| **4️.Ports**                      | Specific entry/exit points for network communication.                                           | Example: Port **22** for SSH, Port **3306** for MySQL.          |
| **5️.Protocols**                  | Define how data is transmitted (TCP, UDP, ICMP, etc.).                                          | Example: Block all **ICMP** (ping) packets.                     |
| **6️.Interfaces**                 | Network adapters (e.g., _eth0_, _ens33_) that the firewall monitors.                            | You can assign interfaces to zones in **firewalld**.            |
| **7️.Chains / Tables (iptables)** | Logical groupings of rules that control how packets are processed.                              | Example: **INPUT**, **OUTPUT**, **FORWARD** chains.             |
| **8️.Targets / Actions**          | Define what happens to packets matching a rule: **ACCEPT**, **DROP**, **REJECT**, **LOG**, etc. | Example: Drop all unmatched traffic.                            |
| **9️.Logging**                    | Records firewall events (allowed/blocked packets).                                              | Useful for security audits and troubleshooting.                 |
| **10. Daemon / Service**          | Background process enforcing firewall rules.                                                    | Examples: **ufw**, **firewalld**, **iptables** daemon.          |

---

<br/>
<br/>

## Firewall Configuration

## A. Using firewalld – RHEL / CentOS / Fedora / Rocky / AlmaLinux

| Step   | Action                     | Command / File                                        | Purpose / Notes                              |
| ------ | -------------------------- | ----------------------------------------------------- | -------------------------------------------- |
| **1️** | Install firewalld          | `sudo dnf install firewalld -y`                       | Installs the firewall daemon.                |
| **2️** | Enable and start firewalld | `sudo systemctl enable --now firewalld`               | Starts firewall and enables at boot.         |
| **3️** | Check status               | `sudo firewall-cmd --state`                           | Confirms it’s active and running.            |
| **4️** | List all active rules      | `sudo firewall-cmd --list-all`                        | Displays current allowed services and ports. |
| **5️** | Allow a service            | `sudo firewall-cmd --permanent --add-service=http`    | Allows HTTP traffic permanently.             |
| **6️** | Allow a specific port      | `sudo firewall-cmd --permanent --add-port=8080/tcp`   | Opens a custom port.                         |
| **7️** | Remove a rule              | `sudo firewall-cmd --permanent --remove-service=http` | Removes an allowed service.                  |
| **8️** | Reload firewall            | `sudo firewall-cmd --reload`                          | Applies configuration changes.               |
| **9️** | Check open ports           | `sudo firewall-cmd --list-ports`                      | Lists all open network ports.                |

---

## B. Using UFW (Uncomplicated Firewall) – Ubuntu / Debian

| Step   | Action                | Command / File                                                     | Purpose / Notes                           |
| ------ | --------------------- | ------------------------------------------------------------------ | ----------------------------------------- |
| **1️** | Install UFW           | `sudo apt install ufw -y`                                          | Installs the firewall package.            |
| **2️** | Enable UFW            | `sudo ufw enable`                                                  | Turns on the firewall.                    |
| **3️** | Check firewall status | `sudo ufw status verbose`                                          | Displays current rules and status.        |
| **4️** | Allow SSH             | `sudo ufw allow ssh`                                               | Keeps SSH (port 22) accessible.           |
| **5️** | Allow specific ports  | `sudo ufw allow 80/tcp` (HTTP)<br>`sudo ufw allow 443/tcp` (HTTPS) | Opens ports for web servers.              |
| **6️** | Deny a port/service   | `sudo ufw deny 23/tcp`                                             | Blocks Telnet or other insecure services. |
| **7️** | Delete a rule         | `sudo ufw delete allow 80/tcp`                                     | Removes an existing rule.                 |
| **8️** | Disable UFW           | `sudo ufw disable`                                                 | Temporarily disables the firewall.        |

---
