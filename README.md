# 🖥️ System Monitoring Tool for Linux

A complete Linux system monitoring solution using `Bash`, `Docker`, `InfluxDB`, and `Grafana` to collect, visualize, and store system metrics.

---

## 🚀 Features

- ✅ Real-time monitoring of CPU, RAM, Disk, IP, Load Average
- 📄 Generate text, HTML, and Markdown reports
- 🖼️ GUI using `dialog` and optional `zenity`/`yad`
- 📈 Python graph for memory usage
- 📡 Send metrics to InfluxDB for time-series storage
- 📊 Optional Grafana integration for visualization
- 🐳 Dockerized environment for easy deployment

---

## 🧰 Technologies Used

| Tool        | Purpose                           |
|-------------|------------------------------------|
| Bash        | Core scripting logic               |
| Docker      | Containerization                   |
| InfluxDB    | Time-series data storage           |
| Grafana     | Optional metric visualization      |
| psutil      | Python library for memory graphs   |
| dialog/yad  | GUI options                        |

---

## 🧠 Project Structure

```
system-monitor/
├── monitor.sh              # Collect system info
├── gui_monitor.sh          # Dialog GUI
├── html_report.sh          # Generate HTML reports
├── markdown_report.sh      # Generate Markdown reports
├── memory_chart.py         # Python-based memory graph
├── memory_chart.png        # Output image
├── Dockerfile              # Docker setup
├── docker-compose.yml      # Docker multi-service config
├── logs/                   # Text reports
├── html_logs/              # HTML reports
└── README.md               # You're here!
```

---

## 🧪 How to Run

```bash
# Give execution permission
chmod +x monitor.sh gui_monitor.sh html_report.sh

# Run monitor
./monitor.sh

# Launch GUI (dialog-based)
./gui_monitor.sh

# Generate HTML report
./html_report.sh
```

---

## 🐳 Run with Docker

```bash
docker-compose up --build
```

To rebuild:
```bash
docker-compose down
docker-compose up --build
```

---

## 📡 Send to InfluxDB

Make sure InfluxDB is running on `localhost:8086` and create the database:

```bash
curl -i -X POST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE system_monitoring"
```

---

## 🧠 Optional Enhancements

- 🐍 Python Graph for memory:
```bash
python3 memory_chart.py
```

- 📊 Grafana Integration:
    - Add `InfluxDB` data source
    - Query metrics (e.g., `cpu_usage`, `memory_usage`)
    - Create beautiful dashboards

- 🌐 Host HTML reports via mini-server:
```bash
./serve.sh
```
Then go to: [http://localhost:8080](http://localhost:8080)

---

## 👤 Author

**Zeyad Mohamed Abdelwahab**  
GitHub: [@Zeyad97](https://github.com/Zeyad97)

---

## 🧠 Notes

> Temperature may not be available on virtual machines.  
> Make sure required tools like `mpstat`, `smartctl`, `dialog`, `bc`, and `sensors` are installed.

---

## ❤️ Contribute

Feel free to fork, improve, or use this tool in your own projects.
