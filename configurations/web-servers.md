# Web Servers

A web server is a service (daemon) that:

- Receives HTTP/HTTPS requests from clients (browsers, curl, etc.)
- Serves web content (HTML, CSS, images, PHP, etc.)
- Optionally runs dynamic scripts via interpreters (PHP, Python, etc.)

---

<br/>
<br/>

## Common Web Servers in Linux

| Web Server                     | Package / Service Name | Default Port   | Main Config File                                            | Key Feature                                            |
| ------------------------------ | ---------------------- | -------------- | ----------------------------------------------------------- | ------------------------------------------------------ |
| **Apache HTTP Server (httpd)** | `httpd` or `apache2`   | 80 / 443       | `/etc/httpd/conf/httpd.conf` or `/etc/apache2/apache2.conf` | Modular, stable, and widely supported                  |
| **Nginx**                      | `nginx`                | 80 / 443       | `/etc/nginx/nginx.conf`                                     | High-performance, event-driven architecture            |
| **Lighttpd**                   | `lighttpd`             | 80             | `/etc/lighttpd/lighttpd.conf`                               | Lightweight, minimal resource usage                    |
| **Tomcat**                     | `tomcat`               | 8080           | `/etc/tomcat/server.xml`                                    | Java-based web and application server                  |
| **Node.js**                    | `node`                 | 3000+ (custom) | App-level configuration                                     | Ideal for JavaScript-based web apps (e.g., Express.js) |

## Configuration

| Step                        | Apache (httpd)                                                         | Nginx                                                      | Lighttpd                                              |
| --------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------- | ----------------------------------------------------- |
| **1. Install**              | `dnf install httpd -y`                                                 | `dnf install nginx -y`                                     | `dnf install lighttpd -y`                             |
| **2. Enable & Start**       | `systemctl enable --now httpd`                                         | `systemctl enable --now nginx`                             | `systemctl enable --now lighttpd`                     |
| **3. Firewall Allow**       | `firewall-cmd --add-service=http --permanent && firewall-cmd --reload` | same                                                       | same                                                  |
| **4. Web Root**             | `/var/www/html/`                                                       | `/usr/share/nginx/html/`                                   | `/var/www/html/`                                      |
| **5. Config File**          | `/etc/httpd/conf/httpd.conf`                                           | `/etc/nginx/nginx.conf`                                    | `/etc/lighttpd/lighttpd.conf`                         |
| **6. Test Page**            | `echo "<h1>Apache</h1>" > /var/www/html/index.html`                    | `echo "<h1>Nginx</h1>" > /usr/share/nginx/html/index.html` | `echo "<h1>Lighttpd</h1>" > /var/www/html/index.html` |
| **7. Restart Service**      | `systemctl restart httpd`                                              | `systemctl restart nginx`                                  | `systemctl restart lighttpd`                          |
| **8. Test Access**          | `curl http://localhost`                                                | `curl http://localhost`                                    | `curl http://localhost`                               |
| **9. Logs**                 | `/var/log/httpd/`                                                      | `/var/log/nginx/`                                          | `/var/log/lighttpd/`                                  |
| **10. Check Config Syntax** | `apachectl configtest`                                                 | `nginx -t`                                                 | `lighttpd -tt -f /etc/lighttpd/lighttpd.conf`         |
