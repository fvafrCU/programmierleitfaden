#!/usr/bin/Rscript --vanilla
setwd("listings")
r_files <- list.files(pattern = "*\\.r$", full.names = TRUE)
for (file in r_files) {
    message("running on ", file)
    cleanr::check_file(file)
}
c_files <- list.files(pattern = "*\\.c$", full.names = TRUE)
for (file in r_files) {
    message("running on ", file)
    cleanr::check_file_layout(file)
}
