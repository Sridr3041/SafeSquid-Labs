#!/bin/bash

# Function to implement SSH hardening
harden_ssh() {
    echo -e "\nHardening SSH Configuration..."

    # Disable password authentication for root
    echo "Disabling password authentication for root in SSH config..."
    sed -i 's/^PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

    # Ensure SSH key-based authentication is enabled
    echo "Enabling SSH key-based authentication..."
    sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

    # Restart SSH service to apply changes
    systemctl restart sshd

    # Ensure the .ssh directory has correct permissions
    echo "Ensuring proper permissions for the .ssh directory..."
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys
    chown -R $USER:$USER ~/.ssh

    echo "SSH hardening completed."
}

# Function to disable IPv6 if not required
disable_ipv6() {
    echo -e "\nDisabling IPv6 if not required..."

    # Check if IPv6 is required, if not, disable it
    if ! sysctl -a | grep -q 'net.ipv6.conf.all.disable_ipv6 = 1'; then
        echo "Disabling IPv6..."
        echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
        echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
        sysctl -p

        # Disable IPv6 in GRUB (bootloader)
        if ! grep -q 'GRUB_CMDLINE_LINUX' /etc/default/grub; then
            echo "GRUB_CMDLINE_LINUX=\"ipv6.disable=1\"" >> /etc/default/grub
        else
            sed -i 's/GRUB_CMDLINE_LINUX=".*"/GRUB_CMDLINE_LINUX="ipv6.disable=1"/' /etc/default/grub
        fi

        # Update GRUB and reboot
        update-grub
        echo "IPv6 disabled. A reboot is required."
    else
        echo "IPv6 is already disabled."
    fi
}

# Function to secure the GRUB bootloader
secure_grub() {
    echo -e "\nSecuring the GRUB bootloader..."

    # Set a password for GRUB (if not already set)
    grub_password="your_secure_password_here"
    if ! grep -q 'set superusers=' /etc/grub.d/40_custom; then
        echo "Setting a GRUB password..."
        echo "set superusers=\"root\"" >> /etc/grub.d/40_custom
        echo "password_pbkdf2 root $(grub-mkpasswd-pbkdf2 | sed -n '2p' | awk '{print $NF}')" >> /etc/grub.d/40_custom

        # Update GRUB configuration
        update-grub
    else
        echo "GRUB is already secured with a password."
    fi
}

# Function to configure iptables firewall
configure_firewall() {
    echo -e "\nConfiguring iptables firewall..."

    # Set default policies (deny everything by default)
    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT ACCEPT

    # Allow loopback interface
    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT

    # Allow specific ports (e.g., SSH on port 22, HTTP on port 80, and HTTPS on port 443)
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT

    # Save iptables rules (ensure iptables-persistent is installed)
    iptables-save > /etc/iptables/rules.v4
    echo "iptables firewall configured."
}

# Function to configure automatic security updates
configure_automatic_updates() {
    echo -e "\nConfiguring automatic updates..."

    # Check if unattended-upgrades is installed
    if ! command -v unattended-upgrades &> /dev/null; then
        echo "Installing unattended-upgrades..."
        apt-get install -y unattended-upgrades
    fi

    # Enable automatic security updates
    echo "Enabling unattended-upgrades for automatic security updates..."
    dpkg-reconfigure -plow unattended-upgrades

    # Ensure that unused packages are removed
    apt-get autoremove -y

    echo "Automatic updates configured."
}

# Main function to run all the hardening steps
main() {
    echo -e "\nStarting server hardening process..."

    # Implement SSH hardening
    harden_ssh

    # Disable IPv6 if not required
    disable_ipv6

    # Secure the GRUB bootloader
    secure_grub

    # Configure firewall using iptables
    configure_firewall

    # Configure automatic updates
    configure_automatic_updates

    echo -e "\nServer hardening process completed!"
}

# Run the main function
main
