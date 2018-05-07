\name{getDeltaNDVI}
\alias{getDeltaNDVI}
\title{getDeltaNDVI()}
\usage{
getDeltaNDVI(list)
}
\description{
getDeltaNDVI() takes a list of a directory and processes all images inside by creating an image subtraction of successive pairs.
The order of subtraction is the order of the directory.

Known errors, not solved yet:

getDeltaNDVI() throws an error message as soon as it is done processing. This is due to the loop. Once it finishes the processing of the last pair, the last command tries to extend the maximum length of the directory. The processed files are not affected and the datasets are all correct.
}
\examples{
# getting all subsets into a list
allSubsets <- list.files("result_subset/")

# image differencing deltaNDVI()
getDeltaNDVI(allSubsets)
}
\author{
Pawel Kluter
}
