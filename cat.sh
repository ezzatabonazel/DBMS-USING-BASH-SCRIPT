#cat /$HOME/db/Databases/ezzat/Data/xx | grep "12345"
#cut -f3 -d: /$HOME/db/Databases/ezzat/metadata/xx

pktname=`awk -F: '{if($3=="yes"){print $1}}' /$HOME/db/Databases/ezzat/metadata/xx`

#echo "pk column name is $pktname"
#fn=`awk -F: '{if($3=="yes"){print NR ;}}' /$HOME/db/Databases/ezzat/metadata/xx`

#echo $fn
#cut -f"$fn" -d: /$HOME/db/Databases/ezzat/Data/xx
#for i in `cut -f"$fn" -d: /$HOME/db/Databases/ezzat/Data/xx`
#do 
 #   if i==$pk 
  #  then 
            #cat /$HOME/db/Databases/ezzat/Data/xx | grep $pk
   # else
     #       echo "this data doesn't exist"
    #fi
#done
read  -p "enter  " pk
#cat $HOME/db/Databases/ezzat/Data/xx | grep -w $pk

awk -F: '{if($3=="yes"){print $0 ;}}' /$HOME/db/Databases/ezzat/metadata/xx
