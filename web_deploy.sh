#!/bin/bash

# Declaring variables
USER="devops"

for host in `cat remhosts`
do 
	echo "#########################################"
	echo "Connecting to $host"
	echo "#########################################"
	echo "Executing script on $host"
	scp multi0s_websetup.sh $USER@$host:/tmp/
	ssh $USER@$host sudo  /tmp/multi0s_websetup.sh
	ssh $USER@$host sudo rm -rf  /tmp/multi0s_websetup.sh
	echo "#########################################"
	echo "Finished execution of script on  $host"
	echo "#########################################"
done
