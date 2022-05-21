#!/bin/bash

read -p " Enter Table Name : " tablename

if [ -f /$HOME/db/Databases/$ctdb/Data/$tablename ] & [ -f /$HOME/db/Databases/$ctdb/metadata/$tablename ]
then

	rm -r /$HOME/db/Databases/$ctdb/Data/$tablename 
	rm -r /$HOME/db/Databases/$ctdb/metadata/$tablename 

	echo " Table is deleted succssfully "
else 


	echo " Table doesn't exist "

fi
