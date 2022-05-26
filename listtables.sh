#!/bin/bash	


if  [ -n  "$(ls  ./Databases/$ctdb/Data/)" ]
then
	ls ./Databases/$ctdb/Data/
else 
	echo " No Tables created yet "
fi
