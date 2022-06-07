#!/bin/bash


read -p "What is the Database name : " name

if  [[ -z $name ]]
then 
	echo "YOU MUST ENTER A NAME"
elif [ -d ./Databases/$name ]
then	
	while true : 
	do
		read -p " Are you sure to delete $name database [y/n] : " check
		case $check in 
			"y"|"Y")
				rm -r ./Databases/$name
				echo " Your Database is deleted successfully "
				break;
				;;
			"n"|"N")
							exit
							;;
				*) echo "invalid choice :("
							;;
		esac
	done
else 
	echo "This Database deosn't exist"
fi
