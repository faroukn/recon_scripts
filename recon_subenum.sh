#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
EC="\e[0m"
CC="\e[35m"

echo -e "${CC}===================================${EC}"
echo -e "$RED     SUBDOMAINS&IP-${BLUE}-IN-YOURHAND     $EC"
echo -e "${CC}===================================${EC}"
echo -e "###### By Faroukn ######"
if [ $# != 0 ]
then
echo -e "\n${BLUE}[*]Start assetfinder${EC}"
echo "$1" | assetfinder -subs-only | sort | uniq > subs.txt
echo -e "${GREEN}[+]assetfinder Completed.${EC}"
#echo -e "${BLUE}[*]Start Sublist3r ${EC}"
#sublist3r -d $1  -b -t 50 -v -o subs2.txt
#echo -e "${GREEN}[+]Sublist3r Completed.${EC}"
echo -e "${BLUE}[*]Start amass Passive.${EC}"
timeout 120 amass enum -passive -d $1 > subs2.txt
echo -e "${GREEN}[+]amass Pssive Completed.${EC}"
echo -e "${BLUE}[*]Start amass Active.${EC}"
amass enum -active -d $1 > subs3.txt
echo -e "${GREEN}[+]amass Active Completed.${EC}"
cat subs3.txt subs2.txt subs.txt | sort | uniq > all_subs.txt
echo -e "${BLUE}[*]find live sites${EC}"
echo "" > live_subs.txt 
for i in $(cat all_subs.txt)
do
if [[ $(timeout 0.2 ping -c 1 $i 2> /dev/null ) ]]
then
echo "$i" >> live_subs.txt
echo -e "${CC}$i ${EC}"
fi
done
echo -e "${BLUE}[*]Find ALLIPs${EC}"
echo "" > ips.txt
for li in $(cat live_subs.txt)
do
host -t A $li | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'|tee -a ips.txt
done
else
echo -e "\n${RED}Error Script Must Be => ./recon_subenum.sh domainName\n${GREEN}Ex:./recon_subenum.sh google.com${EC}"
fi
