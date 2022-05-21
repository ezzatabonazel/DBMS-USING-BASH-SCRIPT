#!/bin/bash

# Get the table name from user 
read -p "what is your table name" tname 

if ! [ -z $tname ]                                                #first check
then
   if[[$tname =~ ^[0-9]]]                                         #second check 
   then
         echo " sorry invalid table name"
   elif[ -f $HOME/db/Databases && /Databases/Data ]                        #Third check 
         echo "sorry the table is already exists"
   else                                            
     touch $HOME/db/Databases/$ctdb/Data/$tname     #create file
     touch $HOME/db/Databases/$ctdb/metadata/$tname 
     echo "congrats your table is created successfully"
   fi
else
    echo "please enter your table name "
fi


for getdata in ${primaryCol[@]}

