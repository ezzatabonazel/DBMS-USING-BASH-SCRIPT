#!/bin/bash




#select a record
#check data of pk is aleredy exist in data table and print it 
selectrow(){
for i in `cut -f"$RN" -d: ./Databases/$ctdb/Data/$tablename`
do 
    if [[ $i -eq $pk ]]
    then 
            awk -F: 'BEGIN {ORS=":"}{print $1}' ./Databases/$ctdb/metadata/$tablename
            printf "\n"
            awk -F: '{print $0}' ./Databases/$ctdb/Data/$tablename | grep -w $pk    
            break
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
                                    selectrow
                                        
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
                                        selectrow                                        
                            fi
                                            ;;
esac




