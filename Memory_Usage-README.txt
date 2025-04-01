Overview
This script monitors the memory and swap usage on your system. It continuously updates every 2 seconds and displays the total, used, and free memory, as well as the total, used, and free swap memory. This is helpful for monitoring your system's memory resources in real-time and ensuring that your system isn't running low on memory or swap.

Features
Displays real-time memory usage (Total, Used, Free).

Displays real-time swap memory usage (Total, Used, Free).

Refreshes every 2 seconds for real-time monitoring.

Uses the free command to gather memory and swap information.

Prerequisites
The script requires the free command, which is standard on most Unix-based systems. No additional tools or dependencies are required.

How to Use the Script
1. Clone or Download the Script
You can either clone the repository or download the script directly to your system.

 
 
git clone https://github.com/yourusername/memory-swap-monitor.git
cd memory-swap-monitor
2. Make the Script Executable
Ensure the script has executable permissions:

 
 
chmod +x monitor_memory_swap.sh
3. Run the Script
To run the script and start monitoring memory and swap usage, use the following command:

 
 
./monitor_memory_swap.sh
The script will start and refresh memory and swap statistics every 2 seconds.

4. Stop the Script
To stop the script, press Ctrl + C in the terminal.

How the Script Works
The script uses the free command to fetch memory and swap statistics. It extracts and formats the output into a clean and readable table format that shows:

Memory Usage:

Total: Total amount of memory in the system.

Used: Amount of memory currently in use.

Free: Amount of unused memory.

Swap Usage:

Total: Total amount of swap memory available.

Used: Amount of swap memory currently in use.

Free: Amount of unused swap memory.

Example Output
yaml
 
Memory Usage:         Total: 16G | Used: 8.5G | Free: 7.5G
Swap Usage:          Total: 2G | Used: 512M | Free: 1.5G
The script will continue refreshing the output every 2 seconds to show real-time memory and swap usage.