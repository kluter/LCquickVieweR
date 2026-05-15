LCquickVieweR
---
`LCquickVieweR` is an R package that makes land-use/land-cover (LULC) change visible by producing false color composites from multi-date satellite imagery. It combines Image Differencing and Multi-Temporal NDVI Stacking to encode change as color — no manual classification required.

## Background

Developed as a seminar submission for the **[EAGLE MSc Program](https://eagle-science.org)**.

The methodology was first applied in a BSc thesis in Physical Geography at **Goethe-Universität Frankfurt am Main**:

> **Fernerkundliche Identifizierung und Analyse der Landnutzungsänderung im Umland von Taroudannt, Marokko**
>
> Institut für Physische Geographie · 2013  
> Erstgutachter: Dr. Irene Marzolff

That study documented large-scale LULC change driven by groundwater extraction for export-oriented fruit agriculture in the surroundings of Taroudannt, Morocco.

## Study Area & Results

The package is demonstrated on an agricultural region in **Egypt** (22°28'N 28°29'E), analyzed across seven consecutive periods between **1999 and 2018** using Landsat 5 and Landsat 8 imagery. The dominant pattern observed is rapid agricultural expansion sustained by groundwater extraction.

<table>
<tr>
<td width="50%">
<img width="100%" src="https://github.com/kluter/LCquickVieweR/blob/master/img/result1.gif">
<br><sub>LCquickVieweR result — Egypt study area, 1999–2018.</sub>
</td>
<td width="50%">
<img width="100%" src="https://github.com/kluter/LCquickVieweR/blob/master/img/result2.gif">
<br><sub>LCquickVieweR result — Egypt study area, 1999–2018.</sub>
</td>
</tr>
<tr>
<td colspan="2" align="center">

**Color Code**

| Color | Meaning |
|---|---|
| Cyan | Vegetation gained |
| Reddish | Vegetation lost |
| Yellowish / Purple | Little or no change |

Color intensity reflects NDVI magnitude in both time steps.

</td>
</tr>
</table>

## Installation
Install `LCquickVieweR` directly from GitHub using `devtools`:
``` r
devtools::install_github("kluter/LCquickVieweR")
```

## Get Started

Put all downloaded Landsat scenes into one folder, then:

``` r
# Load dependencies
packages <- c("raster", "sp", "RStoolbox", "rgdal")
LCquickVieweR::packageChecker(packages)

# Set working directory (paste Windows path directly)
set.wd()

# Create output folders
directories <- c("result_NDVIs", "result_mosaic", "result_subset", 
                 "result_deltaNDVIs", "result_falseColor")
for(i in 1:length(directories)){
  dir.create(directories[i])
}

dirList <- list.files()
```

``` r
# Compute NDVI for all scenes
getNDVI(dirList)
```
<p align="center"><img width="50%" src="https://github.com/kluter/LCquickVieweR/blob/master/img/img1.png"></p>
<p align="center"><sub>Figure 1: Converting all datasets into NDVI datasets.</sub></p>

``` r
# Mosaic tiles and crop to study area
imageTile1 <- list.files("result_NDVIs/", pattern = "177044")
imageTile2 <- list.files("result_NDVIs/", pattern = "177045")
mergeThis(imageTile1, imageTile2)

studyArea <- readOGR(dsn = "_vector_data", layer = "studyArea")
allMosaics <- list.files("result_mosaic/")
subsetThis(allMosaics, studyArea)
```
<p align="center"><img width="40%" src="https://github.com/kluter/LCquickVieweR/blob/master/img/img2.png"></p>
<p align="center"><sub>Figure 2: Merged and cropped study area.</sub></p>

``` r
# Compute delta NDVI and build final composite
allSubsets <- list.files("result_subset/")
getDeltaNDVI(allSubsets)

delta <- list.files("result_deltaNDVIs/")
ndvi  <- list.files("result_subset/")
stackTime(ndvi, delta)
```
<p align="center"><img width="60%" src="https://github.com/kluter/LCquickVieweR/blob/master/img/img3.1.png"></p>
<p align="center"><sub>Figure 3: Assembling the final composite.</sub></p>

## Note

Written in 2018 for Landsat 5 and 8. The R libraries used (`raster`, `rgdal`, 
`sp`) have since been largely superseded by `terra` and `sf`. The same 
workflow today would more likely be implemented in Python using `rasterio`, 
`xarray`, or `stackstac`.
