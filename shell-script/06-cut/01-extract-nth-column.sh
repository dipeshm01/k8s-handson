#!/bin/bash
cat test.txt
printf "\n\nExtracting second column\n\n--------------------------------\n"
cat test.txt |cut -c2 #second colum