rm(list = ls())
# Get the regression

source('PricingModel.R')
#dailycost <- 2.0176*datac$cf*0.0141*
fixcost <- 33.93

day <- 180
r <- 2
#only consider weight range from 300 to 540
#datac = datac[idv_wgt<540,]


datac = datac[idv_wgt<600,]
datac = datac[idv_wgt>500,]

# priceNow

pNow <- predict(lm_cf_lcf, datac, interval = 'confidence')
profitNow <- pNow * datac$idv_wgt/100
# Month update + profit future
monthUpdate <- function(x){
  return( switch(as.character(x), '12' = '5', '2'='9',
                 '3' = '9',
                 '4' = '10', 
                 '5' = '11',
                 '9' = '3',
                 '10' = '4',
                 '11' = '5'))
}
monthFuture <- unlist(lapply(datac$month, FUN = monthUpdate))

weightFuture <- datac$idv_wgt +r*day


datacFuture <- datac

datacFuture$idv_wgt <- weightFuture
datacFuture$month <- monthFuture

#Predict the future price
pFuture <- predict(lm_cf_lcf, datacFuture, interval = 'confidence')

#Estimate the future profit
profitFuture <- pFuture * datacFuture$idv_wgt/100

wt_ave <- datac$idv_wgt+r*day/2
dailycost <- 2.0176*datac$cf/56*0.0141*wt_ave
cost <- dailycost*day+fixcost


profit <- profitFuture*0.99255-1.025*profitNow -1.025*cost
#profit <- profit[(datac$month)%in%c('9', '10','11', '12'),]

#profit <- cbind(profit, datac$idv_wgt)

print(profit)


print(sum(profit[,1] > 0)/ dim(profit)[1])
print(sum(profit[,2] > 0)/ dim(profit)[1])
print(sum(profit[,1] > 25)/ dim(profit)[1])
print(sum(profit[,2] > 25)/ dim(profit)[1])

write.csv(profit, 'profit_0114_CI.csv')

decisionMaking <- function(x){
  
  temp <- datac[1,]
  temp[1,] <- as.vector(x)
  x <- temp
  day <- 180
  r <- 2
  
  print(x$idv_wgt)
  pNow <- predict.lm(lm_cf_lcf,x)
  incomeNow <- pNow*x$idv_wgt/100
  
  
  
  
  
  # Update
  # Weight
  x$idv_wgt <- x$idv_wgt + r*day
  
  # Month
  x$month <- switch(as.character(x$month), '12' = '6', '2'='8',
                    '3' = '9',
                    '4' = '10', 
                    '5' = '11',
                    '9' = '3',
                    '10' = '4',
                    '11' = '5')
  
  pFuture <- predict.lm(lm_cf_lcf,x)
  
  
  incomeFuture <- pFuture*x$idv_wgt/100
  
  #LCF <- (lcf_s-lcf_f)*1.499
  Profit <- incomeFuture*0.99255-1.025*incomeNow-1.025*Cost
  # print(Profit)
  
}


















