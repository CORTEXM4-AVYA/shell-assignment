#!/bin/bash
ping -c1 -q 8.8.8.8 >/dev/null 
echo $?
if [ $? -eq 0 ];then
echo "Internet is up"
else
echo "INternet is down "
fi

