\name{packageChecker}
\alias{packageChecker}
\title{packageChecker()}
\usage{
packageChecker(packageList)
}
\description{
http://students.eagle-science.org/install-missing-r-packages/

packageChecker() takes a List of packageNames and checks it against the internal library.

If a package is missing, it will download, install and activate it.
If a package is already installed but old, it will be updated and activated.
If a package is already installed, it will be activated.

}
\examples{
requiredPacks <- c("sp", "raster", "ggplot2")
packageChecker(requiredPacks)
}
\author{
Pawel Kluter
}
