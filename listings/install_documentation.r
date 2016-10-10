#!/usr/bin/Rscript --vanilla
dependencies <- c("devtools", "httr", "backports", "Rcpp") 
for (dependency in dependencies) if (! require(dependency, character.only = TRUE)) install.packages(dependency)
# machines at FVAFR need to set the proxy correctly.
if (grepl("FVAFR-",  Sys.info()["nodename"])) {
    httr::set_config(httr::use_proxy(url="10.127.255.17", port=8080))
}
# documentation is a package not on CRAN, it is provided via github.
devtools::install_github("fvafrCU/documentation")

