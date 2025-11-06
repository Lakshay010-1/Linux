# Database Setup

## Database **Server**

- | Step | Purpose                                                                      | Command                                                                                                                                               |
  | ---- | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
  | 1    | Installs Database server packages (like mariadb/mysql/any)                   | **Install the database server** <br> RHEL/CentOS/Rocky: `sudo dnf install mariadb-server -y` <br> Ubuntu/Debian: `sudo apt install mariadb-server -y` |
  | 2    | Start and enable the DB service                                              | `sudo systemctl enable --now mariadb`                                                                                                                 |
  | 3    | Secure server (set root password, remove test DB, disable remote root, etc.) | `sudo mysql_secure_installation`                                                                                                                      |
  | 4    | Login to DB shell as root                                                    | `mysql -u root -p`                                                                                                                                    |
  | 5    | Create new database                                                          | Create a database: <br> `CREATE DATABASE mydb;`                                                                                                       |
  | 6    | Create DB user                                                               | Create a user: <br> `CREATE USER 'dbuser'@'%' IDENTIFIED BY 'Pass@123';`                                                                              |
  | 7    | Give user full DB access                                                     | Grant permissions: <br> `GRANT ALL PRIVILEGES ON mydb.* TO 'dbuser'@'%';`                                                                             |
  | 8    | Apply and reload permission changes                                          | `FLUSH PRIVILEGES;`                                                                                                                                   |
  | 9    | Test user access to confirm correct permissions.                             | `mysql -u user1 -p`                                                                                                                                   |
  | 10   | Enables remote DB access                                                     | Allow remote connections (optional): Edit `/etc/my.cnf` or `/etc/my.cnf.d/mariadb-server.cnf` → set: <br> `bind-address = 0.0.0.0`                    |
  | 11   | Restart DB service                                                           | `sudo systemctl restart mariadb`                                                                                                                      |
  | 12   | Permits remote database connections through firewall                         | Open Firewall (RHEL): <br> `firewall-cmd --add-service=mysql --permanent` <br> `firewall-cmd --reload`                                                |

---

## Database **Client**

- | Step | Purpose                         | Command                                                                                                          |
  | ---- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
  | 1    | Installs command-line DB client | Install client tools: <br> RHEL: `sudo dnf install mariadb -y` <br> Ubuntu: `sudo apt install mariadb-client -y` |
  | 2    | Remote database login           | Connect to remote DB server: <br> `mysql -h <server_ip> -u dbuser -p`                                            |
  | 3    | Verify connection               | Show databases: <br> `SHOW DATABASES;`                                                                           |
  | 4    | Select database                 | Use a DB: <br> `USE mydb;`                                                                                       |
  | 5    | `SELECT * FROM table_name;`     | Run SQL queries                                                                                                  |

---

## Backup & Restore Commands

- | Task             | Command                                | Purpose                                |
  | ---------------- | -------------------------------------- | -------------------------------------- |
  | Backup Database  | `mysqldump -u root -p mydb > mydb.sql` | Creates a backup file of the database. |
  | Restore Database | `mysql -u root -p mydb < mydb.sql`     | Restores database from backup.         |
