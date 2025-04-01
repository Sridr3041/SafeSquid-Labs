#!/bin/bash

while true; do
    clear
    
    # Get CPU usage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    CPU_USAGE=${CPU_USAGE%.*}  # Convert to integer
    CPU_BAR=$(printf "%-10s" "$(seq -s "#" $(( CPU_USAGE / 10 )) | tr -d '[:digit:]')")
    
    # Get Memory usage
    MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
    MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
    MEM_USAGE=$((MEM_USED * 100 / MEM_TOTAL))
    MEM_BAR=$(printf "%-10s" "$(seq -s "#" $(( MEM_USAGE / 10 )) | tr -d '[:digit:]')")
    
    # Get Disk usage
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    DISK_BAR=$(printf "%-10s" "$(seq -s "#" $(( DISK_USAGE / 10 )) | tr -d '[:digit:]')")
    
    # Get Load Averages
    LOAD_AVG=$(awk '{print $1, $2, $3}' /proc/loadavg)
    
    # Get Swap Usage
    SWAP_USED=$(free -m | awk '/Swap:/ {print $3}')
    SWAP_TOTAL=$(free -m | awk '/Swap:/ {print $2}')
    SWAP_INFO="${SWAP_USED}MB / ${SWAP_TOTAL}MB"
    
    # Get Disk Warning for /var
    VAR_USAGE=$(df -h /var 2>/dev/null | awk 'NR==2 {print $5}' | tr -d '%')
    VAR_WARNING="OK"
    if [[ -n "$VAR_USAGE" && "$VAR_USAGE" -gt 90 ]]; then
        VAR_WARNING="Warning: /var $VAR_USAGE% used"
    fi
    
    # Get Top Processes (CPU & Memory)
    TOP_PROCESSES=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -4 | awk 'NR>1 {printf "| %-5s | %-15s | %-6s | %-6s |\n", $1, $2, $3, $4}')
    
    # Print the Dashboard
    echo "+------------------------------------------+"
    echo "|        SYSTEM MONITOR DASHBOARD         |"
    echo "+------------------------------------------+"
    printf "| CPU Usage: [%-10s] %3s%%  Load Avg: %s |\n" "$CPU_BAR" "$CPU_USAGE" "$LOAD_AVG"
    printf "| Memory:    [%-10s] %3s%%  Swap: %s |\n" "$MEM_BAR" "$MEM_USAGE" "$SWAP_INFO"
    printf "| Disk:      [%-10s] %3s%%  %-25s |\n" "$DISK_BAR" "$DISK_USAGE" "$VAR_WARNING"
    echo "+------------------------------------------+"
    echo "| Top Processes (CPU & Mem)               |"
    echo "| PID   | Process Name    | CPU (%) | Mem (%) |"
    echo "+------------------------------------------+"
    echo "$TOP_PROCESSES"
    echo "+------------------------------------------+"
    
    # Wait for 2 seconds before refreshing
    sleep 2
done
