LCquickVieweR
---
The R package `LCquickVieweR` makes land-use change visible by creating false color images. 
The methodical approach is a combination of Image Differencing and Multi Temporal Stacking using NDVI.
This way change is coded by color. All preprocessing steps are automatized.

In this stage [0.0.1] the number of functions is customized for my latest project, but can be adjusted easily.
`LCquickVieweR` was built for an analysis during my remote sensing major at University Würzburg.

## Installation
Install `LCquickVieweR` directly from github by using `devtools`.
``` r
devtools::install_github("kluter/LCquickVieweR")
```

## Functions
`LCquickVieweR` provides a small set of functions, namely:

* `NDVI()` - basic ratio computation using Red & NIR bands, see [NDVI](https://en.wikipedia.org/wiki/Normalized_difference_vegetation_index).
* `Landsat5_NDVI()` - finds the right Landsat5 bands for NDVI computation.
* `Landsat8_NDVI()` - finds the right Landsat8 bands for NDVI computation.
* `getNDVI()` - processes a directory of Landsat5 and/or Landsat8 scenes by choosing the right bands and computing the NDVI for every image

* `deltaNDVI()` – 
* `getDeltaNDVI()`

-   `mergeThis()`

-   `packageChecker()`
-   `packageChecker()`
-   `stackTime()`
-   `subsetThis()`

-   `backslashConverter()`
-   `set.wd()`
