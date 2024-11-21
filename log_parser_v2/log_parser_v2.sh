# This bash script will loop through a given log file, parse each line for ip adresses, extract the network bits and verify
# that each ip address is allowed to connect to the network. It does this by searching a list of verified IP addresses in another file
# an flagging connections that do not match any ip addresses in. NB: flagged IPs are sent to (flagged_IPs.txt)  
# This script was designed to effectively automate log parsing and can be integrated with cron to execute on a daily/month basis as needed.
# You can format the script as needed based on how your log file is formatted.

#!/bin/bash

echo "script to parse log files version-2"

#loop through said log file with a while loop
while read -r line
do

#getting the current IP address from the current line
ip_address=$(echo $line | awk '{print $4}' | cut -c 7-16)
#echo $line

#use <grep> search for ip_network in log file generated by the system
found_IP=$(grep -i $ip_address $2)
#echo $found_IP

#Flag line if grep_result is false i.e grep_result is not in accepted_IP.txt
if [ "$ip_address" != "$found_IP" ] ; then
    echo $line >> flagged_IPs.txt
fi


done <$1
