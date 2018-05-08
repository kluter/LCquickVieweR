LCquickVieweR
---
The R package `LCquickVieweR` makes land-use change visible by creating false color images. 
The methodical approach is a combination of Image Differencing and Multi Temporal Stacking using NDVI.
This way change is coded by color. All processing steps are automatized.

In this stage [0.0.1] the functions are customized for my latest project, but can be adjusted easily.
`LCquickVieweR` was built during my remote sensing major at University Würzburg.

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

