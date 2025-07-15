#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP="$(date +%F-%H-%M-%S)"
LOGFILE=/tmp/$0-$TIMESTAMP.log
VALIDATE(){
	if [ $? -ne 0 ]
	then
		echo -e "$R $2 ..FAILED $N"
	else 
		echo -e "$G $2 ..success $N" &>>$LOGFILE
        fi

}


if [ $ID -ne 0 ]       #checking for root user block
then 
	echo -e "$R RUN AS ROOT $N"
	exit 1
else
	echo -e "$G ROOT USER $N"

fi
  
echo " packages:$@" &>>$LOGFILE



for package in $@            #installing package block
do
	yum list installed $package &>>$LOGFILE
	if [ $? -ne 0 ]
        then 
            yum install $package -y  &>>$LOGFILE
	    VALIDATE $? "INSTALLATION OF $package"
        else
            echo -e "$Y $package is already installed $N"

        fi

done




