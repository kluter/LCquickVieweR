\name{getNDVI}
\alias{getNDVI}
\title{getNDVI()}
\usage{
getNDVI(list)
}
\description{
getNDVI() takes a list of a data directory containing Landsat 5 and/or 8 scenes.

Processes NDVI's for all scenes in directory, choosing the right bands (depending on the Landsat mission) for the NDVI computation.
}
\examples{
list <- list.files("data/landsatImages")
getNDVI(list)
}
\author{
Pawel Kluter
}
