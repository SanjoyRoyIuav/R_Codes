#Install necessary packages
install.packages("raster")
install.packages("corrplot")
install.packages("RColorBrewer")

#Import Libraries
library(raster)
library(corrplot)
library(RColorBrewer)

#Set working directory
setwd("I:/Flood_Paper/FLM_MeritDatabase/Multicollinearity_Test_Database")

#Import FCP rasters as separate variables
r1 <- raster("Elevation.tif")
r2 <- raster("Slope.tif")
r3 <- raster("Aspect.tif")
r4 <- raster("Curvature.tif")
r5 <- raster("Flow_Direction.tif")
r6 <- raster("Flow_Accumulation.tif")
r7 <- raster("STI.tif")
r8 <- raster("TPI.tif")
r9 <- raster("TRI.tif") 
r10 <- raster("LULC.tif")
r11 <- raster("NDVI.tif")
r12 <- raster("Soil_Texture.tif")
r13 <- raster("Soil_Permeability.tif")
r14 <- raster("Surface_Geology.tif")
r15 <- raster("Soil_Type.tif")
r16 <- raster("Road_Distance.tif")
r17 <- raster("NDBI.tif")
r18 <- raster("Total_Rainfall.tif")
r19 <- raster("Drainage_Density.tif")
r20 <- raster("SPI.tif")
r21 <- raster("River_Distance.tif")
r22 <- raster("TWI.tif")

#Stack all FCP rasters
st <- stack(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,
            r11, r12, r13, r14, r15, r16, r17, r18, 
            r19, r20, r21, r22)
st

#Calculate Pearson correlation using 10% random pixels as samples
cor<- cor(sampleRandom(st, size= ncell(r1) * 0.01 ), method = "pearson")
cor

#Plot Pearson correlation results with coefficients as box
Plot1 <- corrplot(cor, method = "square", order = 'hclust', type = 'upper', 
               col = brewer.pal(n = 8, name = "RdBu"), tl.col = "black", tl.cex = 0.9)



#Plot Pearson correlation results with coefficients as box and numbers
Plot2 <- corrplot(cor, method = "square", order = 'hclust', type = 'upper', 
               col = rev(brewer.pal(n = 8, name = "Spectral")), addCoef.col = 'black',
               number.cex = 0.3, number.col= "black", tl.col = "black", tl.cex = 0.9)

