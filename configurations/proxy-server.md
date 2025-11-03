# Proxy Server

- A Proxy Server acts as an intermediary between a client (like your browser) and the destination server (like a website).
- To control, monitor, and secure network traffic. It forwards client requests to the internet and returns responses — often with caching, filtering, or access control.
- Common Proxy Software Squid, HAProxy, Nginx, TinyProxy, Apache Traffic Server
- Types -> Forward Proxy, Reverse Proxy, Transparent Proxy, Anonymous Proxy, Caching Proxy, etc.

---

<br/>
<br/>

## Configuration (Squid)

| Step    | Action                                   | Command / File / Path                                                                                                       | Purpose / Notes                                                            |
| ------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| **1️**  | **Install Squid Proxy package**          | **RHEL/CentOS:**<br>`sudo dnf install squid -y`<br><br>**Ubuntu/Debian:**<br>`sudo apt update && sudo apt install squid -y` | Installs the Squid proxy server package.                                   |
| **2️**  | **Check default configuration file**     | `/etc/squid/squid.conf`                                                                                                     | Main Squid configuration file — defines ports, ACLs, and caching behavior. |
| **3️**  | **Backup original config (recommended)** | `sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak`                                                                   | Always back up before making any configuration changes.                    |
| **4️**  | **Edit Squid configuration file**        | `sudo nano /etc/squid/squid.conf`                                                                                           | Modify ACLs, access rules, and ports as per your network requirements.     |
| **5️**  | **Set listening port (optional)**        | Find or edit line:<br>`http_port 3128`                                                                                      | Default Squid port is **3128**, but can be changed if required.            |
| **6️**  | **Allow local network clients**          | Add lines:<br>`acl localnet src 192.168.1.0/24 http_access allow localnet`                                                  | Grants proxy access to users within the specified local subnet.            |
| **7️**  | **Block all other traffic**              | Ensure final line in config is:<br>`http_access deny all`                                                                   | Security best practice — blocks all unauthorized access.                   |
| **8️**  | **Enable caching (optional)**            | Squid caches content automatically, but can be tuned:<br>`cache_dir ufs /var/spool/squid 100 16 256`                        | Improves web performance by storing frequently accessed content.           |
| **9️**  | **Start and enable Squid service**       | `sudo systemctl enable --now squid`                                                                                         | Starts Squid immediately and ensures it runs on boot.                      |
| **10**  | **Allow Squid through firewall**         | **RHEL/CentOS:**<br>`sudo firewall-cmd --add-service=squid --permanent`<br>`sudo firewall-cmd --reload`                     | Opens proxy port **3128** in the firewall.                                 |
| **11️** | **Verify service status**                | `sudo systemctl status squid`                                                                                               | Confirms that the Squid service is active and running.                     |
| **12️** | **Check proxy listening port**           | `sudo netstat -tulnp \| grep squid`<br>or<br>`sudo ss -tuln \| grep 3128`                                                   | Ensures Squid is listening on the configured port.                         |
| **13️** | **Configure client browsers or systems** | Proxy settings:<br>`Proxy: 192.168.1.10`<br>`Port: 3128`                                                                    | Points client systems or browsers to the proxy server.                     |
| **14️** | **Check logs for activity**              | `/var/log/squid/access.log`                                                                                                 | Displays web requests passing through the proxy. Useful for auditing.      |
| **15️** | **Test proxy connection**                | On client:<br>`export http_proxy=http://192.168.1.10:3128`<br>`curl google.com`                                             | Verifies proxy connectivity and internet access through Squid.             |
