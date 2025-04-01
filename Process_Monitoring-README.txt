This script provides real-time monitoring of system processes, displaying the number of active processes, the top 5 CPU-intensive processes, and the top 5 memory-intensive processes. It runs in an infinite loop and updates every 2 seconds to give you up-to-date information.

Features
Active Processes: Displays the total number of active processes running on the system.

Top 5 CPU-intensive Processes: Displays the top 5 processes consuming the most CPU resources.

Top 5 Memory-intensive Processes: Displays the top 5 processes consuming the most memory.

Prerequisites
Make sure the following tools are available on your system:

ps (to retrieve process information)

awk (for formatting the output)

These tools are typically installed by default on most Linux-based systems.

Usage
Running the Script
To run the script, navigate to the directory where the script is located and execute the following command:

 
 
./process_monitor.sh
This will start the script, which will continuously display and refresh the process stats every 2 seconds. The screen will clear and refresh with updated data each time.

Displayed Information
The script will display the following information:

php-template
 
Active Processes: <number of active processes>

CPU Usage (%)     Memory Usage (%)     Process Name
----------------------------------------------------------
Top 5 Processes by CPU:
<process 1 info>
<process 2 info>
<process 3 info>
<process 4 info>
<process 5 info>

Top 5 Processes by Memory:
<process 1 info>
<process 2 info>
<process 3 info>
<process 4 info>
<process 5 info>
Active Processes: The total number of active processes running on the system.

Top 5 Processes by CPU: Displays the top 5 processes using the most CPU resources.

Top 5 Processes by Memory: Displays the top 5 processes using the most memory.

Example Output:
 
 
Active Processes: 185

CPU Usage (%)     Memory Usage (%)     Process Name
----------------------------------------------------------
Top 5 Processes by CPU:
100.3               10.2               /usr/bin/python3
75.0                15.0               /usr/bin/java
50.0                8.3                /usr/bin/ 
30.0                2.5                /usr/bin/gnome-shell
25.0                5.0                /usr/bin/vim

Top 5 Processes by Memory:
25.0                100.0               /usr/bin/java
20.0                90.5                /usr/bin/python3
10.0                50.0                /usr/bin/ 
5.0                 30.0                /usr/bin/gnome-shell
3.0                 25.0                /usr/bin/vim
Customizing the Script to Show Individual Information
If you'd like to display only specific parts of the process information (such as only the top CPU processes or only the active processes), you can easily modify the script. Here’s how to focus on a single section:

1. Active Processes
To display only the active processes, comment out the sections related to CPU and memory:

 
 
# To show only active processes, comment out the rest of the script:
# echo "Active Processes: $active_processes"
2. Top 5 CPU Processes
If you only want to see the top 5 CPU-intensive processes, comment out the sections related to memory:

 
 
# To show only top 5 CPU-intensive processes:
# echo "Top 5 Processes by CPU:"
# echo "$top_cpu_processes" | while read line; do
#    printf "%-20s %-10s %-40s\n" $(echo $line)
# done
3. Top 5 Memory Processes
To only display the top 5 memory-intensive processes, comment out the CPU section:

 
 
# To show only top 5 memory-intensive processes:
# echo "Top 5 Processes by Memory:"
# echo "$top_mem_processes" | while read line; do
#    printf "%-20s %-10s %-40s\n" $(echo $line)
# done
Stopping the Script
To stop the script, simply press Ctrl+C in your terminal.

