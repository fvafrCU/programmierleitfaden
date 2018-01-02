#!/usr/bin/Rscript --vanilla
r_files <- list.files("listings", pattern = "*\\.r$", full.names = TRUE)
for (file in r_files) {
    print(lintr::lint(file))

}
