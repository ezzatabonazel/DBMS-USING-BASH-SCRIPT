#!/bin/bash

read -p "what is colunm name : " colname
if  ! [[ -z $colname ]]
then
    while true :
    do
        for i in `awk -F: 'BEGIN{ORS=""}{print $1}' Databases/$ctdb/Data/$tablename`
        do 

            if [[ $i==$colname ]]
            then    
                    pkcheck=`awk -F: -v awkvar="$colname" '{if($1==awkvar){print $3;}}' Databases/$ctdb/metadata/$tablename`

                    if  [ $pkcheck == "no" ] 
                    then
                        RN=`awk -F: -v awkvar="$colname" '{if($1==awkvar){print NR;}}' Databases/$ctdb/metadata/$tablename`
                        sed "${RN} d"  ./Databases/$ctdb/metadata/$tablename > Databases/$ctdb/metadata/$tablename.new      
                        mv ./Databases/$ctdb/metadata/$tablename.new Databases/$ctdb/metadata/$tablename 
                    

                        cut  -d: -f"$RN" --complement Databases/$ctdb/Data/$tablename > Databases/$ctdb/Data/$tablename.new  
                        mv ./Databases/$ctdb/Data/$tablename.new Databases/$ctdb/Data/$tablename  
                        echo "colunm and its data deleted successfully"
                        break 2
                    else 
                            echo "primary key colunm can't be deleted"
                            break 2
                    fi
            fi
            done
            
    echo " No Such Colunm Name "
    break
    done
else 
            echo "Colunm Name can not be empty"
fi

