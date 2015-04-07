#!/usr/bin/Rscript --vanilla
tmp_directory <- tempdir()
if (file.exists(tmp_directory) == TRUE) {
    write_readme(tmp_directory)
} else {
    stop(paste('temporary directory', tmp_directory, 'does not exist!'))
}
