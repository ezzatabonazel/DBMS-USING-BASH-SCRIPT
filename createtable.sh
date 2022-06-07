#!/bin/bash

LC_ALL=C
shopt -s extglob

# Get the table name from user 
while true :
do
read -p "what is your table name : " tname 

      if ! [[ -z $tname ]]                                                      #first check
      then

            if [ -f Databases/$ctdb/metadata/$tname ] & [ -f Databases/$ctdb/Data/$tname ]                 #Third check 
            then

	    	        echo "ERROR: the table is already exists"
		            continue
            else    
                  case $tname in
	            +([a-zA-Z_-]) )

                  touch Databases/$ctdb/Data/$tname                        #create file
                  touch Databases/$ctdb/metadata/$tname
                        ;;
                  *)
                        echo "invalid table name, must contain only characters :)"
                         continue
                                    ;;   
                  esac
      fi



else
    echo "ERROR: Table name can not be empty"
                continue

fi

# creat column 

while true :
do
read -p " Enter number of columns: " colnum
case $colnum in
            +([0-9]) )
                        break 
                        ;;

            *) continue
            ;;
esac
done

for ((i=0;  i<colnum ; i++))
do
            ((j=$i+1))
            colmeta=""
            while true :
            do
                 read -p "enter column '$j' name : " colname
                  if [[ -z $colname ]]
                  then 
                        echo " colname cannot be empty "
	                  
                  else 
                        case $colname in
	                        +([a-zA-Z]) )
                               colmeta=$colname 
                               break 
                               ;; 
                               *)
                              echo "Colname is not correct , must contain only characters"
                                    
                                    ;;
                        esac
                  fi
            done      
      while true :
      do
            read -p "choose column data type string(s) number(n) [s:n]    " coldatatype
            case $coldatatype in 
			      "s" | "S") 
                 			 colmeta=$colmeta:string 
                                    break;
                 				 ;;
     			      "n" | "N") 
                 			 colmeta=$colmeta:number
                                    break
                 				 ;;
                        *)
                              echo "wrong choice :("
                              
                              ;;
            esac
      done
      while true :
      do
            read -p " is that column primary key (PK) ? [y/n]  " pk
            case $pk in 
     			 "y" | "Y")
                 			 colmeta=$colmeta:yes
                                    break
                 				 ;;
     			 "n" | "N")
			       		 colmeta=$colmeta:no
                                      break
                                      ;;
                 	      * )
                             echo "wrong choice :("
                              
                              ;;			 
            esac
      done
echo $colmeta >> Databases/$ctdb/metadata/$tname 
done
echo "congrats your table is created successfully"
break 
done

