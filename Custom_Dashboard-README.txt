Overview
This script is designed to display real-time system performance metrics such as CPU usage, memory usage, network usage, disk usage, GPU usage, and NPU usage. It can be run as a standalone script and provides the ability to monitor individual metrics in real-time. The script runs in a loop, refreshing every 2 seconds, and can be customized to show specific parts of the dashboard.

Features
CPU Usage: Displays the CPU usage in percentage for user, system, and idle states.

Memory Usage: Displays the total, used, and free memory and swap usage.

Network Usage: Shows the network interface usage, including received and transmitted bytes.

Disk Usage: Displays disk usage statistics for all mounted file systems.

GPU Usage: Displays GPU usage information (if NVIDIA GPU and nvidia-smi are installed).

NPU Usage: Displays NPU usage information (requires specific NPU tool like npu-smi).

Prerequisites
Before running the script, ensure you have the necessary tools installed:

nvidia-smi for GPU information (for NVIDIA GPUs).

npu-smi for NPU information (if you are using a system with an NPU).

top, free, netstat, and df commands are required for basic system information.

How to Use the Script

1. Clone or Download the Script
You can either clone the repository or download the script directly to your system.

 
 
git clone https://github.com/yourusername/system-monitor-dashboard.git
cd system-monitor-dashboard

2. Make the Script Executable
Ensure the script has executable permissions:

 
 
chmod +x monitor_dashboard.sh
3. Run the Script
To run the script, use one of the following commands depending on the type of information you want to monitor:

 
 
./monitor_dashboard.sh -cpu
 
 
./monitor_dashboard.sh -memory
 
 
./monitor_dashboard.sh -network
 
 
./monitor_dashboard.sh -disk
 
 
./monitor_dashboard.sh -gpu
 
 
./monitor_dashboard.sh -npu
The script will continuously display the requested metric (e.g., CPU usage, memory usage, etc.) every 2 seconds.

4. Stop the Script
To stop the script, press Ctrl + C.

Command-Line Options
The script accepts the following command-line options:

-cpu: Display CPU usage statistics.

-memory: Display memory usage statistics.

-network: Display network interface statistics.

-disk: Display disk usage statistics.

-gpu: Display GPU usage statistics (if nvidia-smi is installed).

-npu: Display NPU usage statistics (if npu-smi is installed).

Example Usage
Display CPU Usage: To monitor CPU usage continuously, run:

 
 
./monitor_dashboard.sh -cpu
This will display CPU usage statistics every 2 seconds until you stop it.

Display Memory Usage: To monitor memory and swap usage, run:

 
 
./monitor_dashboard.sh -memory
Display Network Usage: To monitor network statistics (received and transmitted bytes on network interfaces), run:

 
 
./monitor_dashboard.sh -network
Display Disk Usage: To monitor disk usage for all mounted filesystems, run:

 
 
./monitor_dashboard.sh -disk
Display GPU Usage: To monitor GPU usage (if you have an NVIDIA GPU), run:

 
 
./monitor_dashboard.sh -gpu
Display NPU Usage: To monitor NPU usage (if you have an NPU and the npu-smi tool), run:

 
 
./monitor_dashboard.sh -npu
Example Output
CPU Usage:

yaml
 
CPU Usage:    User: 30% | System: 5% | Idle: 65%
Memory Usage:

yaml
 
Memory Usage: Total: 16GB | Used: 8GB | Free: 8GB
Swap Usage:   Total: 4GB  | Used: 1GB  | Free: 3GB
Network Usage:

yaml
 
Network Usage: Interface: eth0 | RX Bytes: 1GB | TX Bytes: 500MB
Disk Usage:

yaml
 
Disk Usage:   Filesystem: /dev/sda1 | Size: 50GB | Used: 20GB | Available: 30GB | Mounted on: /
GPU Usage (only if NVIDIA GPU is available):

yaml
 
GPU Usage:    50% | Memory: Total: 8GB | Used: 4GB | Free: 4GB
NPU Usage (only if NPU is available):

yaml
 
NPU Usage:    40% | Memory: Total: 16GB | Used: 6GB | Free: 10GB