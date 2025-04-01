#!/bin/bash

# Function to list all users and groups on the server
list_users_and_groups() {
    echo -e "\nListing all users and groups on the server..."
    echo -e "\nAll Users on the system:"
    cut -d: -f1 /etc/passwd
    echo -e "\nAll Groups on the system:"
    cut -d: -f1 /etc/group
}

# Function to check for users with UID 0 (root privileges)
check_uid_zero_users() {
    echo -e "\nChecking for users with UID 0 (root privileges)..."
    users_with_uid_zero=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
    if [ -z "$users_with_uid_zero" ]; then
        echo "No users with UID 0 found."
    else
        echo "Users with UID 0 (root privileges):"
        echo "$users_with_uid_zero"
    fi
}

# Function to identify and report non-standard users
check_non_standard_users() {
    echo -e "\nChecking for non-standard users..."
    standard_users="root|bin|daemon|sys|sync|games|man|lp|mail|news|uucp|proxy|www-data|backup|list|irc|gnats|nobody"
    non_standard_users=$(awk -F: -v std_users="$standard_users" '$7 != "/sbin/nologin" && $7 != "/bin/false" && $1 !~ std_users {print $1}' /etc/passwd)
    if [ -z "$non_standard_users" ]; then
        echo "No non-standard users found."
    else
        echo "Non-standard users found:"
        echo "$non_standard_users"
    fi
}

# Function to check for users without passwords or with weak passwords
check_passwords() {
    echo -e "\nChecking for users with no passwords or weak passwords..."
    no_password_users=$(awk -F: '($2 == "" || $2 == "x") {print $1}' /etc/passwd)
    if [ -z "$no_password_users" ]; then
        echo "No users with no passwords found."
    else
        echo "Users with no passwords:"
        echo "$no_password_users"
    fi
    echo -e "\nUsers with weak passwords (locked or expired):"
    passwd -S $(cut -d: -f1 /etc/passwd) | grep -E "LK|NP"
}

# Function to check IPv4 and IPv6 configurations
check_ip_configurations() {
    echo -e "\nChecking IPv4 and IPv6 configurations..."
    echo -e "\nIPv4 Configuration:"
    ip -4 addr show
    echo -e "\nIPv6 Configuration:"
    ip -6 addr show
}

# Function to identify public vs. private IP addresses
check_ip_address_type() {
    echo -e "\nIdentifying public vs. private IP addresses..."
    ip_addresses=$(hostname -I)
    for ip in $ip_addresses; do
        if [[ "$ip" =~ ^10\..* || "$ip" =~ ^172\.(1[6-9]|2[0-9]|3[0-1])\..* || "$ip" =~ ^192\.168\..* ]]; then
            echo "$ip is a private IP address."
        else
            echo "$ip is a public IP address."
        fi
    done
}

# Function to check file and directory permissions
check_file_permissions() {
    echo -e "\nScanning for files and directories with world-writable permissions..."
    find / -type f -perm -002 -exec ls -l {} \; 2>/dev/null
    echo -e "\nChecking for directories with world-writable permissions..."
    find / -type d -perm -002 -exec ls -ld {} \; 2>/dev/null
}

# Function to check the permissions of .ssh directories
check_ssh_permissions() {
    echo -e "\nChecking for .ssh directories and ensuring secure permissions..."
    find /home -name ".ssh" -type d -exec ls -ld {} \; 2>/dev/null
    find /home -name ".ssh" -type d -exec chmod 700 {} \; 2>/dev/null
}

# Function to check files with SUID/SGID bits set
check_suid_sgid() {
    echo -e "\nScanning for files with SUID/SGID bits set..."
    find / -type f \( -perm -4000 -o -perm -2000 \) -exec ls -l {} \; 2>/dev/null
}

# Function to implement hardening measures
hardening_measures() {
    echo -e "\nImplementing hardening measures..."

    # 1. Ensure root login is disabled
    echo -e "\nDisabling root login..."
    if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config; then
        echo "Root login is already disabled."
    else
        sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
        systemctl restart sshd
        echo "Root login has been disabled."
    fi

    # 2. Set a strong password policy (min length 12)
    echo -e "\nSetting a strong password policy..."
    if ! grep -q "minlen" /etc/login.defs; then
        echo "minlen = 12" >> /etc/login.defs
        echo "Password length has been set to 12 characters."
    else
        sed -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN 12/' /etc/login.defs
        echo "Password length has been set to 12 characters."
    fi

    # 3. Ensure SSH password authentication is disabled
    echo -e "\nDisabling SSH password authentication..."
    if grep -q "^PasswordAuthentication no" /etc/ssh/sshd_config; then
        echo "Password authentication is already disabled."
    else
        sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
        systemctl restart sshd
        echo "Password authentication has been disabled."
    fi

    # 4. Disable unused services (example: telnet)
    echo -e "\nDisabling unused services (e.g., telnet)..."
    systemctl disable telnet.socket
    systemctl stop telnet.socket
    echo "Telnet has been disabled."

    # 5. Configure firewall (example with UFW)
    echo -e "\nConfiguring firewall..."
    if command -v ufw &> /dev/null; then
        ufw enable
        ufw allow ssh
        echo "Firewall has been configured with SSH allowed."
    else
        echo "UFW firewall is not installed. Please install it manually for hardening."
    fi
}

# Main function to run the audit and hardening checks
main() {
    list_users_and_groups
    check_uid_zero_users
    check_non_standard_users
    check_passwords
    check_ip_configurations
    check_ip_address_type
    check_file_permissions
    check_ssh_permissions
    check_suid_sgid
    hardening_measures
}

# Run the main function
main
