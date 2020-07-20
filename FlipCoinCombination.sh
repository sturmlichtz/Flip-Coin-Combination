#!/bin/bash
echo "Flip Coin Combination"
declare -A SinletResultsDict
singletResults=(H T)
coinSide=0
SinletResultsDict[${singletResults[$coinSide]}]=0
read -p "How many times you want to flip a single coin :-" limit
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%2))
	SinletResultsDict[${singletResults[$coinSide]}]=$((${SinletResultsDict[${singletResults[$coinSide]}]}+1))
done
for side in ${singletResults[@]}
do
	echo "$side won for :- " ${SinletResultsDict[$side]}
	percantage=$(( (${SinletResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in singlet combination"
done

