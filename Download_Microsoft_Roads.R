#Set working directory
setwd("C:/Users/Admin/Downloads/AsiaSouth-Full")

#Call libraries
library("sf")
library("readr")
library("geojsonsf")

## download all roads for Europe
data = "https://usaminedroads.blob.core.windows.net/road-detections/AsiaSouth-Full.zip" #Data URL: https://github.com/microsoft/RoadDetections?tab=readme-ov-file
options(timeout = 6000)
download.file(data, "AsiaSouth.zip")
unzip("AsiaSouth.zip")

## read data in chunks (and select only in Bangladesh)
f = function(x, pos) subset(x, country == "BGD") #Select country
df = read_tsv_chunked("AsiaSouth-Full.tsv", DataFrameCallback$new(f),
                      col_names = c("country", "geom"),
                      chunk_size = 10000000000, col_types = "fc")

geom = geojson_sfc(df$geom) #Convert to geojson

#Write data as geopackage in the directory
write_sf(geom, "BGD.gpkg") # save as geopackage, and open in ArcgisPro (Open data by dragging from arc catalogue)
