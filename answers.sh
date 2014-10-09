#!/bin/bash

if [ "$1" = "1" ]; then

  # ----------- Question 1 ------------
  # Generate random addresses with the following arguments: -s 0 -n 10, -s 1 -n 10, and -s 2 -n 10.
  # Change the policy from
  # FIFO, to LRU, to OPT. Compute whether each access in said address
  # traces are hits or misses.

  genWithPolicy () {
    echo "====== For Policy: $1 ====="
    ./paging-policy.py -s 0 -n 10 --policy $1 -c
    echo
    ./paging-policy.py -s 1 -n 10 --policy $1 -c
    echo
    ./paging-policy.py -s 2 -n 10 --policy $1 -c
    echo
  }

  genWithPolicy "FIFO"
  genWithPolicy "LRU"
  genWithPolicy "OPT"

elif [ "$1" = "2" ]; then
  # ------- Question 2 -----------------
  # For a cache of size 5, generate worst-case address reference streams
  # for each of the following policies: FIFO, LRU, and MRU (worst-case
  # reference streams cause the most misses possible. For the worst case
  # reference streams, how much bigger of a cache is needed to improve
  # performance dramatically and approach OPT?

  ./paging-policy.py --policy OPT --cachesize=5 -a 1,2,3,4,5,6,7,8,9,10 -c

else
  echo "Please pass in a valid question number."
fi
