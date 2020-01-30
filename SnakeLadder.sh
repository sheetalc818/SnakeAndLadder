#!/bin/bash -x
echo "Snake & Ladder Simulator"

#Declaring Variables
position=0
rollDieNumber=0
noPlay=0
snake=1
ladder=2

function rollDie()
{
	rollDieNumber=$((RANDOM%6 + 1))
	echo $rollDieNumber
}

function playerAction()
{
	actionRoll=$((RANDOM%3))
	case $actionRoll in
							$noPlay) echo "No Step"
										;;
							$snake)	echo "Snake"
										position=$((position-$rollDieNumber))
										;;
							$ladder) echo "Ladder"
										position=$((position+$rollDieNumber))
										;;
	esac
}

#Calling Functions
rollDie
playerAction $rollDieNumber
