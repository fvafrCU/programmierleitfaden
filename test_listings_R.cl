#!/bin/sh
cd listings
for file in $(ls *.r)
do
    ./$file || (echo "$file died!"; exit 1)
done
