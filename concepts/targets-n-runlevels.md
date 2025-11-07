# Systemd Targets and Runlevels

- Runlevels are predefined modes that determine which services and processes start at boot.

  - Tool => init.
  - Example :
    - runlevel (Check current runlevel)
    - init \<runlevel> (Set Level)

- A systemd target is a group (or collection) of systemd units — services, mounts, sockets, etc. — that define a particular system state or mode of operation.<br/>
  In modern Linux (systemd-based), runlevels are replaced by systemd targets.

  - Tool => systemctl.
  - Example :
    - systemctl set-default (Check current systemd target)
    - systemctl set-default \<target> (Permanent Mode)
    - systemctl isolate \<target> (Temporary Mode)

- Purpose : To control system state: single-user, multi-user, graphical, etc.

- | Legacy Runlevel | Purpose                        | Systemd Target      |
  | --------------- | ------------------------------ | ------------------- |
  | **0**           | Halt / Shutdown                | `poweroff.target`   |
  | **1**           | Single-user mode (maintenance) | `rescue.target`     |
  | **2**           | Multi-user (no network)        | `multi-user.target` |
  | **3**           | Multi-user (network + CLI)     | `multi-user.target` |
  | **4**           | Undefined / custom             | `Custom target`     |
  | **5**           | Multi-user (network + GUI)     | `graphical.target`  |
  | **6**           | Reboot                         | `reboot.target`     |

---
