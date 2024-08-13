#VIF: https://www.reneshbedre.com/blog/calculate-vif-r.html
#VIF: https://favtutor.com/blogs/vif-r-multicollinearity 

#Install car package
install.packages(c("car", "pscl"))
library(car)
library(pscl)

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

inVIF<- vif(inModel)
inVIF

#Assessing Model Fit using McFadden pseudo R2:
#A McFadden’s pseudo R2 ranging from 0.2 to 0.4 indicates very good model fit. Used Package "pscl"
McFaddenR2<- pR2(inModel) ['McFadden']
McFaddenR2

#Fit Logistic Regression model after highly correlated variables removed
fnModel<- glm(Flood~ Aspect+Curvature+Drainage+Elevation+Flow_Ac+Flow_Di+
                Geology+LULC+NDBI+Rainfall+River_D+Road_D+Slope+
                Soil_P+Soil_Tx+Soil_Ty+SPI+TWI, data= data, family = binomial(link="logit"))
summary(fnModel)

fnVIF<- vif(fnModel)
fnVIF

#Check McFadden Pseudo R2 value
McFaddenR2<- pR2(fnModel) ['McFadden']
McFaddenR2

#Finding variable importance using package "caret"
install.packages("caret")
library(caret)

variableIm<- varImp(fnModel)
barplot(variableIm$Overall, horiz = TRUE)


#Fit Multiple Regression model
mrModel<- lm(Flood~ Aspect+Curvature+Drainage+Elevation+Flow_Ac+Flow_Di+
                Geology+LULC+NDBI+NDVI+Rainfall+River_D+Road_D+Slope+
                Soil_P+Soil_Tx+Soil_Ty+SPI+STI+TPI+TRI+TWI, data= data)
summary(mrModel)$fstatistic[1]
summary(mrModel)$r.squared
summary(mrModel)$adj.r.squared



