#!/bin/bash
END=$1
for ((i=1;i<=END;i++)); do
    sshort="400$i"
    httport="500$i"
    name="ansible$i"

    if [ -z "$2" ]
    then
        docker run -d --name $name -p $sshort:22 -p $httport:80 rastasheep/ubuntu-sshd 
    else
        docker rm -f $name
    fi 

done
