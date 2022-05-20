#!/bin/bash

read -p " Enter Table Name : " tablename 

if [ -f /$HOME/db/Databases/Data/$tablename && -f /$HOME/db/Databases/metadata/$tablename ]
then
	awk -F: '{BEGIN ORS=":"}{print $1}' /$HOME/db/Databases/metadata/$tablename

	printf "\n"

	cat $HOME/db/Databases/Data/$tablename
else 

	echo "this table doesn't exist"
fi
