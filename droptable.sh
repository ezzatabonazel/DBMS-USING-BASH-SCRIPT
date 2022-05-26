#!/bin/bash

read -p " Enter Table Name : " tablename

if [ -f Data/$tablename ] & [ -f metadata/$tablename ]
then

	rm -r Data/$tablename 
	rm -r metadata/$tablename 

	echo " Table is deleted succssfully "
else 


	echo " Table doesn't exist "

fi
