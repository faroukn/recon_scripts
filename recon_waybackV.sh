#!/bin/bash

LSH="\e[6;44m"
DN="\e[100m"
ER="\e[101m"
CE="\e[0m"
if [ $# -eq 0 ]
then
echo -e "${ER}Error Where Is Domain Bro ???${CE}"
echo "Ex:./recon_waybackV.sh domain.com"
exit
else
echo -e "${LSH}[*]waybackurls Started ...${CE}"
echo $1 | waybackurls > waybackurls.txt
echo -e "${DN}[+]Done.${CE}\n"
echo -e "${LSH}[*]gau Started ...${CE}"
echo $1 | gau > gau.txt
echo -e "${DN}[+]Done.${CE}\n"
cat waybackurls.txt gau.txt | sort | uniq >  archive_urls.txt
echo -e "\e[105m[*]Started gf scan ...\e[0m"
for li in $(gf -list)
do
cat archive_urls.txt | gf $li > "${li}_gf.txt" 
echo -e "\e[90m[+]${li} Scanned.\e[0m"
done
fi
