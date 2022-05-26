#!/bin/bash


select	i in "craete Database" "connect to Database" "list all Databases" "delete Database" "exit"
do
		case  $REPLY in

			1 )
			       	./createdb.sh
					   break
				;;
			2)
				./connectdb.sh
					break
				;;

			3)
		
			 	 ./listdb.sh
				  	break
                	        ;;
			4)

                	./deletedb.sh
						break
                       		 ;;
			 5)  
				 exit
				 ;;
			*)
					echo "wrong choice :(" 
					;;
		 esac
done
