#!/bin/bash

if [ $# != 0 ]
then
ip=$(host $domain | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' )
asn=$(curl -s http://ip-api.com/json/$ip | awk -F "AS" '{ print $2 }' | cut -d " " -f 1)

echo "DOMAIN: $domain"
echo "IP:$ip"
echo "ASN:AS$asn"

echo "[*]Gathering All RngeIP ..."
echo $asn | xargs -I{} whois -h whois.radb.net -- '-i origin AS{}' | grep -Eo "([0-9.]+){4}/[0-9]+" | uniq > range_ips.txt

echo "[+]Done .."
else
echo "./recon_asncidr.sh domain.com"
exit
fi
