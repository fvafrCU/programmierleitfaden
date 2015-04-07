#!/bin/sh
cd listings
for file in $(ls *.r)
do
    ./$file || exit 1
done
