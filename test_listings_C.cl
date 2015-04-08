#!/bin/sh
cd listings
for file in $(ls *.c)
do
    gcc $file || (echo "$file died!"; exit 1)
done
