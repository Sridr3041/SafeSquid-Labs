Overview
This script monitors disk usage on all mounted partitions of your system and displays the statistics in a human-readable table format. It continuously refreshes every 2 seconds and highlights partitions that are over 80% full in red. This is useful for keeping track of your disk usage and ensuring that partitions do not fill up too quickly.

Features
Displays disk usage statistics for all mounted partitions.

Highlights partitions using more than 80% disk space in red.

Refreshes every 2 seconds for real-time monitoring.

Outputs the partition name, used space, available space, usage percentage, and mount point.

Prerequisites
The script uses the df command, which is a standard command available in most Unix-like operating systems. No additional tools are required.

How to Use the Script
1. Clone or Download the Script
You can either clone the repository or download the script directly to your system.

 
 
git clone https://github.com/yourusername/disk-usage-monitor.git
cd disk-usage-monitor
2. Make the Script Executable
Ensure the script has executable permissions:

 
 
chmod +x monitor_disk_usage.sh
3. Run the Script
To run the script and start monitoring disk usage, use the following command:

 
 
./monitor_disk_usage.sh
The script will start and refresh the disk usage statistics every 2 seconds.

4. Stop the Script
To stop the script, press Ctrl + C in the terminal.

How the Script Works
The script uses the df command to fetch disk usage information for all mounted partitions. It formats the output into a human-readable table with columns for:

Filesystem: The partition name.

Used: The amount of space used on the partition.

Available: The available space on the partition.

Use%: The percentage of disk space used.

Mounted on: The directory where the partition is mounted.

If a partition's disk usage exceeds 80%, it is highlighted in red for easy identification.

Example Output
 
 
Filesystem            Used    Available Use% Mounted on
/dev/sda1             15G     10G        60%  /
/dev/sdb1             30G     5G         85%  /data
/dev/sdc1             5G      20G        20%  /backup
If the disk usage exceeds 80%, the output for that partition will be highlighted in red. For example:

 
 
Filesystem            Used    Available Use% Mounted on
/dev/sda1             15G     10G        60%  /
/dev/sdb1             30G     5G         85%  /data
/dev/sdc1             5G      20G        20%  /backup
In this example, /dev/sdb1 will be highlighted in red because its usage exceeds 80%.