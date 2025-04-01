This script automates several important security checks and configurations for your Linux server. It performs tasks such as identifying public and private IPs, checking if SSH is exposed to public IPs, verifying firewall status, checking for security updates, and ensuring automatic updates are enabled.

Features:
Identify Public/Private IPs: Checks whether an IP address is public or private.

SSH Exposure Check: Verifies if SSH service is exposed on public IPs.

Firewall Check: Verifies if the firewall is active and properly configured.

Security Updates Check: Checks for available security updates.

Automatic Security Updates: Ensures automatic updates are enabled for security patches.

Prerequisites:
A Linux-based server (Debian/Ubuntu, RHEL/CentOS/Fedora).

Root or sudo privileges.

Required tools:

ss (for checking network connections)

ufw (for firewall management, optional)

iptables (for firewall management, optional)

apt-get (for Debian-based systems)

dnf (for RedHat-based systems)

unattended-upgrades (for Debian-based systems, optional)

How to Use the Script:
1. Download or   the Script:
Save the script to a file, for example, server_security.sh.

2. Make the Script Executable:
Navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x server_security.sh
3. Run the Script:
To start the security audit and hardening process, run the script with sudo to ensure it has the necessary privileges to perform system-level tasks:

 
 
sudo ./server_security.sh
The script will:

Gather and check all assigned IP addresses.

Verify if SSH is exposed to public IPs.

Check if the firewall (UFW or iptables) is active.

Check for available security updates and patches.

Ensure automatic updates are enabled.

4. View Output:
The script provides output directly to the terminal, indicating the status of each security check. If any issue is found, it will suggest further actions.

Running Individual Parts of the Script:
If you'd like to run specific parts of the script individually (for example, just check SSH exposure or verify the firewall status), you can call specific functions directly. Below are examples of how to call each part of the script individually:

1. Check IP Type (Private or Public):
To check if a specific IP address is public or private:

 
 
#!/bin/ 
# Example usage of check_ip_type
check_ip_type "192.168.1.1"
Usage:

 
 
sudo ./check_ip_type.sh
2. Gather All IP Addresses and Identify Public/Private IPs:
To gather and display all IP addresses assigned to the server and determine if they are public or private:

 
 
#!/bin/ 
# Example usage of gather_ip_addresses
gather_ip_addresses
Usage:

 
 
sudo ./gather_ip_addresses.sh
3. Check SSH Exposure on Public IPs:
To check if the SSH service is exposed on public IPs:

 
 
#!/bin/ 
# Example usage of check_ssh_exposure
check_ssh_exposure
Usage:

 
 
sudo ./check_ssh_exposure.sh
4. Verify Firewall Status:
To check if the firewall is active and properly configured:

 
 
#!/bin/ 
# Example usage of verify_firewall
verify_firewall
Usage:

 
 
sudo ./verify_firewall.sh
5. Check for Available Security Updates:
To check for available security updates for the system:

 
 
#!/bin/ 
# Example usage of check_security_updates
check_security_updates
Usage:

 
 
sudo ./check_security_updates.sh
6. Ensure Automatic Security Updates are Enabled:
To ensure automatic security updates are enabled:

 
 
#!/bin/ 
# Example usage of ensure_automatic_updates
ensure_automatic_updates
Usage:

 
 
sudo ./ensure_automatic_updates.sh
Detailed Function Breakdown:
1. check_ip_type:
This function checks whether the given IP address is a public or private IP. It supports IPv4 addresses and checks for common private IP ranges:

10.x.x.x

172.16.x.x to 172.31.x.x

192.168.x.x

2. gather_ip_addresses:
This function gathers all IP addresses assigned to the server and calls check_ip_type to classify each address as public or private.

3. check_ssh_exposure:
This function checks whether SSH is exposed to any public IP addresses. It does this by looking at the server's IP addresses and checking if port 22 (SSH) is open on those addresses. If an SSH service is found on a public IP, it raises a warning.

4. verify_firewall:
This function checks whether a firewall (either UFW or iptables) is active and correctly configured. It will attempt to enable UFW if it's not active, or ensure iptables is running if UFW is not installed.

5. check_security_updates:
This function checks for available security updates on Debian-based systems (using apt-get) and RedHat-based systems (using dnf). It will show you a list of available security updates if any are found.

6. ensure_automatic_updates:
This function ensures that automatic security updates are enabled on your server. On Debian-based systems, it checks if unattended-upgrades is installed and active, and on RedHat-based systems, it ensures the dnf-automatic timer is enabled.

