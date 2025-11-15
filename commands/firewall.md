# Firewall

- firewalld is a firewall management service that uses:

  - ### Zones (trust levels)

    - Security levels grouping rules; applied to interfaces.
    - A zone defines how much you trust the network your system is connected to.<br/>
      A zone contains rules like:
      - allowed ports
      - allowed services (SSH, HTTP, DNS, etc.)
      - ICMP rules
      - masquerading
      - rich rules
      - forward rules

  - ### Services, ports, protocols

  - ### Runtime & Permanent configurations

- It is more flexible and dynamic than iptables.

## firewalld Architecture Overview

- ### Zones → contain rules → applied to network interfaces

## firewall-cmd

- firewall-cmd is the command-line tool used to manage firewall rules in firewalld.

- It is used for:

  - Allowing/blocking ports

  - Managing services (HTTP, SSH, DNS…)

  - Managing zones

  - Opening ports temporarily

  - Reloading firewall rules

- `firewall-cmd [options]`
- Example:

  - firewall-cmd --list-all
  - firewall-cmd --get-default-zone
  - firewall-cmd --set-default-zone=home
  - firewall-cmd --get-services
  - firewall-cmd --add-service=http
  - firewall-cmd --remove-service=http
  - firewall-cmd --add-port=8080/tcp
  - firewall-cmd --permanent --add-port=8080/tcp
  - firewall-cmd --reload
