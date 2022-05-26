#i/bin/bash

if  [ -n  "$(ls  ./Databases/)" ]
then
        ls ./Databases/

else
        echo " No Databases created yet "
fi
