#!/bin/bash


#Input format checker
if [ ! $# == 2 ]; 
then
echo "Usage Format: ./run_script [key.pub] [ip_address.txt]"
exit
elif [[ $1 == *.pub && $2 == ip_address.txt ]]
then
key=$(cat $1)
ip_address=$2
else
echo "Wrong input file. Please enter correct format"
echo "Usage: ./run_script [key.pub] [ip_address.txt]"
exit
fi

#Pick the IPs given in ip_address.txt and ssh

cat $ip_address | while read user ip;
do 
echo "SSHing $ip"

#Commands to run on the server
ssh -n -l ${user} ${ip} bash -c "'
hostname
hostname -I | cut -f 1 -d \" \"
stat --format=mtime:%y\|ctime:%z\|atime:%x .ssh/authorized_keys
echo $key >> .ssh/authorized_keys
cat .ssh/authorized_keys | tail -1
'" >out.txt 

if [ $? -eq 0 ]; then
echo "Successful $ip"
paste -d ',' - - - - < out.txt >>out.csv 
#convert the output text file to csv file (the required format)
else
echo "Failure $ip"
fi
done
