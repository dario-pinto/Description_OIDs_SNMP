#!/bin/bash

#Autor: Dario Pinto

#Uso: \t./script IP SNMP-Community
#Ej: \t./script 192.168.0.10 public

function description_OID() {

echo "################################################"
snmptranslate -On -Td $line
#snmptranslate -Td $line | sed -n '/"/,/"/p' | grep -v DISPLAY-HINT
echo -e "\n"

}

snmpwalk -On -v2c -c $2 $1 2>/dev/null | rev | awk 'NF{print $NF}' | rev | while read line; do

#description_OID
description_OID >> Description-OIDs-$1\.txt

done