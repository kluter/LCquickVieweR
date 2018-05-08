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

* `getNDVI()` - computes the NDVI for every Landsat5 and Landsat8 scene in a committed directory.
    - `NDVI()` - basic ratio computation using Red & NIR bands, see [NDVI](https://en.wikipedia.org/wiki/Normalized_difference_vegetation_index). 
    - `Landsat5_NDVI()` - looks for the right Landsat5 bands for NDVI computation.
    - `Landsat8_NDVI()` - looks for the right Landsat8 bands for NDVI computation.

* `mergeThis()` - [0.0.1] merges two tiles into a single image for every dataset in a committed directory. 
Including more tiles is possible by adjusting the referenced `RStoolbox::mosaic()` function.
* `subsetThis()`

* `deltaNDVI()`  
* `getDeltaNDVI()`

-   

-   `packageChecker()`
-   `stackTime()`
-   

-   `backslashConverter()`
-   `set.wd()`
