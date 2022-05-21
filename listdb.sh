#i/bin/bash

if  [ -n  "$(ls  $HOME/db/Databases/)" ]
then
        ls $HOME/db/Databases/

else
        echo " No Databases created yet "
fi
