This script displays the system's load average and CPU usage statistics in a terminal window. It provides a simple, live dashboard to monitor the system's resource usage over time.

Features:
Displays the system load average for the last 1, 5, and 15 minutes.

Shows CPU usage, including user, system, and idle percentages.

Refreshes the information every 2 seconds for real-time monitoring.

Prerequisites:
A Linux-based system with the uptime, top, and awk commands installed.

How to Use the Script:
Clone or   the Script:

  the script into a file, for example system_dashboard.sh.

Make the Script Executable: In your terminal, navigate to the directory where the script is saved and run the following command to make it executable:

 
 
chmod +x system_dashboard.sh
Run the Script: To start the dashboard, simply execute the script:

 
 
./system_dashboard.sh
The script will begin running and will output the system information in a clean format, refreshing every 2 seconds. It will display:

Load Average: The average load on your system for the past 1, 5, and 15 minutes.

CPU Usage: The percentage of CPU resources being used by the user, system processes, and the percentage of CPU that's idle.

Exit the Script: To stop the script, simply press CTRL+C in the terminal.

Example Output:
 
 
Load Average:        0.01, 0.05, 0.07
CPU Usage:           User: 18.4% | System: 5.3% | Idle: 76.3%
Calling Individual Parts of the Dashboard:
1. Displaying Load Average:
If you want to just display the system load average (without CPU usage), you can modify the script to call only the part that retrieves and prints the load average:

 
 
# Get the system load average (1, 5, 15 minutes)
load_avg=$(uptime | awk -F'load average:' '{ print $2 }' | sed 's/^ *//')

# Print the load average
echo "Load Average: $load_avg"
This will display the load average without the CPU usage information.

2. Displaying CPU Usage:
Similarly, if you only want to display CPU usage (user, system, and idle percentages), you can modify the script to call just the CPU usage section:

 
 
# Get CPU usage statistics (user, system, idle, etc.)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "User: " 100 - $1 "% | System: " $1 "% | Idle: " $2 "%"}')

# Print CPU usage
echo "CPU Usage: $cpu_usage"
This will output the CPU usage statistics without the load average information.

Notes:
The script uses the uptime and top commands to gather system information. These tools are available on most Linux distributions by default.

The script will clear the screen every 2 seconds and reprint the data, giving you a live dashboard view of your system's resource usage.