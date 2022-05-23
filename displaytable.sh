#!/bin/bash




# ctdb is connect to db from connect pervious list

read -p " Enter Table Name : " tablename 

if [ -f /$HOME/db/Databases/$ctdb/Data/$tablename ] && [ -f /$HOME/db/Databases/$ctdb/metadata/$tablename ]
then
	#chnage output record seperator by default is new line

	awk -F: 'BEGIN {ORS=":"}{print $1}' /$HOME/db/Databases/$ctdb/metadata/$tablename

	printf "\n"

	cat $HOME/db/Databases/$ctdb/Data/$tablename
else 

	echo "this table doesn't exist"
fi
