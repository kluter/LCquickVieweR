# image differencing of NDVI subsets
getDeltaNDVI <- function(list){
  for(i in 1:length(list)){
    datePrior <- raster(paste0(getwd(),"/result_subset/",list[i]))
    dateLater <- raster(paste0(getwd(),"/result_subset/",list[i+1]))
    timestep <- deltaNDVI(dateLater, datePrior)

    list[i] <- gsub(pattern = "subset_ndvi_", replace = "", x=list[i])
    list[i] <- gsub(pattern = "_01_T1.tif", replace = "", x=list[i])
    hold1 <- gsub(pattern = "subset_ndvi_", replace = "", x=list[i+1])
    hold2 <- gsub(pattern = "_01_T1.tif", replace = "", x=hold1)

    writeRaster(timestep, filename = paste0("result_deltaNDVIs/delta_",list[i],"_-_",hold2,".tif"))
    print(paste0(list[i]," (",i,"/",length(list),")"," - processed"))
    # if(i==length(list)){
    #   print(paste0("(",i,"/",length(list),")"," - finished"))
    # }
  }
}
