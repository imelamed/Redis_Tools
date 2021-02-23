#!/bin/bash
# create Keys For redis with TTL

NOW=$(date +%d%m%y_%H%M%S)

for i in {1..1000}
  do
     redis-cli set IM:TST:$NOW:$i Test$i >/dev/null
     redis-cli expire IM:TST:$NOW:$i $i >/dev/null
 done
