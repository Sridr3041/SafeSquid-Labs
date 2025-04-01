Overview
This script provides a real-time monitoring dashboard for Linux systems. It displays key system metrics, including CPU usage, memory usage, disk usage, load averages, swap usage, and more. The script updates every 2 seconds to provide live monitoring of the system's performance.

Features
CPU Usage: Displays the current CPU usage percentage.

Memory Usage: Shows memory usage in percentage and a visual bar.

Disk Usage: Displays disk usage for the root filesystem (/) with a visual bar.

Load Average: Shows the system load averages for 1, 5, and 15 minutes.

Swap Usage: Displays swap space usage.

Disk Warning for /var: Checks if the /var directory usage exceeds 90% and triggers a warning.

Top Processes: Displays the top processes using the most CPU and memory.

How to Use the Script
1. Clone or Download the Script
You can clone this repository or download the script file monitor_dashboard.sh to your system.

 
 
git clone https://github.com/yourusername/system-monitor-dashboard.git
cd system-monitor-dashboard
2. Make the Script Executable
Ensure that the script has executable permissions by running the following command:

 
 
chmod +x monitor_dashboard.sh
3. Run the Script
To run the script, use the following command:

 
 
./monitor_dashboard.sh
The dashboard will start displaying the system's metrics. The output will refresh every 2 seconds.

Example Output
pgsql
 
+------------------------------------------+
|        SYSTEM MONITOR DASHBOARD         |
+------------------------------------------+
| CPU Usage: [######    ]  30%  Load Avg: 0.50 0.60 0.65 |
| Memory:    [#####     ]  60%  Swap: 200MB / 1024MB |
| Disk:      [##########]  80%  Warning: /var 95% used |
+------------------------------------------+
| Top Processes (CPU & Mem)               |
| PID   | Process Name    | CPU (%) | Mem (%) |
+------------------------------------------+
| 1234  | firefox         | 12.5    |  6.0    |
| 5678  | java            | 8.0     |  4.5    |
| 2345  | nginx           | 7.2     |  2.1    |
+------------------------------------------+
4. Stop the Script
To stop the script, press Ctrl + C.

Calling Individual Parts of the Dashboard
If you want to call individual parts of the dashboard or modify the script to display specific metrics, you can use the functions defined in the script.

Each section of the script is modularized into separate functions:

CPU Usage: get_cpu_usage

Memory Usage: get_memory_usage

Disk Usage: get_disk_usage

Load Average: get_load_avg

Swap Usage: get_swap_usage

Disk Warning for /var: check_var_usage

Top Processes: get_top_processes

Example: Get CPU Usage Only
If you want to print only the CPU usage, you can call the get_cpu_usage function like this:

 
 
CPU_DATA=$(get_cpu_usage)
echo $CPU_DATA
This will print the CPU usage percentage and the visual bar.

Example: Get Memory Usage Only
To display only the memory usage, you can modify the script to call the get_memory_usage function.

 
 
MEMORY_DATA=$(get_memory_usage)
echo $MEMORY_DATA