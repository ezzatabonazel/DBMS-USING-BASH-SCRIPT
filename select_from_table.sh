#!/bin/bash

read -p " Enter Table Name : " tablename 

if ! [[ -z $tablename ]]
then
        if [ -f ./Databases/$ctdb/Data/$tablename ] 
        then
                PS3="$ctdb:$tablename $> "
            select	i in "select all" "select with pk" "Previous Menu" "QUIT"
            do
                case $REPLY in
                1)
                        . ./displaytable.sh
                                 ;;
                2)
                        . ./selectwithpk.sh  
                 
                                ;;
                3)
                	PS3="$ctdb >> "
                                break
                                ;;
                4)      
                              exit 
                                ;;
                *) 
                        echo "wrong choice :("
                                ;;
                esac
            done
        else 

	            echo "NO Such Table Name"
        fi
else 
            echo "ERROR: Table name can not be empty"
fi
