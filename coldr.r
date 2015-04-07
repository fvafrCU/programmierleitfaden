#!/usr/bin/Rscript --vanilla
library("coldr")
setwd("listings")
r_files <- list.files(pattern = "*\\.r$", full.names = TRUE)
for (file in r_files) {
    coldr::check_file(file)
}
c_files <- list.files(pattern = "*\\.c$", full.names = TRUE)
for (file in r_files) {
    coldr::check_file_layout(file)
}
