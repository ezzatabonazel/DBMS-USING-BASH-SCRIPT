#!/bin/bash


select	i in "craete Database" "connect to Database" "list all Databases" "delete Database" "exit"
do
		case  $REPLY in

			1 )
			       	createdb.sh
				;;
			2)
				connectdb.sh
				;;

			3)
		
			 	 listdb.sh
                	        ;;
			4)

                        	 deletedb.sh
                       		 ;;
			 5)  
				 exit
				 ;;
		 esac
done
