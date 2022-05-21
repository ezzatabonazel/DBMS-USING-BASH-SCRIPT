#!/bin/bash

# Get the table name from user 
read -p "what is your table name" tname 

if ! [ -z $tname ]                                                #first check
then
   if [[$tname =~ ^[0-9]]]                                         #second check 
   then
         echo " sorry invalid table name"
   elif [ -d /Databases/metadata ]                        #Third check 
         echo "sorry the table is already exists"
   else                                            
     touch ~/project/DBMS-USING-BASH-SCRIPT/Databases/$tname     #create file
     #touch c/Users/Mahmoud Rizk/project/DBMS-USING-BASH-SCRIP/Databases/ezzat/metadata/$tname 
     echo "congrats your table is created successfully"
   fi
else
    echo "please enter your table name "
fi



