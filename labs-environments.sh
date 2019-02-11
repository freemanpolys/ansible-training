#!/bin/bash
# to generate 15 containers ./labs-environments.sh 15
# to delete 15 containers ./labs-environments.sh 15 del
END=$1
for ((i=1;i<=END;i++)); do
    mgmtssh=$((3000 + $i))
    sshport=$((4000 + $i))
    httport=$((5000 + $i))
    mysqlport=$((6000 + $i))
    mgmt="mgmt-ansible$i"
    remote="ansible$i"

    if [ -z "$2" ]
    then
        docker run -d --name $mgmt -p $mgmtssh:22 rastasheep/ubuntu-sshd 
        docker run -d --name $remote -p $sshport:22 -p $httport:80  -p $mysqlport:3306 rastasheep/ubuntu-sshd 
    else
        docker rm -f $mgmt
        docker rm -f $remote
    fi 

done
