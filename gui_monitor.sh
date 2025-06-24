#!/bin/bash

# Collect system information
cpu_info=$(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed 's/^ *//')
memory_info=$(free -h | awk '/Mem:/ {print "Used: "$3" / Total: "$2}')
disk_info=$(df -h / | awk 'NR==2 {print "Used: "$3" / Total: "$2}')
ip_address=$(hostname -I | awk '{print $1}')
load_avg=$(uptime | awk -F'load average:' '{print $2}' | sed 's/^ *//')
datetime=$(date)

# Try to get CPU temperature
if command -v sensors &> /dev/null; then
    cpu_temp=$(sensors | grep -m 1 'Package id 0:' | awk '{print $4}')
    [ -z "$cpu_temp" ] && cpu_temp="Not available"
else
    cpu_temp="sensors command not found"
fi

# Create the message
msg="Date & Time: $datetime

CPU: $cpu_usage
CPU Temp: $cpu_temp
Memory: $memory_info
Disk: $disk_info
IP Address: $ip_address
Load Average: $load_avg
"

# Display using dialog
dialog --title "System Monitoring Report" --msgbox "$msg" 20 70

#!/bin/bash

dialog --clear --title "System Monitor Dashboard" \
--menu "Choose an option:" 15 50 4 \
1 "Generate Full System Report" \
2 "Generate HTML Report" \
3 "Exit" 2>temp_choice.txt

CHOICE=$(<temp_choice.txt)
rm -f temp_choice.txt

case $CHOICE in
    1)./monitor.sh
        ;;
    2)
        ./html_report.sh
        ;;
    3)
        echo "Goodbye!"
        ;;
    *)
        echo "Invalid choice."
        ;;
esac
