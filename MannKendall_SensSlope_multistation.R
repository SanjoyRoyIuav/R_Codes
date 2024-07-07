install.packages("readxl")
install.packages("Kendall")
library(readxl)
library(trend)
library(dplyr)

setwd("J:/test")
JP129<- read_xlsx("TPJ_129.xlsx")
JP<- data.frame(JP129)

#MannKendall test
mk_test <- function(x, ...,continuity = TRUE) {
  result <- mk.test(x, ...,continuity = TRUE)
    tibble(
    p.value = result$p.value,
    statistic.Z = result$statistic,
    estimates = result$estimates
    # and any other values you want to capture from the return
  )
}

MannKendall<- JP %>%
  group_by(Pointnumber) %>%
  group_modify(~ mk_test(.x$AVGSLA))
MannKendall
write.csv(MannKendall, 'MannKendall.csv')

#Sen's Slope test
ss_test <- function(x, conf.level = 0.95) {
  result <- sens.slope(x, conf.level = 0.95)
  tibble(
    p.value = result$p.value,
    statistic.Z = result$statistic,
    Sens.slope = result$estimates
    # and any other values you want to capture from the return
  )
}

SensSlope<- JP %>%
  group_by(Pointnumber) %>%
  group_modify(~ ss_test(.x$AVGSLA))
SensSlope
write.csv(SensSlope, 'SensSlope.csv')
