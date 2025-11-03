# DNS (Domain Name System)

- Translates Domain Names to IP Addresses.

<br/>

# DNS Configuration

    Step-1.  Install BIND Packages
            sudo dnf install bind bind-utils -y

    Step-2.  Start and Enable the DNS Service
            sudo systemctl enable --now named
            sudo systemctl status named

    Step-3.  Configure the Main DNS File (/etc/named.conf)
            sudo nano /etc/named.conf
            Example:
                ```
                    options {
                        listen-on port 53 { any; };
                        listen-on-v6 port 53 { any; };
                        directory       "/var/named";
                        dump-file       "/var/named/data/cache_dump.db";
                        statistics-file "/var/named/data/named_stats.txt";
                        memstatistics-file "/var/named/data/named_mem_stats.txt";
                        allow-query     { any; };
                        recursion yes;
                        dnssec-enable no;
                        dnssec-validation no;
                    };

                    zone "." IN {
                        type hint;
                        file "named.ca";
                    };

                    zone "mydomain.local" IN {
                        type master;
                        file "forward.mydomain.local";
                        allow-update { none; };
                    };

                    zone "1.168.192.in-addr.arpa" IN {
                        type master;
                        file "reverse.mydomain.local";
                        allow-update { none; };
                    };
                ```
            (Replace:
                mydomain.local → your custom domain
                1.168.192 → reverse of your local network (for 192.168.1.x)
            )

    Step-4.  Create the Forward Zone File (/var/named/forward.mydomain.local)
            sudo nano /var/named/forward.mydomain.local
            Example:
                ```
                bash
                Copy code
                $TTL 86400
                @   IN  SOA     dns1.mydomain.local. root.mydomain.local. (
                                2025102401  ; Serial
                                3600        ; Refresh
                                1800        ; Retry
                                1209600     ; Expire
                                86400       ; Minimum TTL
                )
                @       IN  NS      dns1.mydomain.local.
                @       IN  A       192.168.1.10
                dns1    IN  A       192.168.1.10
                server1 IN  A       192.168.1.20
                web     IN  A       192.168.1.30
            ```


    Step-5.  Create the Reverse Zone File (/var/named/reverse.mydomain.local)
            sudo nano /var/named/reverse.mydomain.local
            Example:
            ```
                bash
                Copy code
                $TTL 86400
                @   IN  SOA     dns1.mydomain.local. root.mydomain.local. (
                                2025102401
                                3600
                                1800
                                1209600
                                86400 )

                    IN  NS      dns1.mydomain.local.
                10  IN  PTR     dns1.mydomain.local.
                20  IN  PTR     server1.mydomain.local.
                30  IN  PTR     web.mydomain.local.
            ```

    Step-6.  Set File Permissions
            sudo chown root:named /var/named/forward.mydomain.local
            sudo chown root:named /var/named/reverse.mydomain.local
            sudo chmod 640 /var/named/forward.mydomain.local
            sudo chmod 640 /var/named/reverse.mydomain.local


    Step-7.  Check Configuration Syntax
            sudo named-checkconf
            sudo named-checkzone mydomain.local /var/named/forward.mydomain.local
            sudo named-checkzone 1.168.192.in-addr.arpa /var/named/reverse.mydomain.local



    Step-8.  Add DNS Server Information to network file (/etc/sysconfig/network-scripts/ifcfg-<network-interface-file>)
            vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
            DNS=192.168.100.153

    Step-9.  Restart and Enable the Service
            sudo systemctl restart named
            sudo systemctl enable named


    Step-10.  Configure Firewall
            sudo firewall-cmd --add-service=dns --permanent
            sudo firewall-cmd --reload


    Step-11. Configure Clients to Use Your DNS (Edit /etc/resolv.conf on client systems)
            nameserver 192.168.1.10


    Step-12. Test DNS Resolution
            dig server1.mydomain.local
                    or
            nslookup web.mydomain.local
