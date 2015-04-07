#!/usr/bin/Rscript --vanilla
# Sweave: run Rnw files.
#
# This is just a little helper script. RStudio has a 'Sweave'-Button, I use
# scripts. Oh, and this Button Stangle()s the Rnw.
#
# Author: Dominik Cullmann
# Version: $Id$
args <- commandArgs(trailingOnly = TRUE)
NAME <- sub(".Rnw", '', args[1], fixed = TRUE)
if (is.na(NAME)) stop('please specify an Rnw file for input.')
r_file  <- paste0(NAME, ".Rnw")
tex_file <- paste0(basename(NAME), ".tex")
Stangle(r_file, encoding = "utf8") # extract R code to NAME.r
Sweave(r_file, encoding = "utf8") # run R code, extract tex code to NAME.Tex
tools::texi2dvi(tex_file, pdf = TRUE) # produce document
