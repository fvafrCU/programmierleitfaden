#!/usr/bin/Rscript --vanilla
library("documentation")
create_roxygen_documentation("write_readme.R")
create_roxygen_documentation("header_roxygen.R")
unlink("my_r_file.R")
create_template(file_name = "my_r_file.R", type = "template")
