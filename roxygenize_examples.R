#!/usr/bin/Rscript --vanilla
library('roxygen2ForSingleFiles')
create_documentation('write_readme.R')
create_documentation('header_roxygen.R')
demo('roxygen2ForSingleFiles')
unlink('my_r_file.R')
create_template('my_r_file.R')
