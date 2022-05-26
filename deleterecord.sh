#!/bin/bash

#delete record with primary key

deleterecord(){
for i in `cut -f"$RN" -d: ./Databases/$ctdb/Data/$tablename`
do 
    if [[ $i -eq $pk ]]
    then 
            sed -e "$fn"'d'  ./Databases/$ctdb/Data/$tablename > ./Databases/$ctdb/Data/$tablename
    elif ! [[ $i -eq $pk ]]        
    then
                continue                
    fi
echo "thank you"        
done
}



#get primary key column name

awk -F: '{if($3=="yes"){print "the table primary key coulmn name is ", $1;}}' ./Databases/$ctdb/metadata/$tablename

#get Record Number in metadata table 
RN=`awk -F: '{if($3=="yes"){print NR ;}}' ./Databases/$ctdb/metadata/$tablename`
#get data type of pk
datatype=`awk -F: -v awkvar="$RN" ' NR==awkvar {print $2;}' ./Databases/$ctdb/metadata/$tablename`

#get the data from user of pk
read -p "whatis your primary key data : " pk

#match if input match datatype of pk
case $datatype in 
                "number" )  
                            if [[ $pk =~ ^[0-9]+$ ]]
                            then 
                                    deleterecord()
                                        
                            elif [[ $pk =~ [a-zA-Z] ]]
                            then 
                                        
                                    echo "your input doesn't match datatype of pk column"
  
                            fi
                                            ;;
                "string" )  
                            if [[ $pk =~ ^[0-9]+$ ]]
                            then 
                                    echo "your input doesn't match datatype of pk column"
                                        
                            elif [[ $pk =~ [a-zA-Z] ]]
                            then 
                                         deleterecord()                              
                            fi
                                            ;;
esac
