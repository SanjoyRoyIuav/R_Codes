#Install necessary packages
install.packages("raster")

#Import Libraries
library(raster)
library(sp)
library(ggplot2)

#Set working directory
setwd("I:/SANJOY ROY/Ecoencironmental vulnerability assessment/Data layers/Sensitivity_Analysis")

#Import FCP rasters as separate variables
r1 <- raster("EV.tif")
r2 <- raster("Anthropogenic.tif")
r3 <- raster("HydroMeteorological.tif")
r4 <- raster("LandResource.tif")
r5 <- raster("NaturalHazard.tif")
r6 <- raster("Topographic.tif")

#Stack all FCP rasters
st <- stack(r1, r2, r3, r4, r5, r6)
names(st)<- c('EV', 'Anthropogenic', 'Hydrometeorological', 'LandResource', 'Naturalhazards', 'Topographic') #Changing names of the rasters

#Boxplot

p<- boxplot(st, notch = TRUE, col = "orange", border="maroon4",
        xlab= 'Variable left out of computation', 
        ylab='EV Scores', outline=FALSE)


abline(h=0.432, col="red", lwd= 1.5, lty=2) 









#https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/boxplot

#https://www.datamentor.io/r-programming/box-plot