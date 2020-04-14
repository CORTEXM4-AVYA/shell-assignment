#!/bin/bash
echo "MONITORING THE MEMORY DISK CPU"
printf "Date\t\t\tMemory\t\tDisk\t\tCPU\n"
end=$((SECONDS+20))
#MONITORING MEMORY DISK CPU FOR 20 SECOND
while [ $SECONDS -lt $end ];do
CURRENTDATE=`date +"%Y-%m-%d %T"`
MEMORY=$(free -m | awk 'NR==2{printf " \t%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo ${CURRENTDATE} "$MEMORY%$DISK%$CPU"
sleep 2
done
#sorting the process which consume cpu most
PROCESS=$(ps -eo comm,pid,pcpu --sort -pcpu |head -2)
echo "Process consuming most cpu= $PROCESS"
