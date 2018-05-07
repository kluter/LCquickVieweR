# compute NDVI
NDVI <- function(red, nir){
  (nir-red)/(nir+red)
}
