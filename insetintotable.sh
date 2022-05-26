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

