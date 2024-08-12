#VIF: https://www.reneshbedre.com/blog/calculate-vif-r.html
#VIF: https://favtutor.com/blogs/vif-r-multicollinearity 

#Install car package
install.packages("car")
library(car)

#Set working directory
setwd("I:/Flood_Paper/FLM_MeritDatabase/VIF_Test_Database")

#Load Training Data (70% of total sample)
data <- read.csv("Training_Data_VIF.csv")
attach(data)
head(data)

#Fit Logistic Regression model
inModel<- glm(Flood~ Aspect+Curvature+Drainage+Elevation+Flow_Ac+Flow_Di+
                Geology+LULC+NDBI+NDVI+Rainfall+River_D+Road_D+Slope+
                Soil_P+Soil_Tx+Soil_Ty+SPI+STI+TPI+TRI+TWI, data= data, family = binomial(link="logit"))
summary(inModel)

inVIF<- car::vif(inModel)
inVIF

#Fit Logistic Regression model after highly correlated variables removed
fnModel<- glm(Flood~ Aspect+Curvature+Drainage+Elevation+Flow_Ac+Flow_Di+
                Geology+LULC+NDBI+Rainfall+River_D+Road_D+Slope+
                Soil_P+Soil_Tx+Soil_Ty+SPI+TWI, data= data, family = binomial(link="logit"))
summary(fnModel)

fnVIF<- car::vif(fnModel)
fnVIF

#Fit Multiple Regression model
mrModel<- lm(Flood~ Aspect+Curvature+Drainage+Elevation+Flow_Ac+Flow_Di+
                Geology+LULC+NDBI+NDVI+Rainfall+River_D+Road_D+Slope+
                Soil_P+Soil_Tx+Soil_Ty+SPI+STI+TPI+TRI+TWI, data= data)
summary(mrModel)$fstatistic[1]
summary(mrModel)$r.squared
summary(mrModel)$adj.r.squared



