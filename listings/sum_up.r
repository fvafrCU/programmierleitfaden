#!/usr/bin/Rscript --vanilla
# I haven't yet had time to read the documentation, so I don't have 
# a clue if there's a  standard library to do it. TODO: RTFM
sum_up <- function(x) {
    # sum up the vector's elements
    total <- 0
    i <- 1 # vector indices in R start at 1, not at 0!
    while (i <= length(x)) {
        total <- total + x[i]
        i <- i + 1
    }
    return(total)
}
