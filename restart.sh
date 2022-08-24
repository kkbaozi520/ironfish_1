#!/bin/bash
count=0
while [ true ]
do
         count_1=$(expr $count % 72)
         if [ "$count_1" -eq 0 ]
         then
               sudo rm -rf /data/ironfish/.ironfish/databases      
         else
               echo "keep going"
         fi 
         sudo docker restart ironfish_node
         sleep 3600
         count=$(expr $count + 1)
done
