This script monitors the status of essential system services, including services like sshd, nginx, apache2, and iptables. It continuously checks and displays whether these services are active or inactive. The script updates the status every 2 seconds.

Features
Service Status: Displays whether each of the essential services is active or inactive.

Real-time Monitoring: Continuously refreshes the status of the services every 2 seconds for real-time monitoring.

Prerequisites
This script assumes that the system uses systemd for managing services and requires systemctl to query the status of services. Ensure that the following tools are available on your system:

systemctl (to query the status of services)

These tools are typically installed by default on most Linux distributions that use systemd.

Usage
Running the Script
To run the script, navigate to the directory where the script is located and execute the following command:

 
 
./service_monitor.sh
This will start the script, and it will continuously display and refresh the status of the services every 2 seconds.

Displayed Information
The script will display the following information in your terminal:

mathematica
 
Service Name          Status         
--------------------------------------------
sshd                 Active         
nginx                Active         
apache2              Inactive       
iptables             Active         
Service Name: The name of the service being monitored.

Status: Whether the service is Active or Inactive.

Example Output:
mathematica
 
Service Name          Status         
--------------------------------------------
sshd                 Active         
nginx                Active         
apache2              Inactive       
iptables             Active         
Customizing the Services to Monitor
The script currently monitors four essential services: sshd, nginx, apache2, and iptables. If you want to add or remove services to monitor, you can easily customize the list in the services array.

For example, to add mysql and docker to the list of services, modify the services array as follows:

 
 
services=("sshd" "nginx" "apache2" "iptables" "mysql" "docker")
This will ensure that the script checks and monitors the status of mysql and docker along with the other services.

Example:
 
 
services=("sshd" "nginx" "apache2" "iptables" "mysql" "docker")
1. Adding a Service
To add a service to the list of monitored services:

Edit the services array.

Add the name of the service (e.g., "mysql").

2. Removing a Service
To remove a service:

Edit the services array.

Delete the service name from the list.

Stopping the Script
To stop the script, simply press Ctrl+C in your terminal.

