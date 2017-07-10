#!/bin/bash

case "$1" in
'time')

HOUR=$(date "+%H")
TODAY=$(date "+%w")
TIME=$(date "+%T")

if [ "$HOUR" -le "11" ]
then
  echo "Good Morning, the time is now $TIME"
elif [ "$HOUR" -ge "13" ] && [ "$HOUR" -le "16" ]
then
  echo "Good Afternoon, it is precisely $TIME"
elif [ "$HOUR" -ge "17" ] && [ "$HOUR" -le "20" ]
then
  echo "Good Evening, the time is currently $TIME"
else
  echo "You should really be in bed"
fi

if [ "$TODAY" -eq "6" ] || [ "$TODAY" -eq "7" ] 
then
  echo "Do the Weekend Whip!"
else
  echo "You should currently be working"
fi
;;
esac
