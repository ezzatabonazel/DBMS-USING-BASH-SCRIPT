#!/bin/bash

# Get the table name from user 
read -p "what is your table name : " tname 

if ! [ -z $tname ]                                                      #first check
then
      if [[ $tname =~ ^[0-9] ]]                                          #second check 
      then

         echo " ERROR: invalid table name"
      		exit;
      elif [ -f metadata/$tname ] & [ -f Data/$tname ]                 #Third check 
      then

	    	  echo "ERROR: the table is already exists"
		  exit;
      else    

            touch Data/$tname                        #create file
            touch metadata/$tname 
            echo "congrats your table is created successfully"
      fi
else
    echo "ERROR: Table name can not be empty"
                exit

fi

# creat column 

read -p " Enter number of columns: " colnum


for ((i=0;  i<colnum ; i++))
do
      colmeta=""
      read -p "enter column name : " colname
      if [ -z $colname ]
      then 
            echo " colname cannot be empty "
	    break;
      elif [[ $colname =~ ^[0-9] ]]
      then 
            echo "Colname is not correct "
	    break;
      else
            colmeta=$colname
      fi
      read -p "choose column data type string(s) number(n) [s:n]    " coldatatype
      case $coldatatype in 
			      "s" | "S") 
                 			 colmeta=$colmeta:string 
                 				 ;;
     			      "n" | "N") 
                 			 colmeta=$colmeta:number
                 				 ;;
      esac
      read -p " is that column primary key (PK) ? [y/n]  " pk
      case $pk in 
     			 "y" | "Y")
                 			 colmeta=$colmeta:yes
                 				 ;;
     			 "n" | "N")
			       		 colmeta=$colmeta:no
                 				 ;;
      esac
echo $colmeta >> metadata/$tname s
done


