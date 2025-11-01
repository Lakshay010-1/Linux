# NIC Bonding

NIC bonding means combining two or more physical network interfaces (NICs) into a single logical interface — called a bond interface (like bond0).<br/>
The bond acts as one virtual NIC that:

- Increases throughput (load balancing)
- Provides redundancy (failover)

## Bonding Architecture

When you bond NICs:

1. The kernel bonding driver creates a virtual interface (bond0).
2. You attach real interfaces (eth0, eth1, etc.) to the bond.
3. IP configuration (address, gateway, etc.) is applied to bond0, not to the individual interfaces.

## Bonding Modes

| Mode  | Type               | Description                                                                           |
| ----- | ------------------ | ------------------------------------------------------------------------------------- |
| **0** | **balance-rr**     | Round-robin load balancing — sends packets sequentially over each NIC.                |
| **1** | **active-backup**  | One active NIC, others standby; provides failover if the primary fails.               |
| **2** | **balance-xor**    | Distributes traffic based on MAC hash; ensures consistent link usage per destination. |
| **3** | **broadcast**      | Sends all packets on all NICs; provides maximum redundancy.                           |
| **4** | **802.3ad (LACP)** | IEEE standard link aggregation; requires switch support (dynamic teaming).            |
| **5** | **balance-tlb**    | Transmit load balancing — distributes outgoing traffic without switch support.        |
| **6** | **balance-alb**    | Adaptive load balancing — balances both transmit and receive traffic automatically.   |

## Bonding Methods

### 1. `Configuration Files` ( Traditional )

    Step-1. Create and Config Bond Interface (Master)
            File: /etc/sysconfig/network-scripts/ifcfg-<bond-interface>

    Step-2. Create and Config Slave Interfaces
            File: /etc/sysconfig/network-scripts/ifcfg-<slave-interface-1>
            File: /etc/sysconfig/network-scripts/ifcfg-<slave-interface-2>
            ...

    Step-3. Enable Bonding
            sudo modprobe bonding


    Step-4. Restart Network Service
            sudo systemctl restart network

### 2. Using `nmcli` (CLI)

    Step-1. Create the Bond Master
            nmcli con add type bond ifname <bond-interface> mode active-backup

    Step-2. Create Slave Interfaces
            nmcli con add type ethernet ifname <slave-interface-1> master <bond-interface>
            nmcli con add type ethernet ifname <slave-interface-2> master <bond-interface>

    Step-3. Assign IP Address to Bond
            nmcli con mod <bond-interface> ipv4.addresses 192.168.1.100/24 ipv4.gateway 192.168.1.1 ipv4.dns 8.8.8.8 ipv4.method manual

    Step-4. Bring Bond Up
            nmcli con up <bond-interface>

    Step-5. Verify
            cat /proc/net/bonding/<bond-interface>
            nmcli device status
            ip addr show <bond-interface>

### 3. Using `nmtui` (TUI)

    Step-1. sudo nmtui
    Step-2. Choose “Edit a connection” → “Add” → select Bond.
    Step-3. Enter bond name (e.g., bond0).
    Step-4. Set bonding mode (active-backup, balance-rr, etc.).
    Step-5. Add slave interfaces (eth0, eth1).
    Step-6. Configure IP (manual or DHCP).
    Step-7. Save and activate.

### 4. Using `nm-connection-editor` (GUI)

### 5. Manual ( `Systemd-Networkd` )
