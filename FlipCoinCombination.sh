#!/bin/bash 
echo "Flip Coin Combination"
declare -A SingletResultsDict
singletResults=(H T)
coinSide=0
SingletResultsDict[${singletResults[$coinSide]}]=0
read -p "How many times you want to flip a single coin :-" limit
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%2))
	SingletResultsDict[${singletResults[$coinSide]}]=$((${SingletResultsDict[${singletResults[$coinSide]}]}+1))
done
for side in ${singletResults[@]}
do
	echo "$side won for :- " ${SingletResultsDict[$side]}
	percantage=$(( (${SingletResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in singlet combination"
done

declare -A DoubletResultsDict
doubletResults=(HH HT TH TT)
DoubletResultsDict[${doubletResults[$coinSide]}]=0
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%4))
	DoubletResultsDict[${doubletResults[$coinSide]}]=$((${DoubletResultsDict[${doubletResults[$coinSide]}]}+1))
done
for side in ${doubletResults[@]}
do
	echo "$side won for :- " ${DoubletResultsDict[$side]}
	percantage=$(( (${DoubletResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in doublet combination"
done

declare -A TripletResultsDict
tripletResults=(HHH HHT HTH THH HTT THT TTH TTT)
TripletResultsDict[${tripletResults[$coinSide]}]=0
for((i=o;i<$limit;i++))
do
	coinSide=$((RANDOM%8))
	TripletResultsDict[${tripletResults[$coinSide]}]=$((${TripletResultsDict[${tripletResults[$coinSide]}]}+1))
done
for side in ${tripletResults[@]}
do
	echo "$side won for :- " ${TripletResultsDict[$side]}
	percantage=$(( (${TripletResultsDict[$side]}*100)/$limit ))
	echo "$side won for $percantage % in triplet combination"
done

winningCombination=${singletResults[1]}
for side in ${!SingletResultsDict[@]}
do
   if [ ${SingletResultsDict[$side]} -gt ${SingletResultsDict[$winningCombination]} ]
   then
      winningCombination=$side
   fi
done
echo "Winning Combination in Singlet is "$winningCombination

winningCombination=${doubletResults[1]}
for side in ${!DoubletResultsDict[@]}
do
   if [ ${DoubletResultsDict[$side]} -gt ${DoubletResultsDict[$winningCombination]} ]
   then
      winningCombination=$side
   fi
done
echo "Winning Combination in Doublet is "$winningCombination

winningCombination=${tripletResults[1]}
for side in ${!TripletResultsDict[@]}
do
   if [ ${TripletResultsDict[$side]} -gt ${TripletResultsDict[$winningCombination]} ]
   then
      winningCombination=$side
   fi
done
echo "Winning Combination in Triplet is "$winningCombination
