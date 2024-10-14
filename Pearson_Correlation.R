#Install necessary packages
install.packages("raster")
install.packages("corrplot")
install.packages("RColorBrewer")

#Import Libraries
library(raster)
library(corrplot)
library(RColorBrewer)

#Set working directory
setwd("I:/SANJOY ROY/Ecoencironmental vulnerability assessment/Data layers/Pearson_Correlation/Scalled2")

#Import FCP rasters as separate variables
r1 <- raster("Aspect.tif")
r2 <- raster("Cyclone_Intensity.tif")
r3 <- raster("Elevation.tif")
r4 <- raster("GWL.tif")
r5 <- raster("Industry_Distance.tif")
r6 <- raster("Landslide.tif")
r7 <- raster("LST_Anomaly.tif")
r8 <- raster("LULC.tif")
r9 <- raster("NDMI_mean.tif") 
r10 <- raster("NDVI_mean.tif")
r11 <- raster("Population_Density.tif")
r12 <- raster("Rainfall_anomaly.tif")
r13 <- raster("Roads_Distance.tif")
r14 <- raster("Slope_degree.tif")
r15 <- raster("Soil_Salinity.tif")
r16 <- raster("Storm_Surge.tif")
r17 <- raster("Stream_Distance.tif")
r18 <- raster("Tourist_Spot_distance.tif")
r18


#Stack all FCP rasters
st <- stack(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,
            r11, r12, r13, r14, r15, r16, r17, r18)
st

#Calculate Pearson correlation using 10% random pixels as samples
cor<- cor(sampleRandom(st, size= ncell(r1) * 0.01 ), method = "pearson")
cor


#Plot Pearson correlation results with coefficients as box
Plot1 <- corrplot(dat2, method = "square", order = 'hclust', type = 'upper', 
               col = brewer.pal(n = 8, name = "RdBu"), tl.col = "black", tl.cex = 0.9)



#Plot Pearson correlation results with coefficients as box and numbers
Plot2 <- corrplot(cor, method = "square", order = 'hclust', type = 'upper', 
               col = rev(brewer.pal(n = 8, name = "Spectral")), addCoef.col = 'black',
               number.cex = 0.3, number.col= "black", tl.col = "black", tl.cex = 0.9)

