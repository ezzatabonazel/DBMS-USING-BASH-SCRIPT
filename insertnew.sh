
ifpk(){
pk=1 #yespk       
for i in `awk -F: -v colname="$1" '{if($1==colname ){print $3}}' Databases/ezzat/metadata/xx`
do
if [ $i="yes" ]
then   
           
         echo 0
fi         
done
}

name="id"
ifpk name













function insertrow {
read -p "enter table name : "  n
echo "this is column names "
tabledata=""
awk -F: 'BEGIN{ORS="\t"}{print $1}END{printf "\n"}' /$HOME/db/Databases/ezzat/metadata/$n
echo "insert your data by order of column names " 
for i in `awk -F: 'BEGIN{ORS="\t"}{print $1}' /$HOME/db/Databases/ezzat/metadata/$n` 
do 
        read -p "enter data of colunm $i : " rowdata
        tabledata=$tabledata:$rowdata
done
echo "$tabledata"| awk  '{sub(":","");print $0}' >> Databases/ezzat/Data/$n

}


insertrow 

