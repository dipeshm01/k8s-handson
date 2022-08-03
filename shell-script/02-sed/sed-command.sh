#!/bin/bash
. ../shared/common.sh
clear
file="quick-brown-fox.md"
set -x

printf "${BLUE}delete only one line${NC}\n"
sed '1d' $file

printf "\n${BLUE}Delete line from 1 to 5 now..${NC}\n"
sed '1,5d' $file #you can also write without quotes this like this: sed 1,5d quick-brown-fox.md

printf "\n${BLUE}Delete last line..${NC}\n"
sed '$d' $file #remember-> $d has to be within quote

printf "\n${BLUE}Delete random lines..${NC}\n"
sed '1d;5d;7d' $file #you can also write without quotes this like this: sed 1,5d quick-brown-fox.md

printf "\n$On_Blue Remember sed -i will delete the actual file $NC\n"

set +x
