#!/usr/bin/Rscript --vanilla
##
## sweave.R.
##
## run Sweave example.
##
## Author: Dominik Cullmann
## Version: $Id$

NAME <- 'template'

Sweave(paste(NAME, "Rnw", sep = ".")) # run R code, extract tex code to NAME.Tex
# Stangle(paste(NAME, "Rnw", sep = ".")) # extract R code to NAME.r
tools::texi2dvi(paste(NAME, "tex", sep ="."), pdf = TRUE) # produce document
