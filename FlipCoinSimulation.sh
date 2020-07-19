#!/bin/bash
echo "Flip Coin Simulation"
headsWins=0
tailsWins=0
ifHeads=0
ifTails=1
counter=0
check=$((RANDOM%2))
counter=$(($counter+1))
if [ $check -eq $ifHeads ]
then
	echo "heads win"
elif [ $check -eq $ifTails ]
then
	echo "tails win"
fi
