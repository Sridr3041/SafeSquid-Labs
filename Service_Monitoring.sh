#!/bin/bash

# Function to display the status of essential services
display_service_status() {
    # List of essential services to monitor
    services=("sshd" "nginx" "apache2" "iptables")

    # Clear the screen
    clear

    # Print the table header
    printf "%-20s %-15s\n" "Service Name" "Status"
    echo "--------------------------------------------"

    # Check the status of each service and print the result
    for service in "${services[@]}"; do
        # Check if the service is active
        if systemctl is-active --quiet $service; then
            status="Active"
        else
            status="Inactive"
        fi

        # Print the service name and its status
        printf "%-20s %-15s\n" "$service" "$status"
    done
}

# Run the script in a loop every 2 seconds
while true; do
    display_service_status
    sleep 2
done
