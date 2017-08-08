#!/bin/bash

case "$1" in
'')
echo "Hello $USER, please enter a command, or invoke 'help' for a list of actions"
;;

'help')
echo "What can I help you with, $USER? Please choose from: 'time' 'dice' 'recycle' or 'game' then press [ENTER]:"
read helpwith
  case $helpwith in
  'extract') echo "Work in progress - extract the contents of an archive file" ;;
  'time') echo "Invoke this to check the current time of day" ;;
  'dice') echo "Specify the 'dice' command followed by a number and I will roll that many virtual dice for you" ;;
  'recycle') echo "This function is currently in development, however I will prompt you for a file to be staged for deletion and move it to the recycling bin" ;;
  'game') echo "Apply this command to play a game of 'Rock, Paper, Scissors' with me" ;;
  *) echo "Sorry I don't understand, please double-check the commands available for help" ;;
  esac
;;

'extract')
SUCCESS="I have extracted those files to the /tmp directory for you"
echo "Please provide the full path to the archive file you want extracted and press [ENTER]:"
read ARCHIVE
if [ -z "$ARCHIVE" ]
then echo "Please double-check the name of the archive file and confirm it exists"
else
  case $ARCHIVE in
  *.tar) tar -xvf $ARCHIVE -C /tmp/ 
        echo $SUCCESS ;;
  *.tar.gz) tar -zxvf $ARCHIVE -C /tmp/ 
        echo $SUCCESS ;;
  *.zip) unzip -d /tmp/ $ARCHIVE 
        echo $SUCCESS ;;
  *.7z) yum install p7zip-full 
        7z x $ARCHIVE 
        echo $SUCCESS;;
  *) echo "Sorry I don't recognise that file - check the filename and location or it may be an archive format I don't support" ;;
  esac
fi
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
DICE1=$(echo $RANDOM % 6 + 1 | bc)
DICE2=$(echo $RANDOM % 6 + 1 | bc)
  case $2 in
  '1') echo "You have rolled the number $DICE1" ;;
  '2') echo "You have rolled $DICE1 and $DICE2" ;;
  *) echo "Error - please check dice instructions with 'help dice'"
  esac
;;

'recycle')
DAYMONTH=date "+%d"

echo -n "Hello $USER, please provide the full path to the file you wish to recycle and press [ENTER]: "
read junk
mv $junk ~/trash/
if [ $? == "1" ]
then echo "Sorry I have been unable to locate that file, please check the directory path"
else
echo "Your unwanted files have been placed in the recycling bin, this will be emptied at the start of next month"

# Deletes the contents of the recycling bin on the first of the month
  if [ $DAYMONTH == "01" ]
  then rm -rf ~/trash/*
  fi

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
