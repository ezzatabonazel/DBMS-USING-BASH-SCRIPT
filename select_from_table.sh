#!/bin/bash

read -p " Enter Table Name : " tablename 

if ! [ -z $tablename ]
then
        if [ -f ./Databases/$ctdb/Data/$tablename ] 
        then
            select	i in "select all" "select with pk" "QUIT"
            do
                case $REPLY in
                1)
                        . ./displaytable.sh
                                 ;;
                2)
                        . ./selectwithpk.sh  
                                ;;
                3)      
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
