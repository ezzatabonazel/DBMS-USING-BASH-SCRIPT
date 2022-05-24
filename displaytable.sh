#!/bin/bash

	#chnage output record seperator by default is new line
awk -F: 'BEGIN {ORS=":"}{print $1}' metadata/$tablename

printf "\n"

cat Data/$tablename