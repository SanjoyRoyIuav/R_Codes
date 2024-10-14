setwd('I:/SANJOY ROY/Ecoencironmental vulnerability assessment/Data layers/VIF') # set dirtectory

w<- read.csv('Calculated_VIF.csv') #load csv data file
VIFdat<- as.data.frame(w) #create a data frame


library(ggplot2)


p<- ggplot(VIFdat) + 
  
  geom_col(
    aes(VIF, Criterion), 
    fill = "darkturquoise", 
    colour = "deepskyblue3", 
    alpha = 0.8, 
    width = 0.6
    ) + 
  
  labs(
    x = "VIF values", 
    y = NULL
    ) + 
  
  theme_bw() + 
  
  geom_vline(
    xintercept=5, 
    linetype="dashed", 
    color = "red",
    size=1
  ) + 
  annotate('text', x = 4.7, y = 10,  
           label = 'VIF = 5',
           size = 5, 
           angle='90') 
p

#Save as pdf
ggsave(filename = "plot2.pdf", plot= p, width = 3.3, height= 6.5, units = "in")
