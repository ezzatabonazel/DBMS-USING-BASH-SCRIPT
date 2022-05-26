#cat /$HOME/db/Databases/ezzat/Data/xx | grep "12345"
#cut -f3 -d: /$HOME/db/Databases/ezzat/metadata/xx

#pktname=`awk -F: '{if($3=="yes"){print $1}}' /$HOME/db/Databases/ezzat/metadata/xx`

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
#cat $HOME/db/Databases/ezzat/Data/xx | grep -w $pk
RN=2
#awk -F: '{if($3==$pk){print $0 ;}}' /$HOME/db/Databases/ezzat/metadata/xx

#awk -F: -v awkvar="$fn" '{if(NR=awkvar){print $2;}}' $HOME/db/Databases/ezzat/metadata/ezzat
#awk -F: -v awkvar="$fn" ' NR== awkvar {print $2;}' $HOME/db/Databases/ezzat/metadata/ezzat


#  ./Databases/ezzat/Data/x
cut  -d: -f"$RN" --complement ./Databases/ezzat/Data/xx
