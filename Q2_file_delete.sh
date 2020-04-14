#!/bin/bash
DIR='/home/mint/Desktop/avya/'

#listing all files in given directory
echo "Listing ALl FIles"
for FILE in ls "$DIR"*
do
    echo $FILE
done

echo "Deleting files with size less than 1024kb"
for FILE in "$DIR"*;
do
    file_size=$(du $FILE | awk '{print $1}');
    if [ "$file_size" -lt 1024 ];then
       echo "Deleting files $FILE with file size $file_size less than 1024kb"
       rm -f $FILE
    fi
done
