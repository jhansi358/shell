#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log" # $0 GIVES SCRIPTNAME
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE(){

if [ "$?" -eq 0 ]
then
        echo "$GSUCCESSFUL INSTALLATION$N"
else
        echo "$RERROR.INSTALLATION FAILED$N"
fi
}

if [ "$ID" -ne 0 ]
then
        echo " $RERROR:RUN WITH ROOT USER$N "
        exit 1
else
        echo " $Gyou are root user$N"
	
fi

yum install mysql -y  &>>LOGFILE #&>> gives both success and failed logs into logfile

VALIDATE

yum install git -y &>>LOGFILE

VALIDATE


