#!/bin/bash -x
echo "Snake & Ladder Simulator"

#Declaring Constants
WIN_POSITION=100
INITIAL_POSITION=0

#Declaring Variables
position=1
rollDieNumber=0
noPlay=0
snake=1
ladder=2

function playerAction()
{
	while [ $position -le $WIN_POSITION ]
	do
		rollDieNumber=$((RANDOM%6+1))
		actionRoll=$((RANDOM%3))
		case $actionRoll in
							$noPlay) echo "No Step"
										;;
							$ladder)	echo "Ladder"
										position=$(($position+$rollDieNumber))
										;;
							$snake) echo "Snake"
										position=$(($position-$rollDieNumber))
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
			break
		fi
	done
}

#Calling Function
playerAction
