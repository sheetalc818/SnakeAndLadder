#!/bin/bash -x

echo "Snake & Ladder Simulator"

#Declaring Constants
WIN_POSITION=100
INITIAL_POSITION=0
player1=1
player2=1

#Declaring Variables
position=1
rollDiceNumber=0
noPlay=0
snake=1
ladder=2
diceCount=0

function playerAction()
{
	while ! [[ $player1 -eq $WIN_POSITION || $player2 -eq $WIN_POSITION ]]
	do
		for (( turn=1; turn<=2; turn++ ))
		do
			if [ $turn -eq 1 ]
			then
				rollDiceNumber=$((RANDOM%6+1))
				diceCount=$(($diceCount+$rollDiceNumber))
				actionRoll=$((RANDOM%3))
				case $actionRoll in
							$noPlay) echo "No Step"
										;;
							$ladder)	echo "Ladder"
										player1=$(($player1+$rollDiceNumber))
										action=$((RANDOM%3))
                					while [ $action -eq $ladder ]
                					do
                	  					player1=$(($player1 + $rollDiceNumber))
               		  				action=$((RANDOM%3))
                					done
										;;
							$snake) echo "Snake"
										player1=$(($player1-$rollDiceNumber))
										;;
				esac

				#If position goes belowe zero
				if [ $player1 -lt $INITIAL_POSITION ]
				then
					player1=$INITIAL_POSITION
				fi

				#Checking for Winning position
				if [ $player1 -eq $WIN_POSITION ]
				then
					echo "========Hurray!!! Player1 won the game======="
					echo "All dice count:"$diceCount
					break
				fi
			fi
			if [ $turn -eq 2 ]
			then
				rollDiceNumber=$((RANDOM%6+1))
            diceCount=$(($diceCount+$rollDiceNumber))
            actionRoll=$((RANDOM%3))
            case $actionRoll in
                     $noPlay) echo "No Step"
                              ;;
                     $ladder) echo "Ladder"
                              player2=$(($player2+$rollDiceNumber))
                              action=$((RANDOM%3))
                              while [ $action -eq $ladder ]
                              do
                                 player2=$(($player2 + $rollDiceNumber))
                                 action=$((RANDOM%3))
                              done
                              ;;
                     $snake) echo "Snake"
                              player2=$(($player2-$rollDiceNumber))
                              ;;
            esac
				#If position goes belowe zero
            if [ $player2 -lt $INITIAL_POSITION ]
            then
               player1=$INITIAL_POSITION
            fi

            #Checking for Winning position
            if [ $player2 -eq $WIN_POSITION ]
            then
               echo "========Hurray!!! Player2 won the game======="
               echo "All dice count:"$diceCount
               break
            fi
			fi
			done
		done
}

#Calling Function
playerAction
