install.packages("hrbrthemes")
install.packages("ggpubr")
library(ggplot2)
library(hrbrthemes)
library(ggpubr)

setwd("I:/SANJOY ROY/Ecoencironmental vulnerability assessment/Data layers/Validation")

data<- read.csv('drr.csv')
df<- as.data.frame(data)

ggplot(df, aes(x=PM, y=EV))+ 
  geom_point(colour="black", size= 2) + 
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) + 
  stat_regline_equation(label.x=46, label.y=0.8) + 
  stat_cor(aes(label=..rr.label..), label.x=55, label.y=0.8) +
  stat_cor(label.x=46, label.y=0.75)+ 
  labs(x="Particulate matter 2.5", y="EV scores")+
  theme_bw()
