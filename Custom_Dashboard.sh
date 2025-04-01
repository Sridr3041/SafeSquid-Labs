#!/bin/bash

# Function to display CPU usage
display_cpu_info() {
    # Get the CPU usage statistics
    cpu_info=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "User: " 100 - $1 "% | System: " $1 "% | Idle: " $2 "%"}')

    # Clear the screen
    clear

    # Print the CPU information in a horizontal table format
    printf "%-20s %-40s\n" "CPU Usage:" "$cpu_info"
}

# Function to display memory usage
display_memory_info() {
    # Get total, used, and free memory from 'free' command
    memory_info=$(free -h | grep Mem: | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4}')
    
    # Get swap memory usage from 'free' command
    swap_info=$(free -h | grep Swap: | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4}')

    # Clear the screen
    clear

    # Print the memory and swap information in a horizontal table format
    printf "%-20s %-40s\n" "Memory Usage:" "$memory_info"
    printf "%-20s %-40s\n" "Swap Usage:" "$swap_info"
}

# Function to display network usage
display_network_info() {
    # Get network statistics using 'netstat' for interface usage
    network_info=$(netstat -i | grep -E 'eth|wlan' | awk '{print "Interface: " $1 " | RX Bytes: " $3 " | TX Bytes: " $7}')

    # Clear the screen
    clear

    # Print network usage info in a horizontal table format
    printf "%-20s %-40s\n" "Network Usage:" "$network_info"
}

# Function to display disk usage
display_disk_info() {
    # Get disk usage using 'df' command
    disk_info=$(df -h | grep -E '^/dev' | awk '{print "Filesystem: " $1 " | Size: " $2 " | Used: " $3 " | Available: " $4 " | Mounted on: " $6}')
    
    # Clear the screen
    clear

    # Print disk usage info in a horizontal table format
    printf "%-20s %-40s\n" "Disk Usage:" "$disk_info"
}

# Function to display GPU usage (using nvidia-smi for NVIDIA GPUs)
display_gpu_info() {
    if command -v nvidia-smi &> /dev/null; then
        # Get GPU statistics using 'nvidia-smi'
        gpu_info=$(nvidia-smi --query-gpu=utilization.gpu,memory.total,memory.used,memory.free --format=csv,noheader,nounits)
        
        # Clear the screen
        clear

        # Print GPU usage info in a horizontal table format
        printf "%-20s %-40s\n" "GPU Usage:" "$gpu_info"
    else
        echo "NVIDIA GPU not detected or 'nvidia-smi' not installed."
    fi
}

# Function to display NPU usage (assuming the system supports NPU via a specific tool, e.g., 'npu-smi')
display_npu_info() {
    if command -v npu-smi &> /dev/null; then
        # Get NPU statistics (this is hypothetical, adjust based on your NPU tool)
        npu_info=$(npu-smi --query-gpu=utilization.npu,memory.total,memory.used,memory.free --format=csv,noheader,nounits)

        # Clear the screen
        clear

        # Print NPU usage info in a horizontal table format
        printf "%-20s %-40s\n" "NPU Usage:" "$npu_info"
    else
        echo "NPU not detected or 'npu-smi' not installed."
    fi
}

# Parse command-line options
while [[ $# -gt 0 ]]
do
    case $1 in
        -cpu)
            while true; do
                display_cpu_info
                sleep 2
            done
            ;;
        -memory)
            while true; do
                display_memory_info
                sleep 2
            done
            ;;
        -network)
            while true; do
                display_network_info
                sleep 2
            done
            ;;
        -disk)
            while true; do
                display_disk_info
                sleep 2
            done
            ;;
        -gpu)
            while true; do
                display_gpu_info
                sleep 2
            done
            ;;
        -npu)
            while true; do
                display_npu_info
                sleep 2
            done
            ;;
        *)
            echo "Usage: $0 {-cpu|-memory|-network|-disk|-gpu|-npu}"
            exit 1
            ;;
    esac
    shift
done
