\name{set.wd}
\alias{set.wd}
\title{set.wd()}
\usage{
# execute blank:
set.wd()
# then paste windows directory.
}
\description{
Alternate way to paste a windows directory directly, without converting every \ manually.

set.wd() calls setwd() and backslashConverter().
}

\examples{
> set.wd()
d:\
[1] "D:/"
}
\author{
Pawel Kluter
}
