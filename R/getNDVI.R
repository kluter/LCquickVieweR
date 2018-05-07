# creating NDVI-datasets from download folder
getNDVI <- function(mainFolder){
  for(i in 1:length(mainFolder)){
    subFolder <- list.files((paste0(getwd(),"/",mainFolder[i])), pattern = "TIF")

    # checking for the right landsat mission and their bands
    if(sum(grep("LC08", subFolder))>0){
      NDVI <- Landsat8_NDVI(mainFolder[i], subFolder)
      writeRaster(NDVI, filename = paste0("result_NDVIs/NDVI_",mainFolder[i],".tif"))

      # user confirmation that code is working
      print(paste0(mainFolder[i]," (",i,"/",length(mainFolder),")"," - processed"))
    }else if(sum(grep("LT05", subFolder))>0){
      NDVI <- Landsat5_NDVI(mainFolder[i], subFolder)
      writeRaster(NDVI, filename = paste0("result_NDVIs/NDVI_",mainFolder[i],".tif"))
      print(paste0(mainFolder[i]," (",i,"/",length(mainFolder),")"," - processed"))
    }
    # user confirmation - function executed successfully
    if(i==length(mainFolder)){
      print(paste0("(",i,"/",length(mainFolder),")"," - finished"))
    }
  }
}
