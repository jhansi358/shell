#!/bin/bash

ID=$(id -u)
if [ "$ID" -ne 0 ]
then 
	echo " ERROR:RUN WITH ROOT USER "
        exit 1
else  
	echo " you are root user"
fi
yum install mysql -y 

if [ "$?" -eq 0 ]
then 
	echo " SUCCESSFUL INSTALLATION "
else 
	echo " ERROR.NOT INSTALLED SQL "

fi

	
