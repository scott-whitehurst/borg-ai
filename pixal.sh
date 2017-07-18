#!/bin/bash

case "$1" in
'')
echo "Hello $USER, please enter a command"
esac

case "$1" in
'time')

HOUR=$(date "+%H")
TODAY=$(date "+%w")
TIME=$(date "+%T")

if [ "$HOUR" -ge "6" ] && [ "$HOUR" -le "12" ]
then
  echo "Good Morning $USER, the time is now $TIME"
elif [ "$HOUR" -ge "13" ] && [ "$HOUR" -le "16" ]
then
  echo "Good Afternoon $USER, it is precisely $TIME"
elif [ "$HOUR" -ge "17" ] && [ "$HOUR" -le "20" ]
then
  echo "Good Evening $USER, the time is currently $TIME"
else
  echo "It is $TIME - You should really be in bed, $USER"
fi

if [ "$TODAY" -eq "6" ] || [ "$TODAY" -eq "7" ] 
then
  echo "Do the Weekend Whip!"
else
  echo "You should currently be working"
fi
;;
esac
