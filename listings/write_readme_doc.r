#!/usr/bin/Rscript --vanilla
# Write the contents of the global variable README to disk
#
# Contents of README are written to file README.txt in the 
# directory given via the directory parameter.
#
# README must exist in the environment calling \code{write_readme}.
#
# Author: Dominik Cullmann <dominik.cullmann@forst.bwl.de>
# Version: Thu Jan  7 15:48:46 CET 2016
# Parameter: directory Path of the directory to put README.txt into.
# Return: TRUE on success, FALSE otherwise.
# Note: directory must exist and be writeable. No checks done.
