# This bash script will loop through a given log file, parse each line for ip adresses, extract the network bits and verify 
# that each ip address is allowed to connect to the network. It does this by searching a list of verified IP addresses in another file 
# an flagging connections that do not match any ip addresses in the list.
# This script was design to effectively automate log parsing and can be integrated with cron to execute on a daily/month basis as needed. 

#! /bin/bash

echo "script to parse log files version-1"

#loop through said log file with a while loop
while read -r line
do

#getting the current IP address from the current line
ip_address=$(echo $line | awk '{print $4}')

#getting network bits
octet1=$(echo $ip_address | awk -F "." '{print substr($1,7)}')
octet2=$(echo $ip_address | awk -F "." '{print $2}')
octet3=$(echo $ip_address | awk -F "." '{print $3}')
dot="."

#form network portion of IP adress
ip_network=$octet1$dot$octet2$dot$octet3
#echo $ip_network

#use <grep> search for ip_network in log file generated by the system
grep_result=$(grep "$ip_network" accepted_IPs.txt)
#echo $grep_result

#Flag line if grep_result is false i.e grep_result is not in accepted_IP.txt
if [ "$ip_network" != "$grep_result" ] ; then
    echo $line >> flagged_IPs.txt
fi

done <$1



