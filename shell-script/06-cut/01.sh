#!/bin/bash
. ../shared/common.sh
printf "\n$UYELLOW Original file\n$YELLOW"
cat test.txt
printf "\n${UBLUE}Extracting second column$BLUE\n"
cat test.txt |cut -c2
printf "$YELLOW"
echo "dipesh is great ... yes .... yes" |cut -c2-4
echo "dipesh is great ... yes .... yes" |cut -c2
echo "dipesh is great ... yes .... yes" |cut -c2- && printf "print from second character to last character\n $WHITE"
echo "dipesh is great ... yes .... yes" |rev |cut -c2-  
echo "dipesh is great ... yes .... yes" |rev |cut -c2- |rev && printf "EAT AWAY last character\n$CYAN"
echo "dipesh is great ... yes .... yes" |cut -c-15 #prints till 15th character
echo "dipesh is great ... yes .... yes" |cut -c1-15 #prints till 15th character
printf "$WHITE"
echo "dipesh is great ... yes .... yes" |cut -c15- && printf "print from 15th character\n$CYAN"
printf "\n$UCYAN the original file is this\n$CYAN"
cat /etc/passwd |tail -3
#####
#_darwindaemon:*:284:284:Darwin Daemon:/var/db/darwindaemon:/usr/bin/false
#_notification_proxy:*:285:285:Notification Proxy:/var/empty:/usr/bin/false
#_oahd:*:441:441:OAH Daemon:/var/empty:/usr/bin/false
printf "$UYELLOW\ncat /etc/passwd |tail -3 |cut -d':' -f1\n$YELLOW"
cat /etc/passwd |tail -3 |cut -d':' -f1 
printf "\n${BLUE}-------\n"
cat /etc/passwd |tail -3 |cut -d':' -f1 |cut -d'_' -f2
printf "\n${NC}-------\n"
set +x