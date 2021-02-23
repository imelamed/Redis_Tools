#!/bin/bash
#
# Showes all Redis clients conection and how many sessions are open


NOW=$(date +%Y%m%d%H%M%S)

redis-cli client list > clients_$NOW
#wc -l clients_$NOW
cat clients_$NOW | cut -d= -f5 | awk '{ print $1}' | sort | uniq > clients_sum_tmp
echo "The Clients list for - " $(date) > clients_report

while read CLIENTNAME; do

COUNT=$(grep -c $CLIENTNAME clients_$NOW)
echo $CLIENTNAME - $COUNT >> clients_report

done < clients_sum_tmp

cat clients_report
