#!/bin/bash
v1=hari
v2=siri
echo "$v1 : hi $v2"
echo "$v2 : hi how are you $v1"
#we can take values of variables while running via args
v1=$1
v2=$2
echo "$v1 : hi $v2"
echo "$v2 : hi how are you $v1"
#run this using sh scriptname hari siri 
