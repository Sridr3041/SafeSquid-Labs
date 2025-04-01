#!/bin/bash

# Run the script indefinitely, refreshing every 2 seconds
while true; do
    # Get the number of concurrent connections
    CONNECTIONS=$(ss -tuln | grep -c ':')  # or netstat -an | grep ESTABLISHED | wc -l

    # Get the number of packet drops (received and transmitted)
    PACKET_DROPS=$(cat /proc/net/dev | awk '{if($2 == "0" && $10 == "0") print $0}' | awk '{print $1, $2, $10}') # Might need to adapt depending on the system and interface used

    # Get the number of data in (received bytes) and data out (transmitted bytes)
    DATA_IN=$(cat /proc/net/dev | awk '{print $2}' | awk 'NR==3')  # Replace 3 with the right interface index (e.g., eth0, ens33, etc.)
    DATA_OUT=$(cat /proc/net/dev | awk '{print $10}' | awk 'NR==3')

    # Convert the data in and out to MB (1 MB = 1048576 bytes)
    DATA_IN_MB=$(echo "scale=2; $DATA_IN/1048576" | bc)
    DATA_OUT_MB=$(echo "scale=2; $DATA_OUT/1048576" | bc)

    # Clear the screen for a fresh display
    clear

    # Print the result in the requested format
    echo "+------------------------------------------------------------+"
    echo "| Network Monitoring                                           |"
    echo "|------------------------------------------------------------|"
    echo "| Active Connections: $CONNECTIONS                               |"
    echo "| Packet Drops: $PACKET_DROPS                                    |"
    echo "| Data In: ${DATA_IN_MB}MB    | Data Out: ${DATA_OUT_MB}MB       |"
    echo "+------------------------------------------------------------+"

    # Sleep for 2 seconds before refreshing the output
    sleep 2
done
