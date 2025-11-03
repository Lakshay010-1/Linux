# Mail Servers

- Mail server is software that sends, receives, stores, and routes email messages between users or systems over the internet or a local network.
- It’s the backbone of the email system — the same way a web server hosts websites, a mail server hosts emails.

## Components of Mail Server

| Component | Name                  | Purpose                                                        | Examples                                    |
| --------- | --------------------- | -------------------------------------------------------------- | ------------------------------------------- |
| **MUA**   | `Mail User Agent`     | User-facing mail client for reading and sending emails         | s-nail, mailx, mutt, Thunderbird, Roundcube |
| **MTA**   | `Mail Transfer Agent` | Transfers mail between servers using SMTP                      | Postfix, Sendmail, Exim, Qmail              |
| **MDA**   | `Mail Delivery Agent` | Delivers mail from the MTA to the user’s mailbox               | Dovecot, Procmail, Cyrus                    |
| **DNS**   | `Domain Name System`  | (MX Records)Determines which server receives mail for a domain | named, nameserver                           |

## Important Configuration Files

| Component      | File / Directory                                 | Purpose                                          |
| -------------- | ------------------------------------------------ | ------------------------------------------------ |
| **Postfix**    | `/etc/postfix/main.cf`, `/etc/postfix/master.cf` | Core Postfix configuration files                 |
| **Sendmail**   | `/etc/mail/sendmail.cf`, `/etc/mail/access`      | Sendmail main configuration and access control   |
| **Exim**       | `/etc/exim/exim.conf`                            | Exim mail server configuration                   |
| **Dovecot**    | `/etc/dovecot/dovecot.conf`                      | Dovecot IMAP/POP3 server main configuration file |
| **Mail Queue** | `/var/spool/postfix/`, `/var/mail/`              | Stores queued, delivered, and pending emails     |
| **Mail Logs**  | `/var/log/maillog` or `/var/log/mail.log`        | Tracks all email and delivery activity           |

## Configuration `Postfix` + `s-nail`

| Step             | Component                   | Action / Command                                                                                          |
| ---------------- | --------------------------- | --------------------------------------------------------------------------------------------------------- |
| **1**            | Install packages            | `dnf install postfix s-nail -y`                                                                           |
| **2**            | Enable Postfix service      | `systemctl enable --now postfix`                                                                          |
| **3**            | Configure Postfix           | Edit `/etc/postfix/main.cf`                                                                               |
| **4**            | Reload Postfix              | `systemctl restart postfix`                                                                               |
| **5**            | Configure s-nail            | Edit `~/.mailrc`                                                                                          |
| **6**            | Test mail sending           | `echo "Test mail" \| mail -s "Test" user@example.com`                                                     |
| **7**            | Verify logs                 | Check `/var/log/maillog`                                                                                  |
| **8 (Optional)** | Relay external mail         | Configure `/etc/postfix/sasl_passwd`                                                                      |
| **9**            | Allow SMTP through firewall | `firewall-cmd --add-service=smtp --permanent && firewall-cmd --reload`                                    |
| **10**           | Verify the Mail Flow        | `mailq`, `sudo grep "status=sent" /var/log/maillog` and `s-nail -v -s "Test" user@example.com <<< "body"` |
