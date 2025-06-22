#!/bin/env bash

readExercise () {
	readarray ARRAY < $HOME/scripts/gym.txt
}

writeExercise () {
	for z in ${!ARRAY[@]}; do
	read -p "$z = " y
	ARRAY+=([$z]=$y)
	done
}

readExercise
echo ${ARRAY[@]}
#writeExercise
