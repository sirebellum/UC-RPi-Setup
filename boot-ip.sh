#!/bin/bash

today=`date +%Y-%m-%d.%H:%M:%S`

echo $HOSTNAME > /home/pi/IP-info
echo -e "\n" >> /home/pi/IP-info
echo $today >> /home/pi/IP-info
echo -e "\n" >> /home/pi/IP-info
ifconfig >> /home/pi/IP-info
cat IP-info | sudo mail -s $HOSTNAME Multimedia@utsa.edu