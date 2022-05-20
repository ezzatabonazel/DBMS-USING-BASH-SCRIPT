#!/bin/bash


read -p "What is the Database name : " name

if  [ -z $name ]
then 
	echo "YOU MUST ENTER A NAME"
elif [ -d $HOME/db/Databases/$name ]
then	
	read -p " Are you sure to delete $name database [y-n] : " check
	case $check in 
		"y"|"Y")
			rm -r $HOME/db/Databases/$name
			echo " Your Database is deleted successfully "
			;;
		"n"|"N")
			exit
			;;
	esac
else 
	echo "This Database deosn't exist"
fi
