#!/bin/bash
printf "\nEnter your choice(1/2):"
read choice
if [ "$choice" ==  2  ];then
    printf "\nyou entered 2"
elif [ "$choice" == 1 ];then
    printf "\nyou entered 1"
else
    echo "Invalid choice!!"
fi
