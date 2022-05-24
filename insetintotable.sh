#function to insert a row in table data file

function insertrow{
read -p "enter table name : " n
echo "this is column names "

awk -F: 'BEGIN{ORS="\t"}{print $1}END{printf "\n"}' /$HOME/db/Databases/ezzat/metadata/$n
echo "insert your data by order of column names " 
for i in `awk -F: 'BEGIN{ORS="\t"}{print $1}' /$HOME/db/Databases/ezzat/metadata/$n` 
do 
        read -p "enter data of colunm $i : " columndata
        tabledata=$tabledata:$columndata
done
echo $tabledata >> $HOME/db/Databases/ezzat/Data/$n
}
function insetcolumn {
	tableName=$1
	columnsNum=`awk -F, '{ if (NR==1) {print NF} }' "databases/$dbName/$tableName" `
	columnNames=`awk -F, '{ if (NR==1) {print $0;} }' "databases/$dbName/$tableName" `
	IFS=','
	read -a colNameArr <<< "$columnNames"
	echo "the columns of this table is : "${colNameArr[@]}
	IFS=''
	row=''
	# #=======================
	typeset -i i;
    i=0
    while [ $i -lt $columnsNum ] 
    do
        echo "enter ${colNameArr[$i]}"
        read 
        row="$row,$REPLY"
		i=$i+1
	done
	row=${row#","}
    echo "the new row is :" $row
	echo $row>>databases/$dbName/${tableName}
	echo "Data inserted successfully";
}
