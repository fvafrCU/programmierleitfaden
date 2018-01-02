#!/usr/bin/Rscript --vanilla
## query ratio of lowerCamelCase to UpperCamelCase package names on CRAN.
options(repos = structure(c(CRAN = "http://ftp5.gwdg.de/pub/misc/cran/")))
package_names <- row.names(available.packages())
lower_camel_case <- grep("^[a-z]*[a-z,0-9,.]*[A-Z][a-z,0-9,.]*", package_names)
upper_camel_case <- grep("^[A-Z][a-z,0-9,.]*[A-Z][a-z,0-9,.]*", package_names)
print(length(lower_camel_case) / length(upper_camel_case))
