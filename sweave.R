#!/usr/bin/Rscript --vanilla
##
## File: sweave.R.
##
## Description: run Sweave example.
##
## Author: Dominik Cullmann
## Version: $Id: ff86e38b1e519b1420ce36c5545e306381e13370 $

NAME <- 'template'

Sweave(paste(NAME, "Rnw", sep = ".")) # run R code, extract tex code to NAME.Tex
# Stangle(paste(NAME, "Rnw", sep = ".")) # extract R code to NAME.r
tools::texi2dvi(paste(NAME, "tex", sep ="."), pdf = TRUE) # produce document
