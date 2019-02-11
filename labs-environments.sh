#!/bin/bash
END=$1
for ((i=1;i<=END;i++)); do
    mgmtssh="300$i"
    sshport="400$i"
    httport="500$i"
    mysqlport="600$i"
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
