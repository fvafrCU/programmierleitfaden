#!/usr/bin/Rscript --vanilla
library("documentation")
library("methods")
create_roxygen_documentation("write_readme.r")
create_roxygen_documentation("header_roxygen.r")
unlink("my_r_file.r")
create_template(file_name = "my_r_file.r", type = "template")
