#!/bin/bash
# Export all redis keys and check TTL on each key

redis-cli keys '*' > tmp-redis-keys

NOW=$(date +%Y%m%d%H%M%S)

while read KEY; do
        TTL=$(redis-cli ttl $KEY)
        echo $KEY,$TTL >> redis-keys-ttl_$NOW
done <tmp-redis-keys

while IFS=, read -r KEY TTL; do
    if [ "$TTL" -lt 0 ]
        then
        echo $KEY , $TTL >> redis-exp-keys_$NOW
    fi
done < redis-keys-ttl_$NOW

rm -f tmp-redis-keys
