#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log" # $0 GIVES SCRIPTNAME
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE(){

if [ "$1" -eq 0 ]
then
        echo -e "$G $2 SUCCESS $N"
else
        echo -e "$R $2 FAILED $N"
fi
}

if [ "$ID" -ne 0 ]
then
        echo -e "$R ERROR:RUN WITH ROOT USER $N"
        exit 1
else
        echo -e "$G you are root user $N"
	
fi

yum install mysql -y  &>>$LOGFILE #&>> gives both success and failed logs into logfile

VALIDATE $1 "installing mysql"

yum install git -y &>>$LOGFILE

VALIDATE $1 "installing git "


