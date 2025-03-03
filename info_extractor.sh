#!/bin/bash
# 1. Getting the public ip address
function ipaddress(){
echo "My public Ip :";
curl ifconfig.me;
 }
#2 . My private Ip address assigned to NIC
function ipprivate(){
echo "My private Ip: "
hostname -I | awk '{print $1}';
}
# 3. Display the MAC address
function mac(){
echo "My mac address is:";
ifconfig | grep ether | awk '{print $2}';
}
# 4. Display the percentage for cpu usage for the top 5 processes
function cpuusage(){
echo "CPU usage processes and their percantages:";
ps aux --sort=-%cpu | head -n 6
}
# 5. display memory usage statistics ( total and available memory )
function memory(){
free -h | awk 'NR==2{print "Total Memory:"$2} NR==2{print "Available Memory:" $7}';
}
# 6. List active system services with their status
function system(){
echo "Active system services:";
sudo systemctl list-units --type=service
}
# 7.Locate top largest files in home
function largefile(){
echo "Top 10 large files in /home";
cd ..
du -a | sort -n -r | head -n 10
}

main(){

ipaddress;
echo "****************************************END***************************************END**********************************";
ipprivate;
echo "****************************************END***************************************END**********************************";
mac;
echo "****************************************END***************************************END**********************************";
cpuusage;
echo "****************************************END***************************************END**********************************";
memory;
echo "****************************************END***************************************END**********************************";
system;
echo "****************************************END***************************************END**********************************";
largefile;
echo "****************************************END***************************************END**********************************";
}
main;
