# Bash script repo, This repo contains essential scripts I have used that may be helpful for learning the basic of Bash

## Various scripts will be added shortly

# Log_parser
  * This bash script will loop through a given log file, parse each line for ip adresses, extract the network bits and verify 
  * that each ip address is allowed to connect to the network. It does this by searching a list of verified IP addresses in another file 
  * an flagging connections that do not match any ip addresses in the list.
  * This script was design to effectively automate log parsing and can be integrated with cron to execute on a daily/month basis as needed.

# test.sh
  * This bash script demonstrates how to use positional parameters in bash to pass dynamic arguments to scripts for processing.

# test_logs (directory)
## This directory contains 3 files
* Parse_log_files.sh: Script to parse all files within this directory 
* testlog1.txt: sample log file 1
* testlog2.txt: sample log file 2

## BUILT WITH
  * Bash/shell

## PREREQUISITES
  * For Mac: All binaries and files are already installed.
  * For Windows: visit:https://medium.com/the-owl/how-to-run-shell-scripts-in-windows-87371211028e

## USAGE
   * For Mac: Navigate to terminal and follow step below to make file executable in bash for the current user
     ```
     $ ls -la <file name> NB: the file shoould have a .sh extension
     $ -rw-r--r--@  1 anthonyquist  staff  1336 Nov 20 12:41 <file name>
     $ chmod u+x
     $ ls -la <file name>
     $ -rwxr--r--@  1 anthonyquist  staff   161 Nov 19 09:02 <file name>
     $ ./<filename.sh> OR bash <filename.sh> OR sh <filename.sh>
     ```
