This script automates various system security hardening tasks to help secure your Linux system. It includes functions to harden SSH, disable IPv6, secure the GRUB bootloader, configure a firewall using iptables, and enable automatic updates. Additionally, it can execute custom security checks defined in a configuration file.

Features:
Harden SSH configuration (disable root login, disable password authentication).

Disable IPv6 if not required.

Secure the GRUB bootloader with a password.

Configure an iptables firewall with a basic security policy.

Enable automatic security updates.

Execute custom security checks from an external configuration file.

Prerequisites:
A Linux-based system.

iptables, grub, systemctl, and dpkg (or equivalent tools) installed.

A configuration file (optional) with custom security checks.

How to Use the Script:
1. Clone or   the Script:
Save the script as security_hardening.sh.

2. Make the Script Executable:
In your terminal, navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x security_hardening.sh
3. Create the Configuration File for Custom Checks (Optional):
You can define custom security checks in a file named custom_security_checks.conf.

The file should contain one command per line. Comments can be added with the # symbol.

Example custom_security_checks.conf:

 
 
# Check if a security tool is installed
dpkg -l | grep fail2ban

# Check if a particular user exists
id username
4. Run the Script:
To run the security hardening script, execute the following command:

 
 
./security_hardening.sh
This will start the security audit and hardening process. The script will display informational messages about the tasks it is performing and log each action taken.

5. Exit the Script:
If you need to stop the script during execution, simply press CTRL+C in the terminal.

Example Output:
 
 
[INFO] Starting security audit and hardening process...
[INFO] Hardening SSH Configuration...
[INFO] SSH hardening completed.
[INFO] Disabling IPv6 if not required...
[INFO] IPv6 disabled.
[INFO] Securing the GRUB bootloader...
[INFO] GRUB bootloader secured.
[INFO] Configuring iptables firewall...
[INFO] Firewall configured.
[INFO] Configuring automatic updates...
[INFO] Automatic updates configured.
[INFO] Running custom security checks...
[INFO] Executing custom check: dpkg -l | grep fail2ban
[INFO] Executing custom check: id username
[INFO] Security audit and hardening process completed.
Calling Individual Parts of the Script
You can call individual parts of the script to perform specific hardening tasks without running the entire script. Below are examples of how to execute each task separately:

1. Harden SSH Configuration:
To only harden SSH, you can modify the script to just call the harden_ssh function:

 
 
#!/bin/ 
# Harden SSH configuration
harden_ssh
Usage:

 
 
./harden_ssh.sh
2. Disable IPv6:
If you want to disable IPv6, create a script that only calls the disable_ipv6 function:

 
 
#!/bin/ 
# Disable IPv6
disable_ipv6
Usage:

 
 
./disable_ipv6.sh
3. Secure GRUB Bootloader:
To secure the GRUB bootloader, use the following:

 
 
#!/bin/ 
# Secure GRUB bootloader
secure_grub
Usage:

 
 
./secure_grub.sh
4. Configure Firewall:
To configure the firewall, create a script that calls the configure_firewall function:

 
 
#!/bin/ 
# Configure firewall
configure_firewall
Usage:

 
 
./configure_firewall.sh
5. Configure Automatic Updates:
To enable automatic updates, use the following:

 
 
#!/bin/ 
# Configure automatic updates
configure_automatic_updates
Usage:

 
 
./configure_automatic_updates.sh
6. Run Custom Security Checks:
If you want to only run custom security checks defined in the custom_security_checks.conf file, use the following:

 
 
#!/bin/ 
# Run custom security checks
run_custom_checks
Usage:

 
 
./run_custom_checks.sh
Notes:
Root Privileges: The script needs to be run with root or sudo privileges to perform tasks such as modifying SSH configuration, managing firewall rules, and securing the GRUB bootloader.

Custom Security Checks: Custom security checks defined in custom_security_checks.conf will be executed after the default security hardening tasks.

Updating GRUB: If the script modifies the GRUB configuration, it will automatically update the bootloader settings. Ensure that you have proper backups of your system before making these changes.

