This script helps harden a Linux server by implementing various security measures. It includes configurations for SSH hardening, disabling IPv6 (if not needed), securing the GRUB bootloader, configuring the iptables firewall, and setting up automatic security updates.

Features:
SSH Hardening: Disables root login and enforces SSH key-based authentication.

Disables IPv6: Disables IPv6 if it’s not required.

Secures GRUB Bootloader: Sets a password for GRUB to prevent unauthorized access.

Configures iptables Firewall: Configures firewall rules to only allow essential traffic.

Automatic Updates: Configures automatic security updates.

Prerequisites:
A Linux server (Debian/Ubuntu or other Linux distributions).

Root or sudo privileges.

The following tools:

sshd (for SSH)

iptables (for firewall configuration)

unattended-upgrades (for automatic updates)

grub-mkpasswd-pbkdf2 (for securing GRUB)

How to Use:
1. Download or   the Script:
Save the script to a file, e.g., server_hardening.sh.

2. Make the Script Executable:
After saving the script, navigate to the directory where it is stored and make it executable:

 
 
chmod +x server_hardening.sh
3. Run the Script:
To execute the script, you need to run it with sudo (as it requires administrative privileges):

 
 
sudo ./server_hardening.sh
The script will perform all the hardening tasks and output progress to the terminal.

Running Individual Parts of the Script:
If you want to run only specific parts of the server hardening process, you can execute individual functions.

1. SSH Hardening:
To apply SSH hardening (disable root login and enforce SSH key-based authentication), run:

 
 
#!/bin/ 
# Example usage of harden_ssh
harden_ssh
Usage:

 
 
sudo ./harden_ssh.sh
2. Disable IPv6:
To disable IPv6 (if not required), run:

 
 
#!/bin/ 
# Example usage of disable_ipv6
disable_ipv6
Usage:

 
 
sudo ./disable_ipv6.sh
3. Secure GRUB Bootloader:
To secure the GRUB bootloader (set a password for GRUB), run:

 
 
#!/bin/ 
# Example usage of secure_grub
secure_grub
Usage:

 
 
sudo ./secure_grub.sh
4. Configure Firewall:
To configure iptables firewall (allow essential ports and block others), run:

 
 
#!/bin/ 
# Example usage of configure_firewall
configure_firewall
Usage:

 
 
sudo ./configure_firewall.sh
5. Configure Automatic Updates:
To configure automatic security updates (using unattended-upgrades), run:

 
 
#!/bin/ 
# Example usage of configure_automatic_updates
configure_automatic_updates
Usage:

 
 
sudo ./configure_automatic_updates.sh
Detailed Function Breakdown:
1. harden_ssh
Objective: Disables password authentication for the root user and enforces SSH key-based authentication.

Commands:

Modifies /etc/ssh/sshd_config to disable root login and password-based authentication.

Ensures the correct file permissions on the .ssh directory and authorized_keys file.

Restarts the SSH service (sshd) to apply changes.

2. disable_ipv6
Objective: Disables IPv6 on the server if it's not needed.

Commands:

Modifies /etc/sysctl.conf to disable IPv6.

Updates GRUB configuration to disable IPv6 at the bootloader level.

Applies the changes and prompts for a system reboot.

3. secure_grub
Objective: Secures the GRUB bootloader with a password.

Commands:

Adds a GRUB password using grub-mkpasswd-pbkdf2.

Modifies /etc/grub.d/40_custom to set a superuser and password.

Updates GRUB configuration.

4. configure_firewall
Objective: Configures iptables firewall to allow only essential traffic.

Commands:

Sets default policies to block all incoming and forwarding traffic.

Allows traffic on the loopback interface.

Opens ports for SSH (22), HTTP (80), and HTTPS (443).

Saves the iptables rules to /etc/iptables/rules.v4.

5. configure_automatic_updates
Objective: Configures automatic security updates to keep the system up to date.

Commands:

Installs unattended-upgrades if not already installed.

Configures the system to automatically install security updates.

Runs apt-get autoremove to remove unnecessary packages.

