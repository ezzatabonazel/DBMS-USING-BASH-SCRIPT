#!/bin/bash

read -p " Enter Table Name : " tablename 

if ! [ -z $tablename ]
then
        if [ -f ./Databases/$ctdb/Data/$tablename ] 
        then
            select	i in "DELETE RECORD" "DELETE COLUMN" "QUIT"
            do
                case $REPLY in
                1)
                        . ./deleterecord.sh
                            ;;
                2)
                        . ./deletecolunm.sh 
                            ;;
                3)              exit
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
