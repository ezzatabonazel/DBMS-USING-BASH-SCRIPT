#!/bin/bash

read -p " Enter Table Name : " tablename

if [ -f ./Databases/$ctdb/Data/$tablename ] & [ -f ./Databases/$ctdb/metadata/$tablename ]
then

	rm  ./Databases/$ctdb/Data/$tablename 
	rm  ./Databases/$ctdb/metadata/$tablename 

	echo " Table is deleted succssfully "
else 


	echo " Table doesn't exist "

fi
