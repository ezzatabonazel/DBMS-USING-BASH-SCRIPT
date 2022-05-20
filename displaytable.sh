#!/bin/bash

read -p " Enter Table Name : " tablename 

if [ -f /$HOME/db/Databases/$dbname/Data/$tablename ] & [ -f /$HOME/db/Databases/$dbname/metadata/$tablename ]
then
	#chnage output record seperator by default is new line

	awk -F: 'BEGIN {ORS=":"}{print $1}' /$HOME/db/Databases/$dbname/metadata/$tablename

	printf "\n"

	cat $HOME/db/Databases/$dbname/Data/$tablename
else 

	echo "this table doesn't exist"
fi
