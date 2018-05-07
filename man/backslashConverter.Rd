\name{backslashConverter}
\alias{backslashConverter}
\title{backslashConverter()}
\usage{
# execute blank:
backslashConverter()
# then input string.
}
\description{
Since backslash is a special operator to suppress metacharacters or escape sequences, it can’t be escaped without a second backslash.
This function formats every backslash into a forwardslash.

Usefull for pasting win-directories.

How it works:

    (+) the function backslashConverter calls another function – readline() and saves your copied directory into the variable x.

    (+) readline() converts every single \ (from your directory) into a double \\. This way R won’t throw an error anymore.

    (+) gsub() matches every double \\ in the string x and replaces it with /.
    }
\examples{
> backslashConverter()
d:\
[1] "d:/"
}

\author{
Pawel Kluter
}
