packageChecker <- function(requiredPacks){
  check <- requiredPacks %in% installed.packages()[,"Package"]
  for(i in 1:length(check)){
    if(check[i] == FALSE){
      install.packages(requiredPacks[i])
    }
    sapply(requiredPacks, require, character.only = TRUE)
  }
}

# requiredPacks <- c("pwltools", "RStoolbox", "sp", "raster", "ggplot2")
# packageChecker(requiredPacks)


# https://gist.github.com/stevenworthington/3178163
