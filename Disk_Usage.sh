#!/bin/bash

# Function to display the disk usage
display_disk_usage() {
    # Clear the screen for each refresh
    clear

    # Print the header of the table
    echo -e "Filesystem\t\tUsed\tAvailable\tUse%\tMounted on"

    # Get disk usage for all mounted partitions
    df -h --output=source,used,avail,pcent,target | while read line; do
        # Skip the header line
        if [[ "$line" == *"Filesystem"* ]]; then
            continue
        fi

        # Extract the partition name, used space, available space, usage percent, and mount point
        partition=$(echo $line | awk '{print $1}')
        used=$(echo $line | awk '{print $2}')
        available=$(echo $line | awk '{print $3}')
        usage_percent=$(echo $line | awk '{print $4}' | sed 's/%//')
        mount_point=$(echo $line | awk '{print $5}')

        # Highlight partitions using more than 80% disk space
        if [ $usage_percent -gt 80 ]; then
            echo -e "\033[1;31m$partition\t$used\t$available\t$usage_percent%\t$mount_point\033[0m"
        else
            echo -e "$partition\t$used\t$available\t$usage_percent%\t$mount_point"
        fi
    done
}

# Loop to refresh the disk usage every 2 seconds
while true; do
    display_disk_usage
    sleep 2
done
