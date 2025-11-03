# OpenLDAP { Open-source implementation of LDAP (Lightweight Directory Access Protocol) }

- It stores and manages information (like users, groups, policies) in a central directory, similar to Active Directory (AD) on Windows.

- Used for:
  - Centralized authentication
  - User management across multiple Linux systems
  - Integration with SSSD, Samba, Postfix, etc.

## Core Components

| Component                               | Role                                                  |
| --------------------------------------- | ----------------------------------------------------- |
| **slapd**                               | LDAP server daemon (main service)                     |
| **ldapadd / ldapmodify**                | Command-line tools to add or modify directory entries |
| **ldapsearch**                          | Query LDAP directory                                  |
| **LDIF (LDAP Data Interchange Format)** | Text format for LDAP data (e.g., users, groups)       |
| **/etc/openldap/slapd.d/**              | Runtime configuration directory                       |
| **/etc/openldap/slapd.conf**            | Traditional config file (legacy)                      |

## Configuration

### A. Install & Configure OpenLDAP Server

| Step | Action                          | Command / File                                                         |
| ---- | ------------------------------- | ---------------------------------------------------------------------- |
| 1️   | Install LDAP packages           | `sudo dnf install openldap-servers openldap-clients -y`                |
| 2️   | Enable and start service        | `sudo systemctl enable --now slapd`                                    |
| 3️   | Check service status            | `sudo systemctl status slapd`                                          |
| 4️   | Set LDAP admin password         | `sudo slappasswd` → copy generated hash                                |
| 5️   | Configure database (using LDIF) | Create `/root/db.ldif` with database settings                          |
| 6️   | Apply configuration             | `ldapadd -Y EXTERNAL -H ldapi:/// -f /root/db.ldif`                    |
| 7️   | Create base domain structure    | Create `/root/base.ldif` with domain entries                           |
| 8️   | Load base structure             | `ldapadd -x -D "cn=Manager,dc=example,dc=com" -W -f /root/base.ldif`   |
| 9️   | Open firewall ports             | `firewall-cmd --add-service=ldap --permanent && firewall-cmd --reload` |
| 10   | Verify LDAP directory           | `ldapsearch -x -b "dc=example,dc=com"`                                 |

### B. Add a User

| Step                  | File              | Command                                                              |
| --------------------- | ----------------- | -------------------------------------------------------------------- |
| **Create user entry** | `/root/user.ldif` | `ldapadd -x -D "cn=Manager,dc=example,dc=com" -W -f /root/user.ldif` |

### C. Configure LDAP Client (on another host)

| Step   | Action                              | Command / File                                                                            |
| ------ | ----------------------------------- | ----------------------------------------------------------------------------------------- |
| **1️** | Install client tools                | `sudo dnf install openldap-clients nss-pam-ldapd -y`                                      |
| **2️** | Configure LDAP URI & Base DN        | `/etc/nslcd.conf` → <br>`uri ldap://ldapserver.example.com/` <br>`base dc=example,dc=com` |
| **3️** | Enable & start services             | `systemctl enable --now nslcd`                                                            |
| **4️** | Test connection                     | `ldapsearch -x -H ldap://ldapserver -b dc=example,dc=com`                                 |
| **5️** | Configure login via LDAP (optional) | `authselect select sssd with-mkhomedir` <br>`systemctl restart sssd`                      |

---
