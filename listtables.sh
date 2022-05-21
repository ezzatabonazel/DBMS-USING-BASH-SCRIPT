#!/bin/bash	


if  [ -n  "$(ls  $HOME/db/Databases/$ctdb/Data)" ]
then
	ls $HOME/db/Databases/$ctdb/Data

else 
	echo " No Tables created yet "
fi
