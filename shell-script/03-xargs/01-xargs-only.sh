#!/bin/bash
printf "\n################pure file ###############################\n"
cat test.txt
printf "\n\n################get rid of unnecessary spaces###############################\n"
cat test.txt |xargs #this gets rid of unncessary spaces