\name{subsetThis}
\alias{subsetThis}
\title{subsetThis()}
\usage{
subsetThis(list, shapefile)
}
\description{
subsetThis() takes a list of a directory and a shapefile of a study area and subsets all data in the directory to the shapefiles extend.
}
\examples{
# loading extent of study area -> shp-file
studyArea <- readOGR(dsn = "_vector_data", layer = "studyArea")
# addressing all merged images
allMosaics <- list.files("result_mosaic/")

# creating subset from all mosaics
subsetThis(allMosaics, studyArea)
}
\author{
Pawel Kluter
}
