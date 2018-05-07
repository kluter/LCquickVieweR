\name{Landsat8_NDVI}
\alias{Landsat8_NDVI}
\title{Landsat8_NDVI()}
\usage{
Landsat8_NDVI(x, y)
}
\description{
Subfunction of getNDVI().
Landsat8_NDVI() takes two lists of directories and checks every subdirectory for Landsat 8 Bands B4 and B5.

Once found, computes the NDVI.
}
\examples{
x <- list.files("dirMain")
y <- list.files("dirSub")

LS8_NDVI <- Landsat8_NDVI(x, y)
}
\author{
Pawel Kluter
}
