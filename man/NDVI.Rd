\name{NDVI}
\alias{NDVI}
\title{NDVI()}
\usage{
NDVI(x, y)
}
\description{
https://en.wikipedia.org/wiki/Normalized_difference_vegetation_index

Subfunction of getNDVI() and Landsat5_NDVI/Landsat8_NDVI.

Function computes the NDVI.
Needs a Red and a NIR band as input.
}
\examples{
x <- redBand
y <- nirBand

ndvi <- NDVI(x, y)
}
\author{
Pawel Kluter
}
