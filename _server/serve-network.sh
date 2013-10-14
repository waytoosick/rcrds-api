#!/bin/bash

portnum="4848"

echo "What is your local IP? (Type enter the local IP, \"ifconfig\" or \"cancel\")"
localip=
while [[ $localip = "" ]]; do
   read localip
done

if [ $localip == "ifconfig" ]; then
	
cd $localip/_layouts/
ifconfig

echo "What is your local IP? (Type enter the local IP, \"ifconfig\" or \"cancel\")"
localip=
while [[ $localip = "" ]]; do
   read localip
done

echo "Running server accessible at: http://$localip:$portnum"
ruby ./websrv.rb -d ../public/ -b $localip --port $portnum
kill $$

elif [ $localip == "cancel" ]; then

echo 'Cancelling...'
kill $$

else

echo 'Something went wrong...'
kill $$
	
fi