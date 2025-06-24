#!/bin/bash

# اسم ملف التقرير
REPORT="report.html"

# نبدأ كتابة HTML
echo "<!DOCTYPE html>" > $REPORT
echo "<html><head><title>System Report</title></head><body>" >> $REPORT
echo "<h1>System Monitoring Report</h1>" >> $REPORT
echo "<hr>" >> $REPORT

# CPU Info
cpu_info=$(lscpu | grep 'Model name' | awk -F: '{print $2}')
echo "<h3>CPU Info:</h3><p>$cpu_info</p>" >> $REPORT

# Memory
memory_info=$(free -h | grep Mem | awk '{print "Used: "$3 " / Total: "$2}')
echo "<h3>Memory:</h3><p>$memory_info</p>" >> $REPORT

# Disk
disk_info=$(df -h / | awk 'NR==2{print "Used: "$3 " / Total: "$2}')
echo "<h3>Disk:</h3><p>$disk_info</p>" >> $REPORT

# Network
ip_address=$(hostname -I | awk '{print $1}')
echo "<h3>IP Address:</h3><p>$ip_address</p>" >> $REPORT

# Load
load_avg=$(uptime | awk -F'load average:' '{print $2}')
echo "<h3>Load Average:</h3><p>$load_avg</p>" >> $REPORT


echo "<h2>Memory Usage Chart</h2><img src='memory_chart.png' width='400'/>"
echo "<h2>Memory Usage Chart</h2><img src='memory_chart.png' width='400'/>"
echo "<h2>Memory Usage Chart</h2><img src='memory_chart.png' width='400'/>"

# نهاية الملف
echo "<hr><p>Generated on $(date)</p>" >> $REPORT
echo "</body></html>" >> $REPORT

echo "HTML report generated: $REPORT"
