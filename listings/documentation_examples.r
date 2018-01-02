#!/usr/bin/Rscript --vanilla
document::document("write_readme.r", output_directory = ".",
                   check_as_cran = FALSE)
document::document("header_roxygen.r", output_directory = ".",
                   check_as_cran = FALSE)
