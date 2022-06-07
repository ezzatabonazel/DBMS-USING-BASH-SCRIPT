#!/bin/bash

read -p " Database name : " ctdb #connect to DB

if [[ -z $ctdb ]]
then 
		echo "ERROR: Empty Entry"
elif [ -d ./Databases/$ctdb ]
then
	PS3="$ctdb >> "
	select c in "create table " "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "Pervious Menu" "exit"
	do
		case $REPLY in
			1)
				. ./createtable.sh
				 
				;;
			2)
                 . ./listtables.sh
				 	
				;;
			3) 
				.  ./droptable.sh
					
				;;
			4) 
				. ./insertnew.sh
                                ;;
			5) 
				. ./select_from_table.sh
						
                                ;;
			6)
				. ./deletefromtable.sh
				
                                ;;
			7)
				 . ./updatecell.sh
				 ;;
			8) 
				
				break;;
			9)
				exit
				 ;;
			*)
				echo "wrong choice :(" 
				;;
 		 esac
	done 	
else 

	echo " No Such Database Name "	
fi 
