This script automates various security hardening tasks for your Linux server. It configures SSH settings, disables IPv6, secures the GRUB bootloader, sets up a firewall, and configures automatic updates. Additionally, it supports running custom checks, generating a security report, and sending email alerts if critical issues are found.

Features:
SSH Hardening: Disables root login via password and enforces key-based authentication.

IPv6 Management: Disables IPv6 if not required.

GRUB Bootloader Security: Secures the GRUB bootloader with a password.

Firewall Configuration: Configures iptables to secure the server's network access.

Automatic Updates: Configures automatic updates to ensure the server stays up-to-date with security patches.

Custom Security Checks: Supports custom security checks defined in an external configuration file.

Report Generation: Generates a summary report of all security hardening activities.

Email Alerts: Sends email alerts to the administrator if critical issues are detected.

Prerequisites:
A Linux-based server.

Root or sudo privileges.

The following tools must be installed:

sshd (SSH server)

iptables

unattended-upgrades (for automatic updates)

mail (for sending email alerts)

curl (to fetch the public IP address)

Script Configuration:
Before running the script, review and update the following configuration variables:

CONFIG_FILE: Path to the configuration file containing custom security checks (default: ./custom_security_checks.conf).

REPORT_FILE: Path to the report file (default: ./security_audit_report.txt).

LOG_FILE: Path to the log file where logs are stored (default: ./security_audit_log.txt).

ALERT_EMAIL: Email address to send alerts if critical issues are found (default: admin@example.com).

Make sure to change the ALERT_EMAIL variable to the appropriate email address.

How to Use the Script:
1. Clone or   the Script:
Save the script to a file, for example, security_audit.sh.

2. Make the Script Executable:
Navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x security_audit.sh
3. Configure the Script:
Before running the script, review and adjust the settings in the script, such as:

The ALERT_EMAIL for email alerts.

The CONFIG_FILE for any custom security checks you want to run.

4. Run the Script:
To start the security audit and hardening process, run the script with sudo to ensure it has the necessary permissions:

 
 
sudo ./security_audit.sh
The script will:

Harden SSH settings

Disable IPv6 (if not required)

Secure the GRUB bootloader

Configure iptables firewall

Set up automatic updates

Run any custom checks from the configuration file

Generate a security audit report

Send an email alert if critical issues are detected

5. View the Logs and Report:
The script generates two key files:

Log File: All activities are logged in the log file (security_audit_log.txt).

Report File: A summary of the audit is saved in the report file (security_audit_report.txt).

6. Check Email Alerts (Optional):
If critical issues are detected, an email will be sent to the specified ALERT_EMAIL with the details of the issues. Ensure that the mail command is installed and configured to send email alerts.

Running Individual Parts of the Script:
If you wish to execute individual parts of the script (e.g., just hardening SSH or configuring the firewall), you can directly call the corresponding function or create a separate script for each task.

1. SSH Hardening:
To run only the SSH hardening part of the script:

 
 
#!/bin/ 
# Run SSH Hardening
harden_ssh
Usage:

 
 
sudo ./harden_ssh.sh
2. Disable IPv6:
To disable IPv6 if it is not required:

 
 
#!/bin/ 
# Disable IPv6
disable_ipv6
Usage:

 
 
sudo ./disable_ipv6.sh
3. Secure GRUB Bootloader:
To secure the GRUB bootloader:

 
 
#!/bin/ 
# Secure GRUB bootloader
secure_grub
Usage:

 
 
sudo ./secure_grub.sh
4. Firewall Configuration:
To configure the firewall using iptables:

 
 
#!/bin/ 
# Configure iptables firewall
configure_firewall
Usage:

 
 
sudo ./configure_firewall.sh
5. Configure Automatic Updates:
To configure automatic updates:

 
 
#!/bin/ 
# Configure automatic updates
configure_automatic_updates
Usage:

 
 
sudo ./configure_automatic_updates.sh
6. Run Custom Security Checks:
To run custom security checks from the configuration file:

 
 
#!/bin/ 
# Run custom security checks
run_custom_checks
Usage:

 
 
sudo ./run_custom_checks.sh
7. Generate Report:
To generate a report from the script’s activities:

 
 
#!/bin/ 
# Generate security audit report
generate_report
Usage:

 
 
sudo ./generate_report.sh
8. Send Email Alert (if critical issues found):
To manually check for critical issues and send an email alert if needed:

 
 
#!/bin/ 
# Check for critical issues and send email alert
check_for_critical_issues
Usage:

 
 
sudo ./check_for_critical_issues.sh
