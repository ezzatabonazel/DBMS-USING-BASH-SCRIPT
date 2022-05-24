#select a record
read -p "table name : " tablename 
#get primary key column name
awk -F: '{if($3=="yes"){print "the table primary key coulmn name is ", $1;}}' /$HOME/db/Databases/$ctdb/metadata/$tablename

#get Record Number in metadata table 
fn=`awk -F: '{if($3=="yes"){print NR ;}}' /$HOME/db/Databases/$ctdb/metadata/$tablename`

#get the data from user of pk
read -p "whatis your primary key data : " pk

#check data of pk is aleredy exist in data table and print it 
for i in `cut -f"$fn" -d: $HOME/db/Databases/$ctdb/Data/$tablename`
do 
    if [[ $i -eq $pk ]]
    then 
            awk -F: 'BEGIN {ORS=":"}{print $1}' $HOME/db/Databases/$ctdb/metadata/$tablename
            printf "\n"
            awk -F: '{print $0}' $HOME/db/Databases/$ctdb/Data/$tablename | grep -w $pk    
            break
    elif ! [[ $i -eq $pk ]]        
    then
                continue                
    fi
echo "thank you"        

done
