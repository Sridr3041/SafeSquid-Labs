This script helps you perform an extensive security audit on a Linux server and implements necessary hardening measures. It checks for various security issues, such as unnecessary services, non-standard users, weak passwords, and insecure file permissions. Additionally, it implements hardening measures, including disabling root login, enforcing strong password policies, and configuring firewalls.

Features:
Service Audit: Identifies and stops unnecessary or unauthorized services, and ensures critical services are running.

Service Ports Check: Identifies services listening on insecure or non-standard ports.

User and Group Audit: Lists users, checks for users with root privileges, and identifies non-standard users.

Password Security: Checks for users with no passwords or weak passwords.

IP Configuration Check: Inspects the server’s IPv4 and IPv6 configurations and identifies private vs. public IP addresses.

File and Directory Permissions: Scans for world-writable files and directories.

SSH Configuration: Ensures .ssh directories have secure permissions and checks SSH configurations.

SUID/SGID Files: Scans for files with SUID/SGID bits set.

Hardening Measures: Implements hardening measures like disabling root login, setting a strong password policy, and configuring the firewall.

Prerequisites:
A Linux server (Debian/Ubuntu or other Linux distributions).

Root or sudo privileges.

Common tools like systemctl, ufw, netstat, passwd, and awk.

How to Use:
1. Download or   the Script:
Save the script to a file, e.g., server_security_audit.sh.

2. Make the Script Executable:
After saving the script, navigate to the directory where it is stored and make it executable:

 
 
chmod +x server_security_audit.sh
3. Run the Script:
To execute the script, you need to run it with sudo (as it requires administrative privileges):

 
 
sudo ./server_security_audit.sh
The script will perform all the security checks and hardening measures and output progress to the terminal.

Running Individual Parts of the Script:
If you want to run only specific parts of the security audit or hardening process, you can execute individual functions. Below are examples of how to use each function.

1. Service Audit:
To list all running services and check for unnecessary or unauthorized services, run:

 
 
#!/bin/ 
# Example usage of service_audit
service_audit
Usage:

 
 
sudo ./service_audit.sh
2. Check Service Ports:
To check for services listening on non-standard or insecure ports, run:

 
 
#!/bin/ 
# Example usage of check_service_ports
check_service_ports
Usage:

 
 
sudo ./check_service_ports.sh
3. List Users and Groups:
To list all users and groups on the server, run:

 
 
#!/bin/ 
# Example usage of list_users_and_groups
list_users_and_groups
Usage:

 
 
sudo ./list_users_and_groups.sh
4. Check Users with UID 0:
To check for users with root privileges (UID 0), run:

 
 
#!/bin/ 
# Example usage of check_uid_zero_users
check_uid_zero_users
Usage:

 
 
sudo ./check_uid_zero_users.sh
5. Check Non-Standard Users:
To check for non-standard users, run:

 
 
#!/bin/ 
# Example usage of check_non_standard_users
check_non_standard_users
Usage:

 
 
sudo ./check_non_standard_users.sh
6. Check for Users with Weak Passwords:
To check for users with no passwords or weak passwords, run:

 
 
#!/bin/ 
# Example usage of check_passwords
check_passwords
Usage:

 
 
sudo ./check_passwords.sh
7. Check IPv4 and IPv6 Configurations:
To check the server’s IPv4 and IPv6 configurations, run:

 
 
#!/bin/ 
# Example usage of check_ip_configurations
check_ip_configurations
Usage:

 
 
sudo ./check_ip_configurations.sh
8. Identify Public vs. Private IP Addresses:
To identify public vs. private IP addresses on the server, run:

 
 
#!/bin/ 
# Example usage of check_ip_address_type
check_ip_address_type
Usage:

 
 
sudo ./check_ip_address_type.sh
9. Check File and Directory Permissions:
To check for world-writable files and directories, run:

 
 
#!/bin/ 
# Example usage of check_file_permissions
check_file_permissions
Usage:

 
 
sudo ./check_file_permissions.sh
10. Check SSH Directory Permissions:
To check the permissions of .ssh directories, run:

 
 
#!/bin/ 
# Example usage of check_ssh_permissions
check_ssh_permissions
Usage:

 
 
sudo ./check_ssh_permissions.sh
11. Check SUID/SGID Files:
To check for files with SUID/SGID bits set, run:

 
 
#!/bin/ 
# Example usage of check_suid_sgid
check_suid_sgid
Usage:

 
 
sudo ./check_suid_sgid.sh
12. Implement Hardening Measures:
To implement the hardening measures (disable root login, set a strong password policy, configure firewall, etc.), run:

 
 
#!/bin/ 
# Example usage of hardening_measures
hardening_measures
Usage:

 
 
sudo ./hardening_measures.sh
Detailed Function Breakdown:
1. service_audit
Objective: Identifies unnecessary or unauthorized services and ensures critical services are running.

Checks: Lists running services and stops and disables unnecessary services like telnet and rsh.

2. check_service_ports
Objective: Checks if any services are listening on insecure or non-standard ports.

Checks: Identifies services listening on ports like FTP (21), Telnet (23), and others.

3. list_users_and_groups
Objective: Lists all users and groups on the server.

Checks: Extracts user and group information from /etc/passwd and /etc/group.

4. check_uid_zero_users
Objective: Identifies users with root privileges (UID 0).

Checks: Lists users with UID 0 in /etc/passwd.

5. check_non_standard_users
Objective: Identifies non-standard users.

Checks: Lists users who are not part of the standard user set (e.g., root, bin, daemon).

6. check_passwords
Objective: Checks for users with no passwords or weak passwords.

Checks: Scans users with no password or weak password status.

7. check_ip_configurations
Objective: Checks IPv4 and IPv6 configurations.

Checks: Displays current IP configurations for both IPv4 and IPv6.

8. check_ip_address_type
Objective: Identifies public vs. private IP addresses.

Checks: Identifies and classifies each IP address as public or private.

9. check_file_permissions
Objective: Scans for world-writable files and directories.

Checks: Searches the entire file system for world-writable files and directories.

10. check_ssh_permissions
Objective: Ensures .ssh directories have secure permissions.

Checks: Corrects permissions for .ssh directories to 700.

11. check_suid_sgid
Objective: Scans for files with SUID/SGID bits set.

Checks: Lists files with SUID or SGID set, which can be a security risk.

12. hardening_measures
Objective: Implements basic security hardening measures.

Checks: Disables root login, enforces strong password policy, disables unnecessary services, and configures a firewall.

