This script performs an audit of your server’s network security configurations and performs necessary hardening tasks. It includes checks for IP address configurations, SSH exposure, firewall status, security updates, and suspicious log entries.

Features:
IP Type Identification: Identifies whether an IP address is public or private.

SSH Exposure Check: Checks if SSH is exposed to public IPs and ensures this exposure is intentional.

Firewall Status: Verifies whether a firewall (UFW or iptables) is active and correctly configured.

Security Updates: Checks for available security updates and ensures automatic updates are enabled.

Suspicious Login Activity: Analyzes system logs for failed login attempts to detect potential security threats.

Prerequisites:
A Linux-based system.

Root or sudo privileges to modify system configurations.

The following tools should be installed on the system:

ufw (for UFW firewall management)

iptables (for firewall management)

ss (for socket status)

Package managers like apt (Debian/Ubuntu) or dnf (RHEL/CentOS/Fedora)

How to Use the Script:
1. Clone or   the Script:
Save the script to a file, for example, network_security_audit.sh.

2. Make the Script Executable:
In your terminal, navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x network_security_audit.sh
3. Run the Script:
To start the network security audit and hardening process, run the script:

 
 
sudo ./network_security_audit.sh
The script will check the status of various network security configurations and apply hardening measures. Make sure to run the script with sudo to ensure it has the necessary permissions to modify system configurations.

4. Exit the Script:
If you need to stop the script during execution, press CTRL+C in the terminal.

Example Output:
 
 
Starting security audit and hardening process...

IP addresses assigned to this server:
192.168.1.100 is a private IP address.
203.0.113.50 is a public IP address.

Checking if SSH service is exposed on public IPs...
SSH is exposed on public IP: 203.0.113.50. Ensure this is intentional.

Verifying Firewall Status...
UFW firewall is active.

Checking for available security updates...
Security updates available:
  libssl1.1 - Upgrade
  openssl - Upgrade

Ensuring automatic security updates are enabled...
Unattended upgrades are already enabled.

Checking logs for suspicious login attempts...
Recent failed SSH login attempts:
  Jun  2 15:22:33 server sshd[12345]: Failed password for root from 192.168.1.101 port 22 ssh2

Security audit and hardening process completed!
Calling Individual Parts of the Script
If you want to execute individual sections of the script, you can call specific functions. Below are examples of how to execute each part separately.

1. Check IP Addresses (Public vs. Private):
To gather and check whether your server's IP addresses are public or private, create a script that calls the gather_ip_addresses function:

 
 
#!/bin/ 
# Gather IP addresses and check if they are public or private
gather_ip_addresses
Usage:

 
 
sudo ./gather_ip_addresses.sh
2. Check SSH Exposure to Public IPs:
To check if SSH is exposed to public IPs, create a script that calls the check_ssh_exposure function:

 
 
#!/bin/ 
# Check SSH exposure
check_ssh_exposure
Usage:

 
 
sudo ./check_ssh_exposure.sh
3. Verify Firewall Status:
To verify if a firewall (UFW or iptables) is active and properly configured, create a script that calls the verify_firewall function:

 
 
#!/bin/ 
# Verify firewall status
verify_firewall
Usage:

 
 
sudo ./verify_firewall.sh
4. Check Security Updates:
To check for available security updates on the system, create a script that calls the check_security_updates function:

 
 
#!/bin/ 
# Check for security updates
check_security_updates
Usage:

 
 
sudo ./check_security_updates.sh
5. Ensure Automatic Updates are Enabled:
To ensure automatic security updates are enabled, create a script that calls the ensure_automatic_updates function:

 
 
#!/bin/ 
# Ensure automatic updates are enabled
ensure_automatic_updates
Usage:

 
 
sudo ./ensure_automatic_updates.sh
6. Check Suspicious Log Entries:
To check for suspicious log entries, such as failed login attempts, create a script that calls the check_log_for_suspicious_activity function:

 
 
#!/bin/ 
# Check for suspicious log entries
check_log_for_suspicious_activity
Usage:

 
 
sudo ./check_log_for_suspicious_activity.sh
Notes:
Root Privileges: The script must be run with root or sudo privileges to perform the necessary checks and changes.

Firewall Configuration: The script checks if UFW (Uncomplicated Firewall) is installed and active. If not, it checks if iptables is running and ensures that the firewall is correctly configured.

SSH Exposure: The script checks if the SSH service (port 22) is exposed on public IPs. If it's exposed on a public IP, it will provide a warning to ensure this exposure is intentional.

Security Updates: The script checks for available security updates and ensures that automatic updates are enabled to maintain a secure system.

Log Files: The script checks the system logs for failed login attempts (/var/log/auth.log or /var/log/secure) to detect potential brute-force attacks.

