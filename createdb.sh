#!/bin/bash

LC_ALL=C
shopt -s extglob

while true :
do

	read -p " what is your Datebase name : " dbname

	if [[ -z $dbname ]]
	then
			echo "PLEASE ENTER A NAME FOR YOUR DATABASE"
	elif [ -d ./Databases/$dbname ]
	then
		       echo "this database is existed"
	else

			case $dbname in
					+([a-zA-Z_-]) )		
						mkdir Databases/$dbname
						mkdir Databases/$dbname/Data
						mkdir Databases/$dbname/metadata
						echo "your Database is created successfully"
						break
						;;
					
					*)	

						echo "invalid Database name ,must contain only characters :("
						;;
			esac
		fi

done
