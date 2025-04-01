#!/bin/bash

# Function to verify if a firewall is active and properly configured
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

# Function to check for open ports and their associated services
check_open_ports() {
    echo -e "\nChecking for open ports and their associated services..."
    
    # List open ports and associated services using netstat
    open_ports=$(netstat -tuln | awk '{print $4, $7}' | grep -v "0.0.0.0" | grep -v "::")
    
    if [ -z "$open_ports" ]; then
        echo "No open ports found."
    else
        echo -e "Open Ports and Associated Services:\n"
        echo "$open_ports"
    fi
}

# Function to check for IP forwarding and insecure network configurations
check_ip_forwarding() {
    echo -e "\nChecking for IP forwarding settings..."
    
    # Check if IP forwarding is enabled
    ip_forwarding=$(sysctl net.ipv4.ip_forward)
    if echo "$ip_forwarding" | grep -q "net.ipv4.ip_forward = 1"; then
        echo "IP forwarding is enabled. Disabling IP forwarding..."
        sysctl -w net.ipv4.ip_forward=0
        echo "IP forwarding has been disabled."
    else
        echo "IP forwarding is already disabled."
    fi
    
    # Check for other insecure network configurations like promiscuous mode
    promiscuous_mode=$(ifconfig | grep "PROMISC")
    if [ -n "$promiscuous_mode" ]; then
        echo "Warning: Network interface is in promiscuous mode."
    else
        echo "No promiscuous mode detected."
    fi
}

# Function to check for secure SSH configurations
check_ssh_security() {
    echo -e "\nChecking SSH security settings..."
    
    # Disable root login over SSH
    if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config; then
        echo "Root login is already disabled in SSH configuration."
    else
        echo "Disabling root login in SSH..."
        sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
        systemctl restart sshd
        echo "Root login has been disabled."
    fi
    
    # Disable password-based authentication
    if grep -q "^PasswordAuthentication no" /etc/ssh/sshd_config; then
        echo "Password authentication is already disabled."
    else
        echo "Disabling password authentication in SSH..."
        sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
        systemctl restart sshd
        echo "Password authentication has been disabled."
    fi
}

# Function to report and close unnecessary services
close_unnecessary_services() {
    echo -e "\nClosing unnecessary services..."
    
    # Example: disabling services like telnet and ftp if they're running
    unnecessary_services=("telnet" "ftp" "rsh" "tftp")
    for service in "${unnecessary_services[@]}"; do
        if systemctl is-active --quiet $service; then
            echo "$service is running. Stopping and disabling..."
            systemctl stop $service
            systemctl disable $service
        else
            echo "$service is not running."
        fi
    done
}

# Function to implement basic network security measures (e.g., disable unused network interfaces)
secure_network_config() {
    echo -e "\nImplementing basic network security measures..."
    
    # Disable unused network interfaces (example: eth0)
    unused_interfaces=("eth1" "eth2")
    for iface in "${unused_interfaces[@]}"; do
        if ip a show $iface &>/dev/null; then
            echo "Disabling unused network interface: $iface"
            ip link set $iface down
        fi
    done
}

# Function to check for IP address configuration (public vs private)
check_ip_address_type() {
    echo -e "\nChecking for public vs private IP address..."
    
    ip_addresses=$(hostname -I)
    for ip in $ip_addresses; do
        if [[ "$ip" =~ ^10\..* || "$ip" =~ ^172\.(1[6-9]|2[0-9]|3[0-1])\..* || "$ip" =~ ^192\.168\..* ]]; then
            echo "$ip is a private IP address."
        else
            echo "$ip is a public IP address."
        fi
    done
}

# Main function to run the audit and hardening tasks
main() {
    # Running the audit and hardening tasks
    echo -e "\nStarting security audit and hardening process..."
    
    # Verify firewall and network security
    verify_firewall
    check_open_ports
    check_ip_forwarding
    check_ssh_security
    close_unnecessary_services
    secure_network_config
    check_ip_address_type
    
    echo -e "\nSecurity audit and hardening process completed!"
}

# Run the main function
main
