#!/bin/bash

read -p " Enter Table Name : " tablename 

if ! [ -z $tablename ]
then
        if [ -f /$HOME/db/Databases/$ctdb/Data/$tablename ] 
        then
            select	i in "select all" "select with pk" 
            do
                case $REPLY in
                1)
                        . displaytable.sh
                            ;;
                2)
                        . selectwithpk.sh  
                            ;;
                esac
            done
        else 

	            echo "NO Such Table Name"
        fi
else 
            echo "ERROR: Table name can not be empty"
fi
