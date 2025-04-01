#!/bin/bash

# Function to identify whether an IP is public or private
check_ip_type() {
    local ip="$1"
    
    # Check if the IP is private
    if [[ "$ip" =~ ^10\..* || "$ip" =~ ^172\.(1[6-9]|2[0-9]|3[0-1])\..* || "$ip" =~ ^192\.168\..* ]]; then
        echo "$ip is a private IP address."
    else
        echo "$ip is a public IP address."
    fi
}

# Function to gather all IP addresses on the server
gather_ip_addresses() {
    # Get all IP addresses assigned to the server (IPv4 and IPv6)
    ip_addresses=$(hostname -I)
    if [ -z "$ip_addresses" ]; then
        echo "No IP addresses found on this server."
        return
    fi

    echo -e "\nIP addresses assigned to this server:"

    # Loop through all IP addresses and check if they are public or private
    for ip in $ip_addresses; do
        check_ip_type "$ip"
    done
}

# Function to check SSH exposure to public IPs
check_ssh_exposure() {
    echo -e "\nChecking if SSH service is exposed on public IPs..."

    # Get the IP addresses assigned to the server
    ip_addresses=$(hostname -I)
    for ip in $ip_addresses; do
        # Check if SSH is listening on this IP
        ssh_status=$(ss -tuln | grep ":22.*$ip")
        if [ -n "$ssh_status" ]; then
            # Check if the IP is public or private
            if [[ "$ip" =~ ^10\..* || "$ip" =~ ^172\.(1[6-9]|2[0-9]|3[0-1])\..* || "$ip" =~ ^192\.168\..* ]]; then
                echo "SSH is exposed on private IP: $ip."
            else
                echo "SSH is exposed on public IP: $ip. Ensure this is intentional."
            fi
        fi
    done
}

# Function to verify firewall is active and correctly configured
verify_firewall() {
    echo -e "\nVerifying Firewall Status..."
    
    # Check if UFW is installed and active
    if command -v ufw &> /dev/null; then
        ufw_status=$(ufw status verbose)
        if echo "$ufw_status" | grep -q "Status: active"; then
            echo "UFW firewall is active."
        else
            echo "UFW firewall is not active. Enabling UFW..."
            ufw enable
        fi
    else
        echo "UFW is not installed. Checking iptables..."
        
        # Check if iptables is running
        if systemctl is-active --quiet iptables; then
            echo "Iptables is active."
        else
            echo "Iptables is not active. Starting iptables..."
            systemctl start iptables
            systemctl enable iptables
        fi
    fi
}

# Function to check available security updates/patches
check_security_updates() {
    echo -e "\nChecking for available security updates..."

    # Check if the system is using APT (Debian/Ubuntu) or DNF (RHEL/CentOS/Fedora)
    if command -v apt-get &> /dev/null; then
        # For Debian-based systems (Ubuntu, Debian)
        updates=$(apt-get -s upgrade | grep -i security)
        if [ -n "$updates" ]; then
            echo "Security updates available:"
            echo "$updates"
        else
            echo "No security updates available."
        fi
    elif command -v dnf &> /dev/null; then
        # For RHEL/CentOS/Fedora systems
        updates=$(dnf updateinfo list security)
        if [ -n "$updates" ]; then
            echo "Security updates available:"
            echo "$updates"
        else
            echo "No security updates available."
        fi
    else
        echo "Unknown package manager. Cannot check security updates."
    fi
}

# Function to ensure automatic security updates are enabled
ensure_automatic_updates() {
    echo -e "\nEnsuring automatic security updates are enabled..."

    # Check for APT (Debian/Ubuntu) or DNF (RHEL/CentOS/Fedora)
    if command -v apt-get &> /dev/null; then
        # For Debian-based systems (Ubuntu, Debian)
        if command -v unattended-upgrades &> /dev/null; then
            status=$(systemctl is-active unattended-upgrades)
            if [[ "$status" == "active" ]]; then
                echo "Unattended upgrades are already enabled."
            else
                echo "Enabling unattended upgrades..."
                systemctl start unattended-upgrades
                systemctl enable unattended-upgrades
            fi
        else
            echo "Unattended-upgrades package is not installed. Installing it now..."
            apt-get install -y unattended-upgrades
            systemctl start unattended-upgrades
            systemctl enable unattended-upgrades
        fi
    elif command -v dnf &> /dev/null; then
        # For RHEL/CentOS/Fedora systems
        if ! grep -q "apply_updates = yes" /etc/dnf/automatic.conf; then
            echo "Configuring automatic updates for DNF..."
            sed -i 's/^apply_updates = no/apply_updates = yes/' /etc/dnf/automatic.conf
            systemctl start dnf-automatic.timer
            systemctl enable dnf-automatic.timer
        else
            echo "Automatic updates are already enabled for DNF."
        fi
    else
        echo "Unknown package manager. Cannot configure automatic updates."
    fi
}

# Function to check for suspicious log entries (failed login attempts)
check_log_for_suspicious_activity() {
    echo -e "\nChecking logs for suspicious login attempts..."

    # Check the most recent SSH login attempts in auth.log or secure.log
    if [ -f /var/log/auth.log ]; then
        failed_logins=$(grep "Failed password" /var/log/auth.log | tail -n 20)
        if [ -n "$failed_logins" ]; then
            echo "Recent failed SSH login attempts:"
            echo "$failed_logins"
        else
            echo "No recent failed SSH login attempts found."
        fi
    elif [ -f /var/log/secure ]; then
        failed_logins=$(grep "Failed password" /var/log/secure | tail -n 20)
        if [ -n "$failed_logins" ]; then
            echo "Recent failed SSH login attempts:"
            echo "$failed_logins"
        else
            echo "No recent failed SSH login attempts found."
        fi
    else
        echo "No log files found to check for failed login attempts."
    fi
}

# Main function to run the audit and hardening tasks
main() {
    echo -e "\nStarting security audit and hardening process..."

    # IP and Network Configuration Checks
    gather_ip_addresses
    check_ssh_exposure
    
    # Verify firewall and network security
    verify_firewall
    
    # Security Updates and Patching
    check_security_updates
    ensure_automatic_updates

    # Check for suspicious log entries
    check_log_for_suspicious_activity

    echo -e "\nSecurity audit and hardening process completed!"
}

# Run the main function
main
