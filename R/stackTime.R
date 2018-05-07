# creating false color image -> LULC product
stackTime <- function(list1, list2){
  for(i in 1:length(list1)){
    b1 <- raster(paste0(getwd(),"/result_subset/",list1[i]))
    b2 <- raster(paste0(getwd(),"/result_subset/",list1[i+1]))
    b3 <- raster(paste0(getwd(),"/result_deltaNDVIs/",list2[i]))
    falseColor <- stack(b1,b2,b3)
    writeRaster(falseColor, filename = paste0("result_falseColor/stacked_",list2[i]))
    print(paste0(list2[i]," (",i,"/",length(list2),")"," - processed"))
    # if(i==length(list2)){
    #   print(paste0("(",i,"/",length(list2),")"," - finished"))
    # }
  }
}
