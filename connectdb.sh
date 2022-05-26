#!/bin/bash

read -p " Database name : " ctdb #connect to DB

if [ -d ./Databases/$ctdb ]
then
	select c in " create table " "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "exit"
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
				 echo soon
                                ;;
			5) 
				. ./select_from_table.sh
						
                                ;;
			6)
				. ./deletefromtable.sh
				
                                ;;
			7)
				 echo soon
				 ;;
			8)
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
