#!/bin/bash

# Function to display system load and CPU usage
display_system_info() {
    # Get the system load average (1, 5, 15 minutes)
    load_avg=$(uptime | awk -F'load average:' '{ print $2 }' | sed 's/^ *//')

    # Get CPU usage statistics (user, system, idle, etc.)
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "User: " 100 - $1 "% | System: " $1 "% | Idle: " $2 "%"}')

    # Clear the screen
    clear

    # Print the table with system information
    printf "%-20s %-40s\n" "Load Average:" "$load_avg"
    printf "%-20s %-40s\n" "CPU Usage:" "$cpu_usage"
}

# Run the script in a loop every 2 seconds
while true; do
    display_system_info
    sleep 2
done
