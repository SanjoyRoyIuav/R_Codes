#VIF: https://www.reneshbedre.com/blog/calculate-vif-r.html
#VIF: https://favtutor.com/blogs/vif-r-multicollinearity 
#Python: https://www.geeksforgeeks.org/detecting-multicollinearity-with-vif-python/

#Set working directory
setwd("C:/Users/Admin/Desktop/Sabit_Database/Processed")


#Bring in Training Data (70% of total sample)
TRData <- read.csv("VIF_data.csv")
Data<- data.frame(TRData)
head(Data)

#Install car package
install.packages(c("car", "pscl"))
library(car)
library(pscl)

#Fit Multiple Regression model
mod2<- lm(Slope~ avgNDMI+avgNDVI+Surface_El+annMinLST+annMaxLst+avgRF, data= Data)
summary(mod2)

#Assessing Model Fit using McFadden pseudo R2:
#A McFadden’s pseudo R2 ranging from 0.2 to 0.4 indicates very good model fit. Used Package "pscl"
McFaddenR2<- pR2(mod2) ['McFadden']
McFaddenR2

#Calculate VIF for individual Flood conditioning parameter
vif2<- car::vif(mod2)
vif2

