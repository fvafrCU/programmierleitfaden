#!/usr/bin/Rscript --vanilla
README <- "This is a dummy to make the code pass testing."
tmp_directory <- tempdir()
if (file.exists(tmp_directory) == TRUE) {
    if (exists("README") == TRUE) {
        cat(README, file = file.path(tmp_directory, "README.txt"))
    } else {
        stop("README does not exist!")
    }
} else {
    stop(paste("temporary directory", tmp_directory, "does not exist!"))
}
