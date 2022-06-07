#!/bin/bash

validatepkvalue(){
    
valid=0  #true


case $pkdatatype in                                   #match if input match datatype of pk colunm


                "number" )  
                            if [[ $1 =~ ^[0-9]+$ ]]
                            then 
                                    
                                    valid=0
                                        
                            elif [[ $1 =~ [a-zA-Z] ]]
                            then 
                                        
                                    
                                    valid=1
                            fi
                                echo $valid
                                            ;;
                "string" )  
                            if [[ $1 =~ ^[0-9]+$ ]]
                            then 
                                    valid=1
                                    
                            elif [[ $1 =~ [a-zA-Z] ]]
                            then 
                                        valid=0 
                                        
                                                                         
                            fi
                                          echo $valid
                                            ;;
esac

}


updatecell(){

awk -F: '{if($3=="yes"){print "the table primary key coulmn name is ", $1;}}' ./Databases/$ctdb/metadata/$tablename         #get primary key column name
read -p "what is primary key colunm value : " pkvalue


if [ "$(validatepkvalue $pkvalue)" == 0 ]
then

typeset -i Rlocation                    #record location in data table
Rlocation=0
for values in `cut -d: -f"$pkRN"  Databases/$ctdb/Data/$tablename`
do
      Rlocation+=1
      if [ $values == $pkvalue ]
      then
            break 
      fi
done
awk -F: -v awkvar="$Rlocation" -v newvalue="$cellvalue" -v fn="$RN" '{if(NR==awkvar)
{for(i=1;i<NF;i++)
{if(i=fn)
{gsub($i,newvalue)
}
}
}print $0}' ./Databases/$ctdb/Data/$tablename > ./Databases/$ctdb/Data/$tablename.new

mv ./Databases/$ctdb/Data/$tablename.new ./Databases/$ctdb/Data/$tablename
echo "THE NEW VALUE UPDATED SUCCESFULLY"
else
        echo "sorry your input doesn't match datatype of pk column"
fi
}

read -p " what is your table name : " tablename

if [[ -z $tablename ]]
then 
        echo " can not be empty "

elif ! [ -f Databases/$ctdb/Data/$tablename ]
then 
                echo "this table doesn't exist"

else    
while true :
do        
pkRN=`awk -F: '{if($3=="yes"){print NR ;}}' ./Databases/$ctdb/metadata/$tablename`                #get RECORD NUMBER of pk
pkdatatype=`awk -F: -v awkvar="$pkRN" ' NR==awkvar {print $2;}' ./Databases/$ctdb/metadata/$tablename`        #get data type of pk

        read -p "what is colunm name you want to update " colname

        for i in `cut -f1 -d: ./Databases/$ctdb/metadata/$tablename`
        do 
                if [[ $i == $colname ]]
                then
                    RN=`awk -F: -v awkvar="$colname" '{if($1==awkvar){print NR ;}}' Databases/$ctdb/metadata/$tablename`      #get record number of updated colunm
                    datatype=`awk -F: -v awkvar="$RN" ' NR==awkvar {print $2;}' Databases/$ctdb/metadata/$tablename`        #get data type of updated colunm
                
                    read -p  "THE NEW VALUE OF THIS CELL : " cellvalue


                         case $datatype in                                       #match if input match datatype of this colunm

                        "number" )  
                            if [[ $cellvalue =~ ^[0-9]+$ ]]
                            then 
                                    
                                    updatecell
                                    break 2
                                    
                            elif [[ $cellvalue =~ [a-zA-Z] ]]
                            then 
                                        
                                    echo "sorry your input doesn't match datatype of this column"
                                    continue 2
                            fi
                                            ;;
                        "string" )  
                            if [[ $cellvalue =~ ^[0-9]+$ ]]
                            then 
                                    echo "your input doesn't match datatype of this column"
                                    continue 2
                            elif [[ $cellvalue =~ [a-zA-Z] ]]
                            then 
                                        updatecell
                                        break 2
                                                                         
                            fi
                                            ;;
                        esac
                    
                fi
        done
echo " NO SUCH COLUNM NAME  "
break     
done
fi
