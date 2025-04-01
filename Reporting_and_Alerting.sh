#!/bin/bash

# Path to the configuration file containing custom security checks
CONFIG_FILE="./custom_security_checks.conf"
REPORT_FILE="./security_audit_report.txt"
LOG_FILE="./security_audit_log.txt"
ALERT_EMAIL="admin@example.com"  # Change to the appropriate email

# Function to log and display messages
log_message() {
    echo -e "[INFO] $1"
    echo -e "[INFO] $1" >> "$LOG_FILE"
}

# Function to log errors
log_error() {
    echo -e "[ERROR] $1"
    echo -e "[ERROR] $1" >> "$LOG_FILE"
}

# Function to implement SSH hardening
harden_ssh() {
    log_message "Hardening SSH Configuration..."
    
    # Disable password authentication for root
    sed -i 's/^PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

    # Enable SSH key-based authentication and disable password authentication
    sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

    # Restart SSH service
    systemctl restart sshd

    log_message "SSH hardening completed."
}

# Function to disable IPv6 if not required
disable_ipv6() {
    log_message "Disabling IPv6 if not required..."

    # Disable IPv6
    echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
    echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
    sysctl -p

    # Update GRUB configuration
    sed -i 's/GRUB_CMDLINE_LINUX=".*"/GRUB_CMDLINE_LINUX="ipv6.disable=1"/' /etc/default/grub
    update-grub

    log_message "IPv6 disabled."
}

# Function to secure GRUB bootloader
secure_grub() {
    log_message "Securing the GRUB bootloader..."

    # Set a password for GRUB (if not already set)
    grub_password="your_secure_password_here"
    if ! grep -q 'set superusers=' /etc/grub.d/40_custom; then
        echo "set superusers=\"root\"" >> /etc/grub.d/40_custom
        echo "password_pbkdf2 root $(grub-mkpasswd-pbkdf2 | sed -n '2p' | awk '{print $NF}')" >> /etc/grub.d/40_custom
        update-grub
    fi

    log_message "GRUB bootloader secured."
}

# Function to configure iptables firewall
configure_firewall() {
    log_message "Configuring iptables firewall..."

    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT ACCEPT

    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT

    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT

    iptables-save > /etc/iptables/rules.v4

    log_message "Firewall configured."
}

# Function to configure automatic updates
configure_automatic_updates() {
    log_message "Configuring automatic updates..."

    if ! command -v unattended-upgrades &> /dev/null; then
        apt-get install -y unattended-upgrades
    fi

    dpkg-reconfigure -plow unattended-upgrades
    apt-get autoremove -y

    log_message "Automatic updates configured."
}

# Function to run custom checks from the configuration file
run_custom_checks() {
    log_message "Running custom security checks..."

    if [[ -f "$CONFIG_FILE" ]]; then
        while IFS= read -r line; do
            # Ignore empty lines and comments
            [[ -z "$line" || "$line" == \#* ]] && continue

            # Execute the custom check defined in the configuration file
            log_message "Executing custom check: $line"
            bash -c "$line"
        done < "$CONFIG_FILE"
    else
        log_message "No custom checks defined. Skipping..."
    fi
}

# Function to generate a summary report
generate_report() {
    log_message "Generating security audit report..."

    echo "Security Audit and Hardening Report" > "$REPORT_FILE"
    echo "-----------------------------------" >> "$REPORT_FILE"
    cat "$LOG_FILE" >> "$REPORT_FILE"

    log_message "Report generated: $REPORT_FILE"
}

# Function to send email alert (if critical issues are found)
send_email_alert() {
    log_message "Sending email alert..."

    if command -v mail &> /dev/null; then
        mail -s "Security Audit Alert: Critical Issues Found" "$ALERT_EMAIL" < "$REPORT_FILE"
        log_message "Email alert sent to $ALERT_EMAIL."
    else
        log_error "Email command 'mail' not found. Email alert not sent."
    fi
}

# Function to check for critical issues (example)
check_for_critical_issues() {
    log_message "Checking for critical issues..."

    # Check for SSH being exposed on public IP
    public_ip=$(curl -s ifconfig.me)
    if [[ "$public_ip" == "0.0.0.0" ]]; then
        log_error "Critical: No public IP detected."
    else
        log_message "Public IP detected: $public_ip."
    fi

    # Example condition to trigger email alert (if any critical issue is found)
    if grep -q "Critical" "$LOG_FILE"; then
        send_email_alert
    fi
}

# Main function to run all hardening and audit steps
main() {
    log_message "Starting security audit and hardening process..."

    # Run the default security hardening steps
    harden_ssh
    disable_ipv6
    secure_grub
    configure_firewall
    configure_automatic_updates

    # Run custom checks defined in the configuration file
    run_custom_checks

    # Generate summary report
    generate_report

    # Check for critical issues and send alert if needed
    check_for_critical_issues

    log_message "Security audit and hardening process completed."
}

# Run the main function
main
