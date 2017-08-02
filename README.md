# borg-ai

Functionality based on input:

None:
Echo the user's name when invoked, list the available functions

Help:
Display the commands available for description, capture user input and describe the functionality and how to properly invoke that action

Time:
When time is given as a parameter, provide two strings referring to the time of day and whether the user should be on/off the job

Dice:
Very basic diceroll to echo number from 1 to 6

Recycle:
Based on user input, move a file to the trash directory (reporting error if file not found) - consider configuring a cron job to empty this at the start of every month

Game:
Play a game of rock, paper, scissors with the user - this was previously a long series of if and elif comparisons of user input against the random number. Now it takes the form of multiple nested case statements to match conditions for input vs ai to reach a result

Unrecognised:
Inform the user of the error and direct them to the help command to check functions
