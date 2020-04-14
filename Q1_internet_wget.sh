#!/bin/bash
wget -q --spider www.google.com
echo $?
if [ $? -eq 0 ];then
echo "Internet is up"
else 
echo "Internet is down"
fi

