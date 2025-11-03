# FTP ( File Transfer Protocol )

- A standard network protocol used to transfer files between client and server.
- Port 21 (control connection)
- Port 20 (data connection)
- Optional passive data ports (custom range)

## FTP Server Configuration ( Hosts files, accepts user logins )

    Step-1. Install vsftpd (or ProFTPD or Pure-FTPd or any)
            sudo dnf install vsftpd -y

    Step-2. Enable and Start the Service
            sudo systemctl enable --now vsftpd
            sudo systemctl status vsftpd

    Step-3. Backup and Edit Configuration File
            sudo cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
            sudo vi /etc/vsftpd/vsftpd.conf
            ```
                # Disable anonymous access
                anonymous_enable=NO

                # Allow local system users
                local_enable=YES

                # Allow uploads and modifications
                write_enable=YES

                # Jail users to their home directory
                chroot_local_user=YES
                allow_writeable_chroot=YES

                # Passive mode (firewall friendly)
                pasv_enable=YES
                pasv_min_port=40000
                pasv_max_port=50000

                # Optional: Customize banner
                ftpd_banner=Welcome to My FTP Server

                # Listen on IPv4
                listen=YES
                listen_ipv6=NO
            ```

    Step-4.Create a User for FTP
            sudo adduser ftpuser
            sudo passwd ftpuser

    Step-5.Configure Firewall
            sudo firewall-cmd --add-service=ftp --permanent
            sudo firewall-cmd --add-port=40000-50000/tcp --permanent
            sudo firewall-cmd --reload

    Step-6.Restart the Service
            sudo systemctl restart vsftpd
            sudo systemctl status vsftpd

    Step-7.Verify FTP is Listening
            sudo ss -tulnp | grep vsftpd

## FTP Client Configuration ( Connects to server to upload/download )

    Step-1. Install the FTP Client
            sudo dnf install ftp -y # CentOS / Fedora
            sudo apt install ftp -y # Ubuntu / Debian

    Step-2. Connect to the FTP Server
            ftp <server-ip-address>

    Step-3. Authenticate User.

    Step-4. Commence operation(s).
