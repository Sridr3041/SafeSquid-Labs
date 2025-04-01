#!/bin/bash

# Function to display process information
display_process_info() {
    # Get the number of active processes
    active_processes=$(ps aux --no-headers | wc -l)

    # Get the top 5 processes sorted by CPU usage
    top_cpu_processes=$(ps aux --sort=-%cpu --no-headers | head -n 5 | awk '{print $1, $3, $11, $12, $13, $14}')

    # Get the top 5 processes sorted by memory usage
    top_mem_processes=$(ps aux --sort=-%mem --no-headers | head -n 5 | awk '{print $1, $4, $11, $12, $13, $14}')

    # Clear the screen
    clear

    # Print the table with process information
    echo "Active Processes: $active_processes"
    printf "%-20s %-10s %-40s\n" "CPU Usage (%)" "Memory Usage (%)" "Process Name"
    echo "----------------------------------------------------------"
    
    # Display top 5 CPU-intensive processes
    echo "Top 5 Processes by CPU:"
    echo "$top_cpu_processes" | while read line; do
        printf "%-20s %-10s %-40s\n" $(echo $line)
    done

    echo ""

    # Display top 5 Memory-intensive processes
    echo "Top 5 Processes by Memory:"
    echo "$top_mem_processes" | while read line; do
        printf "%-20s %-10s %-40s\n" $(echo $line)
    done
}

# Run the script in a loop every 2 seconds
while true; do
    display_process_info
    sleep 2
done
