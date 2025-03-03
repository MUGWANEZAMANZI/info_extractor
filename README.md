# Info Extractor

This repository contains a simple Bash script that extracts various system information. Below are the functionalities provided by the script.

## Features

1. **Getting the public IP address**
   - Function: `ipaddress()`
   - Command: `curl ifconfig.me`
   - Output: Displays the public IP address of the system.

2. **Getting the private IP address assigned to NIC**
   - Function: `ipprivate()`
   - Command: `hostname -I | awk '{print $1}'`
   - Output: Displays the private IP address of the system.

3. **Displaying the MAC address**
   - Function: `mac()`
   - Command: `ifconfig | grep ether | awk '{print $2}'`
   - Output: Displays the MAC address of the system.

4. **Displaying the percentage CPU usage for the top 5 processes**
   - Function: `cpuusage()`
   - Command: `ps aux --sort=-%cpu | head -n 6`
   - Output: Displays the CPU usage percentage of the top 5 processes.

5. **Displaying memory usage statistics (total and available memory)**
   - Function: `memory()`
   - Command: `free -h | awk 'NR==2{print "Total Memory:"$2} NR==2{print "Available Memory:" $7}'`
   - Output: Displays total and available memory.

6. **Listing active system services with their status**
   - Function: `system()`
   - Command: `sudo systemctl list-units --type=service`
   - Output: Displays the active system services.

7. **Locating the top largest files in the home directory**
   - Function: `largefile()`
   - Command: `du -a | sort -n -r | head -n 10`
   - Output: Displays the top 10 largest files in the `/home` directory.

## Usage

To use the script, simply execute it in your terminal. Each function is called sequentially in the `main()` function, and the output of each function is separated by a series of asterisks for clarity.

```bash
./info_extractor.sh
```

## Example Output

```plaintext
My public Ip :
192.168.0.1
****************************************END***************************************END**********************************
My private Ip:
10.0.0.1
****************************************END***************************************END**********************************
My mac address is:
00:1A:2B:3C:4D:5E
****************************************END***************************************END**********************************
CPU usage processes and their percentages:
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1 225276  1036 ?        Ss   Mar03   0:01 /sbin/init
...
****************************************END***************************************END**********************************
Total Memory: 16G
Available Memory: 10G
****************************************END***************************************END**********************************
Active system services:
UNIT                     LOAD   ACTIVE SUB     DESCRIPTION
accounts-daemon.service  loaded active running Accounts Service
...
****************************************END***************************************END**********************************
Top 10 large files in /home
100K    /home/user/file1
90K     /home/user/file2
...
****************************************END***************************************END**********************************
```

For more details, check the [script file](https://github.com/MUGWANEZAMANZI/info_extractor/blob/main/info_extractor.sh).

