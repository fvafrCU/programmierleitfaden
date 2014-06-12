for file in $(ls *.[rR])
do
  R CMD BATCH --vanilla $file rtest.Rout  || (echo "$file died!"; exit 1)
done
