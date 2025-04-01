This script provides real-time monitoring of your network, displaying key statistics such as the number of active connections, packet drops, and data sent/received in MB. It runs in an infinite loop, updating every 2 seconds to give you up-to-date information.

Features
Active Connections: Displays the number of active network connections.

Packet Drops: Displays the number of packets that have been dropped (both received and transmitted).

Data In/Out: Displays the total data received (in MB) and transmitted (in MB).

Prerequisites
Before using the script, ensure that your system has the following tools installed:

ss or netstat (for checking active connections)

awk (for processing network data)

cat (for reading from system files like /proc/net/dev)

bc (for performing floating-point arithmetic)

For Ubuntu/Debian-based systems:

sudo apt-get install net-tools bc

sudo yum install net-tools bc
Usage
Running the Script
To run the script, navigate to the directory where the script is located and execute the following command:

./network_monitor.sh
This will start the script, and it will continuously update the network stats every 2 seconds. The screen will clear and refresh with updated data each time.

Displayed Information
The script will display the following output in your terminal:

php-template
 
+------------------------------------------------------------+
| Network Monitoring                                           |
|------------------------------------------------------------|
| Active Connections: <number>                                  |
| Packet Drops: <number>                                         |
| Data In: <number>MB    | Data Out: <number>MB                |
+------------------------------------------------------------+
Active Connections: The number of active network connections.

Packet Drops: The number of packet drops during transmission and reception.

Data In: The total data received, in MB.

Data Out: The total data transmitted, in MB.

Example Output:
sql
 
+------------------------------------------------------------+
| Network Monitoring                                           |
|------------------------------------------------------------|
| Active Connections: 25                                      |
| Packet Drops: 0                                             |
| Data In: 12.34MB    | Data Out: 5.67MB                     |
+------------------------------------------------------------+
Modifying the Script for Individual Parts
If you want to focus on specific parts of the dashboard and exclude the rest of the data, you can comment/uncomment the relevant sections in the script. Here's how to do that:

1. Active Connections
If you only want to display the active connections, you can comment out the other lines and leave the active connections line intact:

 
 
# Uncomment the following to show only active connections:
# echo "| Active Connections: $CONNECTIONS                               |"
2. Packet Drops
To only show the packet drops, comment out the other lines and leave the packet drops line as follows:

 
 
# Uncomment the following to show only packet drops:
# echo "| Packet Drops: $PACKET_DROPS                                    |"
3. Data In/Out
To only display the data received and transmitted, comment out the rest of the lines and keep this:

 
 
# Uncomment the following to show only data stats:
# echo "| Data In: ${DATA_IN_MB}MB    | Data Out: ${DATA_OUT_MB}MB       |"
Customizing the Network Interface
The script assumes that the network interface index for DATA_IN and DATA_OUT is 3. If your system uses a different interface, you can modify the line where the network interface index is specified. The NR==3 part indicates which network interface to use.

For example:

 
 
DATA_IN=$(cat /proc/net/dev | awk '{print $2}' | awk 'NR==3')  # Modify NR value for your interface
DATA_OUT=$(cat /proc/net/dev | awk '{print $10}' | awk 'NR==3')  # Modify NR value for your interface
If you are unsure of the index number, you can list your network interfaces by running:

 
 
cat /proc/net/dev
This will give you a list of interfaces like eth0, ens33, etc., and you can select the corresponding index for your network interface.

Stopping the Script
To stop the script, simply press Ctrl+C in your terminal.