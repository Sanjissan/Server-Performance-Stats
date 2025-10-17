# Server-Performance-Stats
# Server Performance Stats Script

A simple **Bash script** that monitors and reports basic server performance statistics.  
This script works on **macOS** and **Linux**, giving you a quick overview of CPU, memory, disk usage, and the top processes consuming resources.

---

## Features

- ✅ Total CPU usage  
- ✅ Memory usage (used vs total)  
- ✅ Disk usage (used vs total, main volume)  
- ✅ Top 5 processes by CPU usage  
- ✅ Top 5 processes by memory usage  
- ✅ OS cersion
- ✅ Uptime
- ✅ Ligged-in users

---

## Requirements

- macOS or Linux  
- Bash shell  
- Standard system commands (`top`, `ps`, `df`, `vm_stat` on macOS, `free` on Linux)

---

## Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/server-stats.git

2. cd server-stats
3.chmod +x server-stats.sh
4. ./server-stats.sh
