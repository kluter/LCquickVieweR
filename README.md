LCquickVieweR
---
The R package `LCquickVieweR` makes land-use change visible by creating false color images. 
The methodical approach is a combination of Image Differencing and Multi Temporal Stacking using NDVI.
This way change is coded by color. All preprocessing steps are automatized.

In this stage [0.0.1] the functions are customized for my latest project, but can be adjusted easily.
`LCquickVieweR` was built during my remote sensing major at University Würzburg.

## Installation
Install `LCquickVieweR` directly from github by using `devtools`.
``` r
devtools::install_github("kluter/LCquickVieweR")
```

## Functions
`LCquickVieweR` provides a small set of functions, namely:


* `mergeThis()` - [0.0.1] Merges two tiles into a single image for every dataset in a committed directory. 
Including more tiles is possible by adjusting the referenced `raster::mosaic()` function.
* `subsetThis()` - Crops every raster image in a committed directory to the extend of any shapefile.
* `getNDVI()` - Computes the NDVI for every Landsat5 and Landsat8 scene in a committed directory.
    - `NDVI()` - Basic ratio computation using Red & NIR bands, see [NDVI](https://en.wikipedia.org/wiki/Normalized_difference_vegetation_index). 
    - `Landsat5_NDVI()` - Looks for the right Landsat5 bands for NDVI computation.
    - `Landsat8_NDVI()` - Looks for the right Landsat8 bands for NDVI computation.
* `getDeltaNDVI()` - Creates image subtractions of every successive pair within a directory. The order of subtractions is the order of the committed directory.
    - `deltaNDVI()` - Raster calculation: `deltaNDVI()` subtracts NDVI datasets from each other. The prior dataset is subtracted from the later.
* `stackTime()`

-   `packageChecker()`
-   
-   

-   `backslashConverter()`
-   `set.wd()`
