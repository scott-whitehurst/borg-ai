#!/bin/bash

case "$1" in
'')
echo "Hello $USER, please enter a command, or invoke 'help' for a list of actions"
;;

'help')
echo "What can I help you with, $USER? Please choose from: 'time' 'dice' 'recycle' 'game'"
;;

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

'dice')
DICE=$(echo $RANDOM % 6 + 1 | bc)
echo "You have rolled the number $DICE"
;;

'recycle')
echo -n "Hello $USER, please provide the full path to the file you wish to recycle and press [ENTER]: "
read junk
mv $junk ~/trash/
if [ $? == "1" ]
then echo "Sorry I have been unable to locate that file, please check the directory path"
else
echo "Your unwanted files have been placed in the recycling bin, this will be emptied at the start of next month"
fi
;;

'game')
PIXTHROW=$(echo $RANDOM % 99 + 1 | bc)
#1-33 is Rock, 34-66 is Paper, 67-99 is Scissors
echo -n "Okay $USER the game is Rock, Paper, Scissors. Make your choice and hit [ENTER]: "
read throw
echo "You threw $throw"
  if [ "$PIXTHROW" -le "33" ]
  then PIXTHROW=Rock
  elif [ "$PIXTHROW" -ge "34" -a "$PIXTHROW" -le "66" ]
  then PIXTHROW=Paper
  else PIXTHROW=Scissors
  fi
    case $throw in
    'Rock') 
        case $PIXTHROW in
        "Rock") echo -e "I throw rock\nIt is a draw" ;;
        "Paper") echo -e "I throw paper\nI have won ^^" ;;
        "Scissors") echo -e "I throw scissors\nYou have won, well done $USER" ;;
    esac ;;
    'Paper') 
        case $PIXTHROW in
        "Rock") echo -e "I throw rock\nYou have beaten me!" ;;
        "Paper") echo -e "I throw Paper\nAh, it is a draw" ;;
        "Scissors") echo -e "I throw scissors\nI have triumphed over $USER" ;;
    esac ;;
    'Scissors')
        case $PIXTHROW in
        "Rock") echo -e "I throw rock\nMy rock beats your scissors!" ;;
        "Paper") echo -e "I throw paper\nCongratulations, $USER" ;;
        "Scissors") echo -e "I throw scissors\nTwo scissors? It is a draw then" ;;
    esac ;;
    *) echo "Sorry, I didn't register that, please try again" ;;
    esac
;;


*)
echo "Sorry I don't know that command, please check your spelling or view the available functions with 'help'"
;;
esac
