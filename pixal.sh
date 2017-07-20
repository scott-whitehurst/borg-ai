#!/bin/bash

case "$1" in
'')
echo "Hello $USER, please enter a command, or invoke 'help' for a list of actions"
esac

case "$1" in
'help')
echo "What can I help you with, $USER? Please choose from: 'time' 'dice' 'recycle' 'game'"
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
elif [ "$HOUR" -ge "17" ] && [ "$HOUR" -le "23" ]
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

case "$1" in
'dice')

DICE=$(echo $RANDOM % 6 + 1 | bc)

echo "You have rolled the number $DICE"
esac

case "$1" in
'recycle')

echo -n "Hello $USER, please provide the full path to the file you wish to recycle and press [ENTER]: "
read junk
mv $junk ~/trash/
echo "Your unwanted files have been placed in the recycling bin, this will be emptied at the start of next month"
esac

case "$1" in
'game')

PIXTHROW=$(echo $RANDOM % 99 + 1 | bc)
#1-33 is Rock, 34-66 is Paper, 67-99 is Scissors
echo -n "Okay $USER the game is Rock, Paper, Scissors. Make your choice and hit [ENTER]: "
read throw
echo "You threw $throw"
if [ $throw == "Rock" ] && [ "$PIXTHROW" -le "33" ]
then echo -en "I throw rock\nIt is a draw"
elif [ $throw == "Rock" ] && [ "$PIXTHROW" -ge "34" -a "$PIXTHROW" -le "66" ]
then echo -en "I throw paper\nI have won ^^"
elif [ $throw == "Rock" ] && [ "$PIXTHROW" -ge "67" -a "$PIXTHROW" -le "99" ]
then echo -en "I throw scissors\nYou have won, well done $USER"
elif [ $throw == "Paper" ] && [ "$PIXTHROW" -le "33" ]
then echo -en "I throw rock\nYou have beaten me!"
elif [ $throw == "Paper" ] && [ "$PIXTHROW" -ge "34" -a "$PIXTHROW" -le "66" ]
then echo -en "I throw Paper\nAh, it is a draw"
elif [ $throw == "Paper" ] && [ "$PIXTHROW" -ge "67" -a "$PIXTHROW" -le "99" ]
then echo -en "I throw scissors\nI have triumphed over $USER"
elif [ $throw == "Scissors" ] && [ "$PIXTHROW" -le "33" ]
then echo -en "I throw rock\nMy rock beats your scissors!"
elif [ $throw == "Scissors" ] && [ "$PIXTHROW" -ge "34" -a "$PIXTHROW" -le "66" ]
then echo -en "I throw paper\nCongratulations, $USER"
elif [ $throw == "Scissors" ] && [ "$PIXTHROW" -ge "67" -a "$PIXTHROW" -le "99" ]
then echo -en "I throw scissors\nTwo scissors? It is a draw then"
else echo "Sorry, I didn't register that, please try again"
fi
;;
esac
