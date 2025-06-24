import psutil
import matplotlib.pyplot as plt

mem = psutil.virtual_memory()
used = mem.used / (1024 ** 3)
free = mem.available / (1024 ** 3)

labels = ['Used', 'Available']
sizes = [used, free]
colors = ['#ff9999','#66b3ff']

plt.figure(figsize=(5,5))
plt.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=90)
plt.title('Memory Usage (GB)')
plt.axis('equal')
plt.savefig('html_logs/memory_chart.png')
print("Chart saved as memory_chart.png")
