#!/bin/bash

read -p " Enter Table Name : " tablename

if [ -f /$HOME/db/Databases/$dbname/Data/$tablename ] & [ -f /$HOME/db/Databases/$dbname/metadata/$tablename ]
then

	rm -r /$HOME/db/Databases/$dbname/Data/$tablename 
	rm -r /$HOME/db/Databases/$dbname/metadata/$tablename 

	echo " Table is deleted succssfully "
else 


	echo " Table doesn't exist "

fi
