# Install the package 'roxygen2ForSingleFiles'
#
# roxygen2ForSingleFiles is an inofficial ('not on CRAN') R-package locally 
# provided via a server at FVA. Most users will install it on a 
# Microsoft operating system, so they will need to install the dependencies 
# manually.
# 
# Author: Dominik Cullmann <dominik.cullmann@forst.bwl.de>
# Version: Wed Jun  4 11:10:32 CEST 2014

package <- 'roxygen2ForSingleFiles_0.1-3.tar.gz'
path <- 'H:/FVA-Projekte/Methodenforum/programmierleitfaden'
## Install dependencies first.
install.packages('roxygen2', repos = 'http://ftp5.gwdg.de/pub/misc/cran/')
install.packages(paste(path, package, sep = '/'), repos = NULL, type = 'source')
