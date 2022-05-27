#!/bin/bash

LC_ALL=C
shopt -s extglob

while true :
do

	read -p " what is your Datebase name : " dbname

	if ! [ -z $dbname ]
	then 
	#check of DBname does't begin with number and at least contain one character
			case $dbname in
					+([a-zA-Z]) )		
						mkdir ./Databases/$dbname
						mkdir ./Databases/$dbname/Data
						mkdir ./Databases/$dbname/metadata
						echo "your Database is created successfully"
						break
						;;
					*)
						echo "invalid Database name ,must contain only characters :)"
						;;
			esac
		
	else	

	echo "PLEASE ENTER A NAME FOR YOUR DATABASE"
	fi

done