# creating NDVI from Landsat 8 bands
Landsat8_NDVI <- function(main, sub){
  redBand <- raster(paste0(getwd(),"/",main[1],"/",sub[grep("B4", sub)]))
  nirBand <- raster(paste0(getwd(),"/",main[1],"/",sub[grep("B5", sub)]))
  NDVI <- NDVI(redBand, nirBand)
  return(NDVI)
}
