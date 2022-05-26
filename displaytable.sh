#!/bin/bash

	#chnage output record seperator by default is new line
awk -F: 'BEGIN {ORS=":"}{print $1}' ./Databases/$ctdb/metadata/$tablename

printf "\n"

cat ./Databases/$ctdb/Data/$tablename