#!/bin/bash
printf '%*s\n' "$(tput cols)" '' | tr ' ' '='
echo "== SERVER STATS =="
printf '%*s\n' "$(tput cols)" '' | tr ' ' '='
echo "CPU Usage:"
if [[ "$OSTYPE" == "darwin"* ]]; then
  #macos
  top -l 1 | grep "CPU usage"
else
  #linux
  top -bn1 | grep "Cpu(s)"
fi
printf '%*s\n' "$(tput cols)" '' | tr ' ' '='
echo "Memory Usage:"
if [ "$(uname)" = "Darwin" ]; then
  # macOS method
  total_mem=$(sysctl -n hw.memsize)
  total_gb=$(echo "$total_mem / 1024 / 1024 / 1024" | bc)

  # Get used and free memory
  vm_stats=$(vm_stat)
  pages_free=$(echo "$vm_stats" | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
  pages_inactive=$(echo "$vm_stats" | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
  pages_speculative=$(echo "$vm_stats" | grep "Pages speculative" | awk '{print $3}' | sed 's/\.//')
  page_size=$(sysctl -n hw.pagesize)
  free_mem=$(( (pages_free + pages_inactive + pages_speculative) * page_size ))

  free_gb=$(echo "$free_mem / 1024 / 1024 / 1024" | bc)
  used_gb=$(echo "$total_gb - $free_gb" | bc)

  echo "Used: ${used_gb} GB / Total: ${total_gb} GB"
else
  # Linux method
  free -h | grep "Mem:"
fi
printf '%*s\n' "$(tput cols)" '' | tr ' ' '='
echo "Disk Usage:"
df -h /System/Volumes/Data | tail -1 | awk '{print "Used: " $3 " / Total: " $2 " (" $5 " used)"}'
printf '%*s\n' "$(tput cols)" '' | tr ' ' '='
echo "Top 5 by CPU:"
#macos
ps -A -o %cpu,comm | sort -nr | head -6
printf '%*s\n' "$(tput cols)" '' | tr ' ' '='
echo "Top 5 by Memory:"
ps -A -o %mem,comm | sort -nr | head -6
echo
echo "OS Version: $(sw_vers -productVersion)"
echo "Uptime: $(uptime | sed 's/^.*up //' | sed 's/,.*//')"
echo "Logged in users: $(who | wc -l)"
