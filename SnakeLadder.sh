#!/bin/bash -x
echo "Snake & Ladder Simulator"

#Declaring Variables
position=0
rollDieNumber=0

function rollDie()
{
	rollDieNumber=$((RANDOM%6 + 1))
	echo $rollDieNumber
}
#Calling rollDie Function
rollDie
