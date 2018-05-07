\name{Landsat5_NDVI}
\alias{Landsat5_NDVI}
\title{Landsat5_NDVI()}
\usage{
Landsat5_NDVI(x, y)
}
\description{
Subfunction of getNDVI().
Landsat5_NDVI() takes two lists of directories and checks every subdirectory for Landsat 8 Bands B3 and B4.

Once found, computes the NDVI.
}
\examples{
x <- list.files("dirMain")
y <- list.files("dirSub")

LS5_NDVI <- Landsat8_NDVI(x, y)
}
\author{
Pawel Kluter
}
