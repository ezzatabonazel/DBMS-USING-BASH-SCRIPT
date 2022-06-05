#!/bin/bash

#delete record with primary key

deleterecord(){
while true :
do    
	typeset -i Rlocation                    #record location in data table
	Rlocation=0

        for values in `cut -f"$RN" -d: Databases/$ctdb/Data/$tablename`
        do 
			 Rlocation+=1
		      if [ $values == $pk ]
		      then
                        	sed "${Rlocation} d"  Databases/$ctdb/Data/$tablename > Databases/$ctdb/Data/$tablename.new      
                        	mv Databases/$ctdb/Data/$tablename.new Databases/$ctdb/Data/$tablename 
                       		echo "This Record Deletad Successfully"
                                        break  2
           	     fi       
        done
echo "THIS ENTRY DOESN'T EXIST IN DATA"
break
done 
}



#get primary key column name

awk -F: '{if($3=="yes"){print "the table primary key coulmn name is ", $1;}}' ./Databases/$ctdb/metadata/$tablename

#get Record Number in metadata table 
RN=`awk -F: '{if($3=="yes"){print NR ;}}' ./Databases/$ctdb/metadata/$tablename`
#get data type of pk
datatype=`awk -F: -v awkvar="$RN" ' NR==awkvar {print $2;}' ./Databases/$ctdb/metadata/$tablename`

#get the data from user of pk
while true :
do
read -p "whatis your primary key data : " pk

#match if input match datatype of pk
case $datatype in 
                "number" )  
                            if [[ $pk =~ ^[0-9]+$ ]]
                            then 
                                    deleterecord
                                    break;

                            elif [[ $pk =~ [a-zA-Z] ]]
                            then 
                                
                                  echo "your input doesn't match datatype of pk column"
                                        
                            fi
                                            ;;
                "string" )  
                            if [[ $pk =~ ^[0-9]+$ ]]
                            then 
                                    echo "your input doesn't match datatype of pk column"
                                        
                            elif [[ $pk =~ ^[a-zA-Z]+$ ]]
                            then 
                                         deleterecord
                                         break   ;                          
                            fi
                                            ;;
esac
done
