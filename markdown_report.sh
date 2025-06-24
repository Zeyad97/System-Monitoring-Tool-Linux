echo "# System Report" > report.md
echo "## CPU Usage" >> report.md
mpstat 1 1 >> report.md
