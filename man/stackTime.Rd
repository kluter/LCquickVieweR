\name{stackTime}
\alias{stackTime}
\title{stackTime()}
\usage{
stackTime(list1, list2)
}
\description{
stacktime() takes two directory lists and creates the final product after all preprocessing functions. A false color image is build by assigning RGB channels this way:

R: Prior Image; G: Later Image; B: Image subtraction of G-R

Landuse / Landcover change is now coded by color:

reddish colors - lost areas.

cyan colors - gained areas.

yellowish and purple colors - persistend areas.


Known errors, not solved yet:

stackTime() throws an error message as soon as it is done processing. This is due to the loop. Once it finishes the processing of the last pair, the last command tries to extend the maximum length of the directory. The processed files are not affected and the datasets are all correct.
}
\examples{
# collecting preprocessed datasets for final product
delta <- list.files("result_deltaNDVIs/")
ndvi <- list.files("result_subset/")

# creating main LULC product
stackTime(ndvi, delta)
}
\author{
Pawel Kluter
}
