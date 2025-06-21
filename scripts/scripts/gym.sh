#!/bin/env bash
source gym.txt

ARRAY=("" 0 0 0 0 0)
writeExercise () {
	for z in ${!ARRAY[@]}; do
	read -p "$z = " y
	ARRAY+=([$z]=$y)
	done
}

readExercise () {
	
}

writeExercise
