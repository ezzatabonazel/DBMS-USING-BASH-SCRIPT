#function to insert a row in table data file

function insertrow{
read -p "enter table name : " n
echo "this is column names "

awk -F: 'BEGIN{ORS="\t"}{print $1}END{printf "\n"}' /$HOME/db/Databases/ezzat/metadata/$n
echo "insert your data by order of column names " 
for i in `awk -F: 'BEGIN{ORS="\t"}{print $1}' /$HOME/db/Databases/ezzat/metadata/$n` 
do 
        read -p "enter data of colunm $i : " rowdata
        tabledata=$tabledata:$rowdata
done
echo $tabledata >> $HOME/db/Databases/ezzat/Data/$n
}
# insert table

typeset -i ColNum
ColNum=1
exist=0
valid=0
echo please Enter your table name 
read tname

if [[  ! -f ~/db/Databases/$1/$tname  ]]
then
	echo  "there is no table has name $tname "
else 
colNameArr=$(sed -n '1p' ~/db/Databases/$1/$tname  | awk '-F|' '{for(i=1;i<NF;i++)  print $i }')
for colNam in ${colNameArr[@]}
do 
	DataType=$(sed -n '1p' ~/db/Databases/$1/$tname +"p" | cut -d '|' -f $ColNum)
	valid=0;
	while [[ $valid -eq 0 ]]
	do
   if [[ "$colNam" == "*"* ]]
   then
  

    primaryCol=$(cut -d '|' -f $ColNum ~/db/Databases/$1/$tname  | awk  '{if(NR>1) print $0}' ) 
	  echo Enter the value for $colNam as primary key | sed 's/*//'                   
           read colData
       if [[ -z $colData ]]
           then
            echo "the primary can't be null"
            
    else
	    for primVal in ${primaryCol[@]}
           do
           if [[ "$colData" == "$primVal" ]]
          then		   
            exist=1;
           fi
           done
       if [[ $exist -eq 0 ]]
          then 
     if [[ "$DataType" == "int" ]]
        then
         if [[ $colData =~ ^[+-]?[0-9]+$ ]]
        then valid=1;
       else echo  "the dataType of this column is int so try again"
       
         fi
 else valid=1;
        fi

   else echo -e "this value is added before"
         exist=0 	   
          fi

       fi	    
   else
    echo Enter the value of column $colNam
     read colData
     if [[ -z $colData ]]
      then colData="Null"
	 valid=1    
	else
	
	if [[ "$DataType" == "int" ]]
	then	
	       if [[ $colData =~ [0-9]+$ ]]
	       then 
                   valid=1;
                     else echo  "the dataType of this column is int so try again"
       
         fi
 else valid=1;
	fi	
    fi     
   fi
done   
printf "$colData|" >> ~/db/Databases/$1/$tname 
ColNum=$((ColNum + 1))
 
done
echo >> ~/db/Databases/$1/$tname 

fi