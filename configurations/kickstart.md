# KickStart

- Kickstart is an automated installation method used by Red Hat–based Linux distributions. It uses a configuration file (.ks) that answers all setup questions automatically during installation.
- It's used to deploy multiple Linux systems quickly and consistently without manual input
- It can be stored on local media (USB, CD, DVD) or accessed via network (HTTP, FTP, NFS).

## KickStart Configuration

| Step    | Action                                     | Command / File / Path                                                                                  | Purpose / Notes                                                     |
| ------- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| **1️**  | **Install system-config-kickstart tool**   | `sudo dnf install system-config-kickstart -y`                                                          | Installs a GUI tool to create Kickstart files.                      |
| **2️**  | **Create a new Kickstart file**            | Run: `system-config-kickstart` _(GUI)_<br>or manually create `/root/ks.cfg`                            | Opens a graphical interface to define installation settings.        |
| **3️**  | **Define installation source**             | Example:<br>`url --url=http://mirror.centos.org/centos/9-stream/BaseOS/x86_64/os/`                     | Specifies where to get installation files (CD, NFS, HTTP, etc.).    |
| **4️**  | **Set language, keyboard, and timezone**   | Example:<br>`lang en_US.UTF-8`<br>`keyboard us`<br>`timezone Asia/Kolkata`                             | Defines regional and localization settings.                         |
| **5️**  | **Configure network**                      | Example:<br>`network --bootproto=dhcp --device=eth0 --hostname=server1.example.com`                    | Sets up network interface configuration.                            |
| **6️**  | **Set root password and users**            | Example:<br>`rootpw --iscrypted $6$abc123xyz`<br>Generate encrypted password with: `openssl passwd -6` | Creates root credentials securely.                                  |
| **7️**  | **Select installation type**               | Example:<br>`install`<br>`text` or `graphical`                                                         | Specifies automated or GUI-based installation.                      |
| **8️**  | **Configure partitions**                   | Example:<br>`part / --fstype=xfs --size=10240`                                                         | Defines automatic disk layout and filesystem type.                  |
| **9️**  | **Select software packages**               | Example:<br>```%packages@^server-product-environment%end````                                           | Determines which packages or groups to install.                     |
| **10**  | **Add post-install scripts (optional)**    | Example:<br>`%postecho "Server installed successfully" >> /root/install.log%end `                      | Runs custom commands or configuration after installation completes. |
| **11️** | **Save Kickstart file**                    | Save as `/root/ks.cfg`                                                                                 | The master configuration file for automated setup.                  |
| **12️** | **Host the Kickstart file (optional)**     | Copy to web server:<br>`sudo cp /root/ks.cfg /var/www/html/ks.cfg`                                     | Makes the Kickstart file accessible via HTTP.                       |
| **13️** | **Use Kickstart file during installation** | At ISO boot menu, press **Tab** → add:<br>`inst.ks=http://<server-ip>/ks.cfg`                          | Tells the installer to use your Kickstart configuration.            |
| **14️** | **Start automated install**                | _(Installer action)_                                                                                   | The system installs automatically — no user input required.         |
