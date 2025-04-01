This script is designed to perform a comprehensive security audit of a Linux server. It checks for user configurations, system settings, and implements recommended hardening measures to improve system security. It includes checks for users, groups, password security, IP configuration, SSH settings, and much more.

The script is structured in individual functions, and you can call each one individually to audit or implement specific hardening measures.

Usage
To use the script, follow these steps:

Download the script to your server or any machine where you want to run the audit.

Make the script executable:

 
 
chmod +x security_audit.sh
Run the script: Execute the script with the following command:

 
 
./security_audit.sh
This will run the main audit and hardening functions and display the output for each check.

Individual Function Usage
You can call each function individually by uncommenting the appropriate function calls in the script or by modifying the script to execute specific parts. Below are examples of how to use individual functions:

1. Listing Users and Groups
To list all users and groups on the server, run the following function:

 
 
list_users_and_groups
This will display a list of all users and groups configured on the system.

2. Checking Users with UID 0 (Root Privileges)
To check for users with UID 0 (root privileges), run:

 
 
check_uid_zero_users
This will output any users that have root privileges (UID 0).

3. Checking for Non-Standard Users
To check for non-standard users, run:

 
 
check_non_standard_users
This will list users who do not belong to the typical system users (e.g., root, bin, daemon, etc.).

4. Checking for Users with Weak or No Passwords
To check for users with no passwords or weak passwords, run:

 
 
check_passwords
This will display users with missing or weak passwords, including locked or expired accounts.

5. Checking IPv4 and IPv6 Configurations
To check the IPv4 and IPv6 configurations on your server, run:

 
 
check_ip_configurations
This will show the current IP addresses configured on your server.

6. Identifying Public vs. Private IP Addresses
To identify whether the system's IP addresses are public or private, run:

 
 
check_ip_address_type
This will list each IP address on the server and categorize it as either public or private.

7. Implementing Security Hardening Measures
To implement the hardening measures (disable root login, enforce strong passwords, disable SSH password authentication, disable unused services like telnet, and configure the firewall), run:

 
 
hardening_measures
This will apply security hardening best practices to improve system security.

Example of Full Audit Run
To run the entire security audit and hardening process, execute the main function:

 
 
main
This will run all the checks and apply the hardening measures.

Script Functions
Here is a list of the available functions and what they do:

list_users_and_groups
Lists all users and groups on the system.

check_uid_zero_users
Identifies users with UID 0 (root privileges).

check_non_standard_users
Identifies non-standard users (users that are not part of the typical system user list).

check_passwords
Checks for users with missing passwords or weak (locked/expired) passwords.

check_ip_configurations
Displays the server's IPv4 and IPv6 configurations.

check_ip_address_type
Identifies whether the system's IP addresses are public or private.

hardening_measures
Applies several security hardening measures, such as:

Disabling root login via SSH.

Enforcing a strong password policy.

Disabling SSH password authentication.

Disabling unused services (e.g., telnet).

Configuring the firewall to allow only SSH traffic.

Example Output
When running the script, you will see outputs similar to the following:

Users and Groups:
 
 
All Users on the system:
root
user1
user2

All Groups on the system:
root
users
sudo
...
Non-Standard Users:
 
 
Non-standard users found:
user1
user2
Password Check:
 
 
Users with no passwords:
user1
user2

Users with weak passwords (e.g., locked or expired passwords):
user1 LK
user2 NP
Hardening Measures:
 
 
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