# This scripts will parse all files in a directory, parse all line within those files and search for a specific string.
# In this case "Unknown"

#!/bin/bash

# Declare variable to track the count of the keyword("Unknown")
KeywordCount=0

# Loop through all files in the current directory
for d in *;
do

# Read all files in the current directory
while read -r line;
do

# Pipe each line to the awk command and assign the ip address portion to var
var=$(echo $line | awk '{print $2}')

 # Verify that var is assigned to the string "Unknown"
 if [[ $var == "Unknown" ]]; then
 # Count how many times the keyword("Unknown") has been seen
    let KeywordCount=KeywordCount+1

 fi

done<$d

done

# Print the keyword count to the console
echo "$KeywordCount"

