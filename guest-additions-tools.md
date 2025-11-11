# Guest-Additions Tools

- A package of drivers and tools installed inside the virtual machine (guest OS) when using VirtualBox.
- Guest Additions Improve
  - Screen Resolution
  - Mouse Cursor
  - File Transfer
  - Clipboard
  - Graphicsṭ
  - Time Sync
  - Performance
- Guest Additions make the virtual machine behave more like a real computer with smoother performance and full-screen experience.

## Installation

1. Start the Virtual Machine
2. Install required build tools

   - sudo yum update -y
   - sudo yum install epel-release gcc kernel-devel kernel-headers dkms make perl bzip2 -y

   (Guest Additions needs these tools to compile kernel modules)

3. Insert Guest Additions CD Image

   - VirtualBox Menu → Click → Devices → Insert Guest Additions CD Image

   (This mounts the ISO (usually at /run/media/$USER/VBox*GAs*\*))

4. Run the installer

   - auto-run appears → click Run
     <br/>OR
   - sudo /run/media/$USER/VBox*GAs*\*/VBoxLinuxAdditions.run

5. Reboot the VM

   - sudo reboot

6. Verify Installation
   - lsmod | grep -E "vboxguest|vboxsf|vboxvideo"
