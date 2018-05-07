backslashConverter <- function(x){
  x <- readline()
  gsub("\\\\", "/", x)
}
