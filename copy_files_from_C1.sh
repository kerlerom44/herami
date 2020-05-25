#!/bin/bash

read -p "Enter internal IP address of C1 container : " ip

ping $ip -c 3

if [ $? = 0 ]
        then
                echo "C1 is reachable !"
                scp -p root@"$ip":/herami/task_01-software_engineer/phantoms-2d/*.dcm /Hera-Mi_STORE_C2

        else
                echo "C1 is not reachable and files cannot be retrieved from C1 !"
fi

echo "--------------------------------------"
echo "Content of /Hera-Mi_STORE_C2 directory : "

ls -ltr /Hera-Mi_STORE_C2
