#!/bin/bash -x
echo "Snake & Ladder Simulator"

#Declaring Constants
WIN_POSITION=100
INITIAL_POSITION=0

#Declaring Variables
position=1
rollDiceNumber=0
noPlay=0
snake=1
ladder=2
diceCount=0

#Declaring the Dictionary
declare -A positionHistory

function playerAction()
{
	while [ $position -le $WIN_POSITION ]
	do
		rollDiceNumber=$((RANDOM%6+1))
		diceCount=$(($diceCount+$rollDiceNumber))
		actionRoll=$((RANDOM%3))
		case $actionRoll in
							$noPlay) echo "No Step"
										;;
							$ladder)	echo "Ladder"
										position=$(($position+$rollDiceNumber))
										;;
							$snake) echo "Snake"
										position=$(($position-$rollDiceNumber))
										;;
		esac

		#If position goes belowe zero
		if [ $position -lt $INITIAL_POSITION ]
		then
			position=$INITIAL_POSITION
		fi

		#Checking for Winning position
		if [ $position -eq $WIN_POSITION ]
		then
			echo "========Hurray!!! You won the game======="
			echo "All dice count:"$diceCount
			break
		fi

		positionHistory[$((counter++))]=$position
	done
	echo ${positionHistory[@]}
}

#Calling Function
playerAction
