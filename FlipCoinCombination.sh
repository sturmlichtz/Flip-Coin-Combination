#!/bin/bash 
echo "Flip Coin Combination"
declare -A ResultsDict
singletResults=(H T)
coinSide=0
ResultsDict[${singletResults[$coinSide]}]=0
read -p "How many times you want to flip coins :-" limit
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%2))
	ResultsDict[${singletResults[$coinSide]}]=$((${ResultsDict[${singletResults[$coinSide]}]}+1))
done
for side in ${singletResults[@]}
do
	echo "$side won for :- " ${ResultsDict[$side]}
	percantage=$(( (${ResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in singlet combination"
done

doubletResults=(HH HT TH TT)
ResultsDict[${doubletResults[$coinSide]}]=0
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%4))
	ResultsDict[${doubletResults[$coinSide]}]=$((${ResultsDict[${doubletResults[$coinSide]}]}+1))
done
for side in ${doubletResults[@]}
do
	echo "$side won for :- " ${ResultsDict[$side]}
	percantage=$(( (${ResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in doublet combination"
done
winningCombination=${singletResults[1]}
for side in ${!ResultsDict[@]}
do
   if [ ${ResultsDict[$side]} -gt ${ResultsDict[$winningCombination]} ]
   then
      winningCombination=$side
   fi
done
echo "Winning Combination is "$winningCombination
