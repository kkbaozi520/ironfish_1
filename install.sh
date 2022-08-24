#!/bin/sh
if [ ! $Graffiti ]; then
	read -p "Enter your Graffiti: " Graffiti
	echo 'export Graffiti='${Graffiti} >> $HOME/.bash_profile
fi
echo -e '\n\e[45mYour Graffiti:' $Graffiti '\e[0m\n'
sudo rm -rf /data/ironfish/.ironfish
sudo docker run -it -v /data/ironfish/.ironfish:/root/.ironfish --name ironfish_node --restart always  -p "8120:8020" -p "9033:9033" -d qsobad/ironfish_node:nighty
sudo docker exec -it  ironfish_node ironfish config:set blockGraffiti "$Graffiti"
nohup sh $HOME/ironfish/restart.sh >> $HOME/ironfish/ironfish.log &
ls
