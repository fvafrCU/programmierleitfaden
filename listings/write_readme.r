#!/usr/bin/Rscript --vanilla
#' Write the contents of the global variable \code{README} to disk
#'
#' Contents of the global variable \code{README} are written to file README.txt 
#' in the directory given via the \code{directory} parameter.
#'
#' @author Dominik Cullmann <dominik.cullmann@@forst.bwl.de>
#' @section Version: $Id$
#' @param directory Path of the directory to put README.txt into.
#' @return TRUE on success, FALSE otherwise.
#' @note \code{directory} must exist and be writeable. \emph{No checks done.}
write_readme <- function(directory) {
    is_success <- FALSE
    if (exists('README') == TRUE) {
        cat(README, file = file.path(directory, 'README.txt'))
        is_success <- TRUE
    } else {
        warning('README does not exist!')
    }
    return(invisible(is_success))
}

