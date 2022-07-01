#!/bin/bash
printf "\nEnter your choice(1/2):"
read choice
case "${choice}" in
1)
    printf "\n choice 1\n"
    ;;
2)
    printf "\nchoice 2\n"
    ;;
*)
    printf "\nInvalid Source Branch!!\n"
    ;;
esac
