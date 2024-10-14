#Import library
library(ggplot2)

#Set working directory
setwd("I:/SANJOY ROY/Ecoencironmental vulnerability assessment/Data layers/Sensitivity_Analysis")

#Import data and convert to a dataframe
data<- read.csv("samplesdata.csv")
df<- as.data.frame(data, header=TRUE)
df

#Reordering axis labels
label_order<- c('EV', 'Anthropogenic', 'Hydrometeorological', 'LandResource', 'NaturalHazard', 'Topographic')

#Build boxplot
p<- ggplot(df, aes(x=factor(Category, level= label_order), y=Values)) + 
  geom_boxplot(
    #custom outliers
    outliers = TRUE, 
    outlier.colour = "deepskyblue4", 
    outlier.shape = 1, 
   
     #custom boxes
    fill = "darkturquoise", 
    colour = "deepskyblue3", 
    alpha = 0.5
    
    ##notch
    #notch = TRUE,
    #notchwidth = 0.1
    ) + 
  
  #Add horizontal dashed line at 0.43
  geom_hline(
    yintercept=0.4342, 
    linetype="dashed", 
    color = "deeppink3",
    size=1
    ) +
  
  #Change axis titles
  labs(
    x="Variable left out of computation", 
    y="EV score"
    ) + theme_grey(base_size = 14)

#Visualize plot
p

#Save as pdf
ggsave(filename = "plot.pdf", plot= p, width = 8, height= 4, units = "in", dpi = 350)


