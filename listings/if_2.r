#!/usr/bin/Rscript --vanilla
README <- "This is a dummy to make the code pass testing."
source("write_readme.r")
tmp_directory <- tempdir()
if (file.exists(tmp_directory) == TRUE) {
    write_readme(tmp_directory)
} else {
    stop(paste("temporary directory", tmp_directory, "does not exist!"))
}
