# cropping the extent of the study area
subsetThis <- function(list, shp){
  for(i in 1:length(list)){
    subTemp <- raster((paste0(getwd(),"/result_mosaic/",list[i])))
    subset <- crop(subTemp, shp)
    if(sum(grep("LC08", list[i]))>0){
      killName <- gsub(pattern = "Mosaic_NDVI_LC08_L1TP_177044_", replace = "", x=list[i])
    }else if(sum(grep("LT05", list[i]))>0){
      killName <- gsub(pattern = "Mosaic_NDVI_LT05_L1TP_177044_", replace = "", x=list[i])
    }
    writeRaster(subset, filename = paste0("result_subset/subset_ndvi_",killName))
    print(paste0(list[i]," (",i,"/",length(list),")"," - processed"))
    if(i==length(list)){
      print(paste0("(",i,"/",length(list),")"," - finished"))
    }
  }
}
