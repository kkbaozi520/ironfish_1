#!/bin/sh
#ps -ef | grep "restart.sh" | awk '{print $2}' | xargs kill -9
nohup sh $HOME/ironfish_1/restart.sh >> $HOME/ironfish_1/ironfish.log &
ls
