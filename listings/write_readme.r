#!/usr/bin/Rscript --vanilla
#' Write the contents of the variable \code{README} to disk
#'
#' Contents of the variable \code{README} are written to file 
#' README.txt in the directory given via the \code{directory} parameter.
#'
#' README must exist in the environment calling \code{write_readme}.
#'
#' @author Dominik Cullmann <dominik.cullmann@@forst.bwl.de>
#' @section Version: $Id$
#' @param directory Path of the directory to put README.txt into.
#' @return TRUE on success, FALSE otherwise.
#' @note \code{directory} must exist and be writeable. \emph{No checks done.}
write_readme <- function(directory = ".") {
    is_success <- FALSE
    if (exists("README", envir = parent.frame()) == TRUE) {
        cat(get("README", envir = parent.frame()),
            file = file.path(directory, "README.txt"))
        is_success <- TRUE
    } else {
        warning("README does not exist!")
    }
    return(invisible(is_success))
}
