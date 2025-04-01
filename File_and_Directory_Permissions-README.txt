This script performs a security audit and implements hardening measures on your Linux system. It checks for various security configurations, including user management, password policies, network settings, file permissions, and more. It also implements hardening measures such as disabling root login, setting strong password policies, disabling unused services, and configuring the firewall.

Features:
List all users and groups on the system.

Check for users with UID 0 (root privileges).

Identify non-standard users.

Check for users with no passwords or weak passwords.

Check IPv4 and IPv6 configurations.

Identify public vs. private IP addresses.

Scan for world-writable files and directories.

Check the permissions of .ssh directories.

Check for files with SUID/SGID bits set.

Implement security hardening measures.

Prerequisites:
A Linux-based system.

Required tools like ufw, ip, and systemctl (UFW firewall is optional for some firewall configurations).

Root or sudo privileges to modify system configurations.

How to Use the Script:
1. Clone or   the Script:
Save the script to a file, for example security_audit_hardening.sh.

2. Make the Script Executable:
In your terminal, navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x security_audit_hardening.sh
3. Run the Script:
To start the security audit and hardening process, simply run the script:

 
 
sudo ./security_audit_hardening.sh
The script will output the results of the checks and apply hardening measures. Make sure to run the script with sudo to ensure that the script has the necessary permissions to modify system configurations.

4. Exit the Script:
If you need to stop the script during execution, press CTRL+C in the terminal.

Example Output:
 
 
Listing all users and groups on the server...
All Users on the system:
root
user1
user2

All Groups on the system:
root
users
...

Checking for users with UID 0 (root privileges)...
Users with UID 0 (root privileges):
root

Checking for non-standard users...
Non-standard users found:
user2

Checking for users with no passwords or weak passwords...
Users with no passwords:
user1
Users with weak passwords (locked or expired):
user2 NP

Checking IPv4 and IPv6 configurations...
IPv4 Configuration:
...
IPv6 Configuration:
...

Scanning for files with world-writable permissions...
...

Implementing hardening measures...
Disabling root login...
Root login has been disabled.

Setting a strong password policy...
Password length has been set to 12 characters.

Disabling SSH password authentication...
Password authentication has been disabled.

Disabling unused services (e.g., telnet)...
Telnet has been disabled.

Configuring firewall...
Firewall has been configured with SSH allowed.
Calling Individual Parts of the Script
You can execute individual parts of the script to perform specific security checks or hardening measures. Below are examples of how to execute each part separately.

1. List Users and Groups:
To list all users and groups on the system, create a script that calls the list_users_and_groups function:

 
 
#!/bin/ 
# List all users and groups
list_users_and_groups
Usage:

 
 
sudo ./list_users_and_groups.sh
2. Check for Users with UID 0 (root privileges):
To check for users with UID 0 (root privileges), create a script that calls the check_uid_zero_users function:

 
 
#!/bin/ 
# Check for users with UID 0
check_uid_zero_users
Usage:

 
 
sudo ./check_uid_zero_users.sh
3. Check for Non-standard Users:
To check for non-standard users, create a script that calls the check_non_standard_users function:

 
 
#!/bin/ 
# Check for non-standard users
check_non_standard_users
Usage:

 
 
sudo ./check_non_standard_users.sh
4. Check Users with No Passwords or Weak Passwords:
To check for users with no passwords or weak passwords, create a script that calls the check_passwords function:

 
 
#!/bin/ 
# Check users with no passwords or weak passwords
check_passwords
Usage:

 
 
sudo ./check_passwords.sh
5. Check IPv4 and IPv6 Configurations:
To check the system’s IPv4 and IPv6 configurations, create a script that calls the check_ip_configurations function:

 
 
#!/bin/ 
# Check IPv4 and IPv6 configurations
check_ip_configurations
Usage:

 
 
sudo ./check_ip_configurations.sh
6. Check for Public vs. Private IP Addresses:
To check for public vs. private IP addresses, create a script that calls the check_ip_address_type function:

 
 
#!/bin/ 
# Check for public vs. private IP addresses
check_ip_address_type
Usage:

 
 
sudo ./check_ip_address_type.sh
7. Check File Permissions (World-writable files and directories):
To check for world-writable files and directories, create a script that calls the check_file_permissions function:

 
 
#!/bin/ 
# Check file permissions (world-writable files and directories)
check_file_permissions
Usage:

 
 
sudo ./check_file_permissions.sh
8. Check SSH Directory Permissions:
To check the permissions of .ssh directories, create a script that calls the check_ssh_permissions function:

 
 
#!/bin/ 
# Check SSH directory permissions
check_ssh_permissions
Usage:

 
 
sudo ./check_ssh_permissions.sh
9. Check for SUID/SGID Files:
To check for files with SUID/SGID bits set, create a script that calls the check_suid_sgid function:

 
 
#!/bin/ 
# Check for SUID/SGID files
check_suid_sgid
Usage:

 
 
sudo ./check_suid_sgid.sh
10. Implement Hardening Measures:
To implement hardening measures, create a script that calls the hardening_measures function:

 
 
#!/bin/ 
# Implement hardening measures
hardening_measures
Usage:

 
 
sudo ./hardening_measures.sh
Notes:
Root Privileges: The script must be run with root or sudo privileges to perform the necessary changes.

Firewall Configuration: This script uses UFW (Uncomplicated Firewall) for configuring the firewall. If UFW is not installed, you may need to install it or modify the script to use a different firewall tool.

Customization: You can customize the script to add additional checks or hardening measures specific to your system's needs.