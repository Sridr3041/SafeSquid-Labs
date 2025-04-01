This script performs a comprehensive network security audit and applies hardening measures to ensure your system is secure. It verifies firewall status, checks for open ports, inspects IP forwarding settings, secures SSH configurations, disables unnecessary services, and implements basic network security measures such as disabling unused network interfaces.

Features:
Firewall Check: Verifies if a firewall is active and properly configured (UFW or iptables).

Open Ports Check: Identifies open ports and the associated services running on the system.

IP Forwarding Check: Checks if IP forwarding is enabled (disables it if necessary).

SSH Security: Ensures secure SSH configurations, including disabling root login and password authentication.

Close Unnecessary Services: Stops and disables unnecessary services like telnet and ftp.

Network Security: Disables unused network interfaces to prevent unauthorized access.

IP Address Type Check: Identifies public vs. private IP addresses for network configuration management.

Prerequisites:
A Linux-based system.

Root or sudo privileges to modify system configurations.

Tools like ufw, iptables, netstat, and sysctl should be available on the system.

How to Use the Script:
1. Clone or   the Script:
Save the script to a file, for example, network_security_audit.sh.

2. Make the Script Executable:
In your terminal, navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x network_security_audit.sh
3. Run the Script:
To start the network security audit and hardening process, run the script:

 
 
sudo ./network_security_audit.sh
The script will check the status of various network security configurations and apply hardening measures. Make sure to run the script with sudo to ensure that it has the necessary permissions to modify system configurations.

4. Exit the Script:
If you need to stop the script during execution, press CTRL+C in the terminal.

Example Output:
 
 
Starting security audit and hardening process...

Verifying Firewall Status...
UFW firewall is active.
Checking for open ports and their associated services...
Open Ports and Associated Services:
127.0.0.1:22 ssh
0.0.0.0:80  http

Checking for IP forwarding settings...
IP forwarding is already disabled.

Checking SSH security settings...
Root login is already disabled in SSH configuration.
Password authentication has been disabled.

Closing unnecessary services...
telnet is not running.
ftp is running. Stopping and disabling...
Network interface eth1 does not exist.
Network interface eth2 does not exist.

Checking for public vs private IP address...
192.168.1.1 is a private IP address.

Security audit and hardening process completed!
Calling Individual Parts of the Script
If you want to execute individual sections of the script, you can call the specific functions. Below are examples of how to execute each part separately.

1. Verify Firewall Status:
To verify the firewall status, create a script that calls the verify_firewall function:

 
 
#!/bin/ 
# Verify firewall status
verify_firewall
Usage:

 
 
sudo ./verify_firewall.sh
2. Check Open Ports and Associated Services:
To check for open ports and their associated services, create a script that calls the check_open_ports function:

 
 
#!/bin/ 
# Check open ports
check_open_ports
Usage:

 
 
sudo ./check_open_ports.sh
3. Check IP Forwarding:
To check and disable IP forwarding if enabled, create a script that calls the check_ip_forwarding function:

 
 
#!/bin/ 
# Check IP forwarding
check_ip_forwarding
Usage:

 
 
sudo ./check_ip_forwarding.sh
4. Check SSH Security Configurations:
To ensure secure SSH configurations, create a script that calls the check_ssh_security function:

 
 
#!/bin/ 
# Check SSH security settings
check_ssh_security
Usage:

 
 
sudo ./check_ssh_security.sh
5. Close Unnecessary Services:
To stop and disable unnecessary services (e.g., telnet, ftp), create a script that calls the close_unnecessary_services function:

 
 
#!/bin/ 
# Close unnecessary services
close_unnecessary_services
Usage:

 
 
sudo ./close_unnecessary_services.sh
6. Implement Basic Network Security Measures:
To implement basic network security measures, such as disabling unused network interfaces, create a script that calls the secure_network_config function:

 
 
#!/bin/ 
# Secure network configuration
secure_network_config
Usage:

 
 
sudo ./secure_network_config.sh
7. Check IP Address Type (Public vs. Private):
To check whether your IP addresses are public or private, create a script that calls the check_ip_address_type function:

 
 
#!/bin/ 
# Check for public vs private IP address
check_ip_address_type
Usage:

 
 
sudo ./check_ip_address_type.sh
Notes:
Root Privileges: The script must be run with root or sudo privileges to perform the necessary changes.

Firewall Configuration: This script first checks if UFW (Uncomplicated Firewall) is installed and active. If not, it checks if iptables is running and takes action accordingly.

Network Interface Management: The script disables unused network interfaces like eth1 and eth2. Modify the script to match your system's specific network interfaces.

Customization: You can customize the script to add additional checks or hardening measures specific to your system's needs.