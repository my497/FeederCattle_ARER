rm(list = ls())

# Linear regression
library(data.table)
library(stats)
library(olsrr)
library(tidyverse)
library(ggpubr)
library(rstatix)
load('datac.RData')



# Regression pricing model
          
lm_cf_lcf <- lm(Price~ NoHead + I(NoHead^2) + idv_wgt+ I(idv_wgt^2) +lcf + lcf:idv_wgt +cf + cf:idv_wgt+margin+
            cv_c+cv_lc +PreCond+PreCond:idv_wgt+Horns+Horns:idv_wgt+Sex+Sex:idv_wgt+Color+Frame
          +Frame:idv_wgt+Muscle+Muscle:idv_wgt+Thriftiness+Thriftiness:idv_wgt+month+year,datac)


print(summary(lm_cf_lcf))
write.csv(summary(lm_cf_lcf)$coefficients, 'lm_cf_lcf.csv')


save(lm_cf_lcf, file = 'lm_cf_lcf.RData')





