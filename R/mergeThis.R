# mosaicing function needs two tiles - adjustable for other study areas
mergeThis <- function(tile1, tile2){
  for(i in 1:length(tile1)){
    part1 <- raster(paste0(getwd(),"/result_NDVIs/",tile1[i]))
    part2 <- raster(paste0(getwd(),"/result_NDVIs/",tile2[i]))
    merged <- mosaic(part1,part2,fun=mean)
    writeRaster(merged, filename = paste0("result_mosaic/Mosaic_",tile1[i]))
    print(paste0(tile1[i]," (",i,"/",length(tile1),")"," - processed"))
    if(i==length(tile1)){
      print(paste0("(",i,"/",length(tile1),")"," - finished"))
    }
  }
}
