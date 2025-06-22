#!/bin/env bash

readExercise () {
	while read line; do
	echo $line | awk {print}
	done <$HOME/scripts/gym.txt
}

writeExercise () {
	for z in ${!ARRAY[@]}; do
	read -p "$z = " y
	ARRAY+=([$z]=$y)
	done
}

writeExercise
