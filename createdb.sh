#!/bin/bash

read -p " what is your Datebase name : " dbname

if ! [ -z $dbname ]
then 
	#check of DBname does't begin with number and at least contain one character

	if  [[ $dbname =~ ^[0-9] ]]
	then	
		echo " invalid Database name "

	elif [ -d	./Databases/$dbname ]
	then 
		echo "this Database is already exists"
	else
		
		mkdir ./Databases/$dbname
		mkdir ./Databases/$dbname/Data
		mkdir ./Databases/$dbname/metadata

		echo "your Database is created successfully"
	fi
else	

	echo "PLEASE ENTER A NAME FOR YOUR DATABASE"
fi

