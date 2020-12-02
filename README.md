LCquickVieweR
---
The remote sensing R package `LCquickVieweR` makes land-use change visible by creating false color images. 
The methodical approach is a combination of Image Differencing and Multi Temporal Stacking using NDVI.
This way change is coded by color. All processing steps are automatized.

At this stage [0.0.1] some functions are customized for my latest project, but can be adjusted easily.
`LCquickVieweR` was built during my remote sensing major at University Würzburg.

<p align="center"><img width="50%" src="https://github.com/kluter/LCquickVieweR/blob/master/img/result1.gif"></p>
<p align="center"><sub>Animation 1: LCquickVieweR final product.</sub></p>


## Installation
Install `LCquickVieweR` directly from github by using `devtools`.
``` r
devtools::install_github("kluter/LCquickVieweR")
```

## Functions
`LCquickVieweR` provides a small set of functions:

Adjusting study area:
* `mergeThis()` - [0.0.1] merges two tiles into a single image for every dataset in a committed directory. 
Including more tiles is possible by adjusting the referenced `raster::mosaic()` function.
* `subsetThis()` - crops every raster image in a committed directory to the extend of any shapefile.

Image Differencing and Multi Temporal Stacking using NDVI:
* `getNDVI()` - computes the NDVI for every Landsat5 and Landsat8 scene in a committed directory.
    - `NDVI()` - basic ratio computation using Red & NIR bands, see [NDVI](https://en.wikipedia.org/wiki/Normalized_difference_vegetation_index). 
    - `Landsat5_NDVI()` - looks for the right Landsat5 bands for NDVI computation.
    - `Landsat8_NDVI()` - looks for the right Landsat8 bands for NDVI computation.
* `getDeltaNDVI()` - creates image subtractions of every successive pair within a directory. The order of subtractions is the order of the committed directory.
    - `deltaNDVI()` - raster calculation: `deltaNDVI()` subtracts NDVI datasets from each other. The prior dataset is subtracted from the later.
* `stackTime()` - creates the final product by stacking the prior, later, and delta datasets into their respective RGB channels.

Bonus functions that make RStudio life easier:

* `packageChecker()` - takes a list of packageNames and checks it against the internal library. If a package is missing, it will download, install and activate it. If a package is already installed but old, it will be updated and activated. If a package is already installed, it will be activated.
* `set.wd()`- setting a working directory by pasting a windows path directly, without changing any single \backslash.
    - `backslashConverter()` - converts \ into /.

## Get Started
A quick demonstration of what `LCquickVieweR` can do:

Put all your downloaded satellite images into one folder. Up to this point the automatization works only for Landsat 5 and 8 scenes. Bands from other satellites need to be addressed manually.

Presetting:
``` r
# Load packages
packages <- c("raster", "sp", "RStoolbox", "rgdal")
LCquickVieweR::packageChecker(packages)

# set your working directory to your sat-image folder
set.wd()

# create subfolders for temporal datasets and results
directories <- c("result_NDVIs", "result_mosaic", "result_subset", "result_deltaNDVIs", "result_falseColor")
for(i in 1:length(directories)){
  dir.create(directories[i])
  }
  
# create the main list of your working directory
dirList <- list.files()
```

Main program:
``` r
# creating NDVIs for all downloaded data
getNDVI(dirList)
```
<p align="center"><img width="50%" src="https://raw.githubusercontent.com/kluter/LCquickVieweR/blob/master/img/img1.png"></p>
<p align="center"><sub>Figure 1: Converting all datasets into NDVI datasets.</sub></p>

``` r
# filtering for needed tiles
imageTile1 <- list.files("result_NDVIs/", pattern = "177044")
imageTile2 <- list.files("result_NDVIs/", pattern = "177045")

# combining tiles for full study area
mergeThis(imageTile1, imageTile2)

#--------------------------------------------------------------------------------#
# loading extent of study area -> shp-file
studyArea <- readOGR(dsn = "_vector_data", layer = "studyArea")
# addressing all merged images
allMosaics <- list.files("result_mosaic/")

# creating subset from all mosaics
subsetThis(allMosaics, studyArea)
```
<p align="center"><img width="40%" src="https://raw.githubusercontent.com/kluter/LCquickVieweR/blob/master/img/img2.png"></p>
<p align="center"><sub>Figure 2: Merged and cropped study area.</sub></p>

``` r
# getting all subsets into a list
allSubsets <- list.files("result_subset/")

# image differencing deltaNDVI()
getDeltaNDVI(allSubsets)

#--------------------------------------------------------------------------------#
# collecting preprocessed datasets for final product
delta <- list.files("result_deltaNDVIs/")
ndvi <- list.files("result_subset/")

# creating main land-use change product
stackTime(ndvi, delta)
```
<p align="center"><img width="60%" src="https://raw.githubusercontent.com/kluter/LCquickVieweR/blob/master/img/img3.1.png"></p>
<p align="center"><sub>Figure 3: Assembling the final product.</sub></p>

## colorCode
Once the processing is done, your results will look pretty much like the scenes in the GIFs. Regardless of where that scene is from, the colorCode will still be the same:

* reddish colors: lost areas
* cyan colors: gained areas
* yellowish and purple areas: areas without change 

In general color depends on NDVI intensity in both dates.

<p align="center"><img width="50%" src="https://raw.githubusercontent.com/kluter/LCquickVieweR/blob/master/img/result2.gif"></p>
<p align="center"><sub>Animation 2: LCquickVieweR final product.</sub></p>
