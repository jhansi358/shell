#!/bin/bash

ID=$(id -u)
VALIDATE(){

if [ "$?" -eq 0 ]
then
        echo " SUCCESSFUL INSTALLATION "
else
        echo " ERROR.INSTALLATION FAILED"
fi
}

if [ "$ID" -ne 0 ]
then
        echo " ERROR:RUN WITH ROOT USER "
        exit 1
else
        echo " you are root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE


