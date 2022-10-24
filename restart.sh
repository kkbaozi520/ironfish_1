#!/bin/bash
count=0
while [ true ]
do
         count_1=$(expr $count % 48)
         if [ "$count_1" -eq 0 ]
         then  
               sudo mv /data/ironfish/.ironfish/config.json /home/ubuntu
               sudo rm -rf /data/ironfish
               sudo docker rm -f ironfish_node
               sudo docker run -tid --name=ironfish_node --restart always --network host --volume /data/ironfish/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest start --upgrade
               sudo rm -rf /data/ironfish/.ironfish/config.json
               sudo mv /home/ubuntu/config.json /data/ironfish/.ironfish
               sudo docker restart ironfish_node      
         else
               echo "keep going"
         fi 
         sleep 3600
         count=$(expr $count + 1)
done
