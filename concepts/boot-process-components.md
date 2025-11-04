# Boot Process Components

<br/>

## 1. Hardware Layer Components

| **Component**                  | **Full Form / Type**                    | **Role in Boot Process**                                                                | **Description**                          |
| ------------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------- | ---------------------------------------- |
| **`Power Supply (SMPS)`**      | Switch Mode Power Supply                | Converts AC to DC and provides stable voltage to motherboard and peripherals.           | Starts system power sequence.            |
| **`CPU (Processor)`**          | Central Processing Unit                 | Executes the first instruction located at a specific memory address in ROM (BIOS/UEFI). | Begins code execution.                   |
| **`RAM (Memory)`**             | Random Access Memory                    | Provides temporary space for BIOS, bootloader, and OS kernel to load.                   | Stores code during boot.                 |
| **`CMOS`**                     | Complementary Metal-Oxide Semiconductor | Stores BIOS/UEFI configuration (boot order, time, date, etc.).                          | Volatile memory powered by CMOS battery. |
| **`CMOS Battery`**             | Lithium Cell                            | Powers CMOS chip to retain BIOS settings and clock when power is off.                   | Keeps settings persistent.               |
| **`Storage Device (HDD/SSD)`** | Disk                                    | Contains MBR or GPT, bootloader, kernel, and filesystem.                                | OS resides here.                         |
| **`Peripheral Devices`**       | Keyboard, Monitor, Mouse, etc.          | Used for user input/output during and after boot.                                       | Tested during POST.                      |

---

<br/>

## 2. Firmware Layer Components

| **Component**                         | **Full Form / Type**                  | **Role in Boot Process**                                                                   | **Description**                     |
| ------------------------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------- |
| **`ROM (BIOS/UEFI)`**                 | Read-Only Memory                      | Contains firmware code to initialize hardware and start the boot sequence.                 | Non-volatile memory on motherboard. |
| **`BIOS`**                            | Basic Input/Output System             | Legacy firmware that performs POST and loads MBR bootloader.                               | Found on older systems.             |
| **`UEFI`**                            | Unified Extensible Firmware Interface | Modern firmware that supports larger disks and Secure Boot; loads `.efi` bootloader files. | Replaces BIOS in new systems.       |
| **`POST`**                            | Power-On Self-Test                    | BIOS/UEFI routine that checks CPU, memory, storage, and peripherals for errors.            | Emits beep codes if errors occur.   |
| **`Boot Order / Boot Configuration`** | BIOS/UEFI Setting                     | Determines which device to attempt booting from first (HDD, SSD, CD, USB, etc.).           | Stored in CMOS.                     |

---

<br/>

## 3. Storage & Bootloader Components

| **Component**                                       | **Type**                      | **Role in Boot Process**                                                | **Description**              |
| --------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------- | ---------------------------- |
| **`MBR (Master Boot Record)`**                      | Disk Sector (first 512 bytes) | Contains bootloader code, partition table, and boot signature.          | Used by legacy BIOS systems. |
| **`GPT (GUID Partition Table)`**                    | Disk Partition Structure      | Modern partitioning standard used by UEFI systems.                      | Replaces MBR.                |
| **`Bootloader (GRUB, LILO, Windows Boot Manager)`** | Software                      | Loads the operating system kernel into memory and passes control to it. | Can offer a multi-boot menu. |
| **`EFI System Partition (ESP)`**                    | FAT32 Partition               | In UEFI systems, stores `.efi` bootloader files.                        | Required for UEFI booting.   |

---

<br/>

## 4. Operating System Layer Components

| **Component**                                    | **Type**               | **Role in Boot Process**                                                        | **Description**                                   |
| ------------------------------------------------ | ---------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------- |
| **`Kernel (vmlinuz)`**                           | Core OS File           | The core of the operating system — manages CPU, memory, and devices.            | Loaded by the bootloader.                         |
| **`initramfs / initrd`**                         | Initial RAM Filesystem | Temporary root filesystem that helps the kernel mount the real root partition.  | Used for boot drivers and early scripts.          |
| **`Init System (systemd / SysVinit / Upstart)`** | PID 1 Process          | The first user-space process — initializes services, targets, and login shells. | systemd is default in modern Linux.               |
| **`System Targets (Runlevels)`**                 | systemd Units          | Define what mode the system boots into (CLI or GUI).                            | Example: `multi-user.target`, `graphical.target`. |
| **`getty / Display Manager`**                    | User-space Program     | Provides user login interface (CLI or GUI).                                     | Example: `agetty`, `gdm`, `sddm`.                 |
| **`PAM (Pluggable Authentication Modules)`**     | Authentication Module  | User Authentication                                                             | Verifies user credentials for login sessions.     |
| **`User Shell / Desktop Environment`**           | Software Interface     | Loads user shell (bash, zsh) or desktop (GNOME, KDE).                           | Final stage of boot process.                      |
