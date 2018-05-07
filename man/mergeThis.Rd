\name{mergeThis}
\alias{mergeThis}
\title{mergeThis()}
\usage{
mergeThis(x, y)
}
\description{
mergeThis() takes two lists of directories (image tiles) and merges them by calling the RStoolbox::mosaic() function.

For more tiles, code must be adjusted accordingly.
}
\examples{
# setting tiles manually
imageTile1 <- list.files("result_NDVIs/", pattern = "177044")
imageTile2 <- list.files("result_NDVIs/", pattern = "177045")

# combining tiles for full study area
mergeThis(imageTile1, imageTile2)
}
\author{
Pawel Kluter
}
