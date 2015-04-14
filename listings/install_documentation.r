#!/usr/bin/Rscript --vanilla
installed_packages <- rownames(installed.packages()) 
# machines at FVAFR need to set the proxy correctly.
if (grepl("FVAFR-",  Sys.info()["nodename"])) {
    if (! "httr" %in% installed_packages)  install.packages("httr") 
    httr::set_config(httr::use_proxy(url="10.127.255.17", port=8080))
}
# documentation is a package not on CRAN, it is provided via github.
if (! "devtools" %in% installed_packages) install.packages("devtools")
devtools::install_github("fvafrCU/documentation")

