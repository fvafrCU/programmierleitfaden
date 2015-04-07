#!/bin/sh
cd listings
for file in $(ls *.c)
do
    gcc $file || exit 1
done
