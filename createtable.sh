#!/bin/bash

# Get the table name from user 
read -p "what is your table name" tname 

if ! [ -z $tname ]                                                      #first check
then
      if[[ $tname =~ ^[0-9] ]]                                          #second check 
      then

         echo " ERROR: invalid table name"
      
      elif[ -f $HOME/db/Databases/$ctdb/metadata/$tname ] && [ -f $HOME/db/Databases/$ctdb/Data/$tname ]                  #Third check 
            
            echo "ERROR: the table is already exists"
      else                                            
            touch $HOME/db/Databases/$ctdb/Data/$tname                        #create file
            touch $HOME/db/Databases/$ctdb/metadata/$tname 
            echo "congrats your table is created successfully"
      fi
else
    echo "ERROR: Table name can not be empty"
fi


for getdata in ${primaryCol[@]}

