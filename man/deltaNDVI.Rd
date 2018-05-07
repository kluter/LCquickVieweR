\name{deltaNDVI}
\alias{deltaNDVI}
\title{deltaNDVI()}
\usage{
deltaNDVI(x, y)
}
\description{
deltaNDVI() is a subfunction of getDeltaNDVI().

Raster calculation:
deltaNDVI subtracts NDVI datasets from each other. The prior dataset is subtracted from the later.
}
\examples{
x <- laterDateset
y <- priorDataset

delta <- deltaNDVI(x, y)
}
\author{
Pawel Kluter
}
