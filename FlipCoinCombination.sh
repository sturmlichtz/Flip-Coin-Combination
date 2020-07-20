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

tripletResults=(HHH HHT HTH THH HTT THT TTH TTT)
ResultsDict[${tripletResults[$coinSide]}]=0
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%8))
	ResultsDict[${tripletResults[$coinSide]}]=$((${ResultsDict[${tripletResults[$coinSide]}]}+1))
done
for side in ${tripletResults[@]}
do
	echo "$side won for :- " ${ResultsDict[$side]}
	percantage=$(( (${ResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in triplet combination"
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
