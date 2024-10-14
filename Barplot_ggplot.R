setwd('I:/SANJOY ROY/Ecoencironmental vulnerability assessment/StatisticalAnalysis') # set dirtectory
tiff("Plot3.tif", width = 11.72, height = 3, units = 'in', res = 400) #export to tiff
w<- read.csv('Book2.csv') #load csv data file
EEV<- as.data.frame(w) #create a data frame
new_data<- EEV [1:25, ] #subset data

new_data$pressure <- factor(new_data$pressure,      # Reordering group levels
                            levels = c("HMP", "TP", "ANP", "LRP", "NHP"))
new_data$class <- factor(new_data$class,      # Reordering x axes levels
                         levels = c("VL", "L", "M", "H", "VH"))
new_levels<- c(HMP= "Hydro-meteorological Pr.", TP= "Topographic Pr.", ANP= "Anthropogenic Pr.", LRP= "Land resource Pr.", 
                NHP= "Natural hazard Pr.") #changing names of the existing labels

library(ggplot2)
p<-ggplot(data=new_data, aes(x=class, y=area, fill=pressure)) + scale_fill_manual(values = c("#00AFBB", "#E7B800", "#B22222", "#0072B2", "#D55E00"))+
  geom_bar(stat="identity")+ ylab("Ave. area (sq. km.)")+ xlab("Pressure categories")
p+ facet_wrap(~pressure, nrow = 1, labeller = labeller(pressure= new_levels))+ theme(axis.title.x = element_text(size=14, face="bold"), 
                                                                                     axis.title.y = element_text(size=14, face="bold"),
                                                                                     panel.border = element_rect(colour = "#696969", fill=NA, size=1)) + 
  theme(legend.position="none")+ theme(strip.text.x = element_text(size = 13, face = "bold"))
dev.off()
