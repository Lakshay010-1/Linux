# SSH (Secure Shell)

- Securely connect to and manage remote systems over a network.
- Encrypts all traffic (commands, files, credentials).
- Remote login, file transfer (SCP/SFTP), tunneling, automation.

---

<br/>
<br/>

## SSH Configuration

| Step   | Action                              | Command / File / Details                                                                                                                    | Purpose / Notes                                                                     |
| ------ | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| **1️⃣** | Install SSH server package          | **Debian/Ubuntu:**<br>`sudo apt install openssh-server -y`<br>**RHEL/CentOS/Fedora:**<br>`sudo dnf install openssh-server -y`               | Installs the SSH service on the remote (server) machine.                            |
| **2️⃣** | Start and enable the SSH service    | **Debian/Ubuntu:** `sudo systemctl enable --now ssh`<br>**RHEL/CentOS:** `sudo systemctl enable --now sshd`                                 | Ensures SSH starts automatically at boot and is currently running.                  |
| **3️⃣** | Verify SSH status                   | `sudo systemctl status ssh` _(or `sshd`)_                                                                                                   | Confirms that the SSH service is active and running properly.                       |
| **4️⃣** | Allow SSH through the firewall      | **Debian/Ubuntu:** `sudo ufw allow ssh`<br>**RHEL/CentOS:** `sudo firewall-cmd --permanent --add-service=ssh && sudo firewall-cmd --reload` | Ensures incoming SSH connections are permitted through the firewall.                |
| **5️⃣** | Connect from client                 | `ssh username@server_ip`                                                                                                                    | Log in securely from another system using SSH.                                      |
| **6️⃣** | Edit SSH configuration _(optional)_ | Edit file: `/etc/ssh/sshd_config`                                                                                                           | Customize SSH options such as port, root login, and authentication methods.         |
| **7️⃣** | Apply configuration changes         | `sudo systemctl restart ssh` _(or `sshd`)_                                                                                                  | Restarts SSH to apply configuration updates.                                        |
| **8️⃣** | _(Optional)_ Harden security        | - Change SSH port → `Port 2222`<br>- Disable root login → `PermitRootLogin no`<br>- Enable key authentication → `PubkeyAuthentication yes`  | Strengthens SSH security by limiting access and enforcing key-based authentication. |
