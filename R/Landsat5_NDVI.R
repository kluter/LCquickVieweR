# creating NDVI from Landsat 5 bands
Landsat5_NDVI <- function(main, sub){
  redBand <- raster(paste0(getwd(),"/",main[1],"/",sub[grep("B3", sub)]))
  nirBand <- raster(paste0(getwd(),"/",main[1],"/",sub[grep("B4", sub)]))
  NDVI <- NDVI(redBand, nirBand)
  return(NDVI)
}
