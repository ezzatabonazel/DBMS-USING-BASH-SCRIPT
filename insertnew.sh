#!/bin/bash

ifpk(){
    
for i in `awk -F: -v colname="$1" '{if($1==colname ){print $3}}' Databases/$ctdb/metadata/$tablename`
do
echo "$i"
done
}

getdatatype(){
        
for i in `awk -F: -v colname="$1" '{if($1==colname ){print $2}}' Databases/$ctdb/metadata/$tablename`  

do
echo "$i"
done
}



gettablename() {
while true :
do
read -p "enter table name : "  tablename
if [ -z $tablename ]
then  
      echo " table name can not be empty "
else
        if [ -f Databases/$ctdb/Data/$tablename ]
        then 
                break
                
       else
                echo "this table doesn't exist"
        fi
fi
done   
}
gettablename 
echo "this is column names "
tabledata=""
awk -F: 'BEGIN{ORS="\t"}{print $1}END{printf "\n"}' Databases/$ctdb/metadata/$tablename
echo "insert your data by order of column names " 
for colname in `awk -F: 'BEGIN{ORS="\t"}{print $1}' Databases/$ctdb/metadata/$tablename` 
do 
fn=`awk -F: -v name="$colname" '{if($1==name ){print NR}}' Databases/$ctdb/metadata/$tablename`  


while true :
do
        read -p "enter data of colunm '$colname' : " rowdata
        if [ -z $rowdata ]
        then 
                echo "this field can not be empty "
                continue
        else
                if [ "$(getdatatype $colname)" == "number" ]
                then  
                                    if [[ $rowdata =~ ^[0-9]+$ ]]
                                    then
                                        if [ "$(ifpk $colname)"=="yes" ]
                                        then
                                                
                                                for coldata in `cut -d: -f"$fn" Databases/$ctdb/Data/$tablename`
                                                do 
                                                        if [ $coldata == "$rowdata" ]
                                                        then
                                                                echo "this colounm is primary key this entry is repeated " 
                                                                continue 2
                                                        fi
                                                done              
                                        fi
                                        
                                elif [[ $rowdata =~ [a-zA-Z] ]]
                                then 
                                        
                                    echo "sorry your input doesn't match datatype of "$colname""
                                    continue
                                fi
                else
                            if [[ $rowdata =~ ^[0-9]+$ ]]
                            then 
                                    echo "your input doesn't match datatype of "$colname""
                                    continue
                            elif [[ $rowdata =~ [a-zA-Z] ]]
                            then 

                                    if [ "$(ifpk $colname)" == "yes" ]
                                    then
                                                        for coldata in `cut -d: -f"$fn" Databases/$ctdb/Data/$tablename`
                                                        do 
                                                                if [ $coldata = "$rowdata" ]
                                                                then
                                                                        echo "this colounm is primary key this entry is repeated "
                                                                        continue 2       
                                                                fi
                                                        done
                                        
                                        fi
                                                                                 
                            fi
                                        
                fi
       fi
tabledata=$tabledata:$rowdata
break
done
done
echo "$tabledata"| awk -F: '{sub(":","");print $0}' >> Databases/$ctdb/Data/$tablename
echo " your record is inserted successfully :) "


