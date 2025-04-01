#!/bin/bash

# Function to display memory usage and swap usage
display_memory_info() {
    # Get total, used, and free memory from 'free' command
    memory_info=$(free -h | grep Mem: | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4}')
    
    # Get swap memory usage from 'free' command
    swap_info=$(free -h | grep Swap: | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4}')

    # Clear the screen to refresh the display
    clear

    # Print the table with memory and swap information
    printf "%-20s %-40s\n" "Memory Usage:" "$memory_info"
    printf "%-20s %-40s\n" "Swap Usage:" "$swap_info"
}

# Run the script in a loop every 2 seconds
while true; do
    display_memory_info
    sleep 2
done
