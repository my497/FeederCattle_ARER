rm(list = ls())

# Linear regression
library(data.table)
library(stats)
datac <-as.data.table( read.csv('dataFinal.csv'))
datac[datac=='.'] <- NA
datac[datac==''] <- NA
datac = datac[complete.cases(datac),]

# Filter the data
datac <- datac[Sex!='5',]
datac <- datac[Sex!='6',]
datac <- datac[Sex!='9',]
datac <- datac[Color!='10',]
datac <- datac[Color!='11',]
datac <- datac[Color!='12',]
datac <- datac[month!='2',]
#datac = datac[ Sex<5,]
#datac = datasetc[(rowSums(is.na(datasetc))==0) ,]
#datac = datac[complete.cases(datac),]

#Define the type of data
datac$PreCond <- factor(datac$PreCond)
datac$Horns <- factor(datac$Horns)
datac$Sex <- factor(datac$Sex)
datac$Color <- factor(datac$Color)
datac$Color <- relevel(datac$Color, ref = "1")
datac$month <- factor(datac$month)
datac$month <- relevel(datac$month, ref = "12")
datac$Frame <- factor(datac$Frame)
datac$Frame <- relevel(datac$Frame, ref = "2")
datac$Muscle <- as.factor(datac$Muscle)
datac$Muscle <- relevel(datac$Muscle, ref = "2")
datac$Thriftiness <- factor(datac$Thriftiness)
datac$Thriftiness <- relevel(datac$Thriftiness, ref = "2")
datac$Price <- as.numeric(as.character(datac$Price))
datac$fcf <- as.numeric(as.character(datac$fcf))
datac$cf <- as.numeric(as.character(datac$cf))
datac$lcf <- as.numeric(as.character(datac$lcf))
datac$Price <- datac$Price*100
datac$idv_wgt <- as.numeric(as.character(datac$idv_wgt))
datac$year<- factor(datac$year)
datac$month<- factor(datac$month)
datac$NoHead <- as.numeric(datac$NoHead)
datac$cf <- datac$cf/100
datac$margin <- as.numeric(datac$margin)/100
datac$cv_lc <- as.numeric(datac$cv_lc)
datac$cv_c <- as.numeric(datac$cv_c)
datac = datac[idv_wgt<900,]
datac = datac[idv_wgt>300,]

datac[datac=='2.5'] <- '2'
datac[datac=='1.5'] <-'1'
datac <- datac[Thriftiness!='3',]

# Regression on different pricing models
lm1 <- lm(Price~ NoHead + I(NoHead^2) + idv_wgt+ I(idv_wgt^2) +lcf+cf+margin+cv_c+cv_lc +PreCond+Horns+Sex+Color+Frame+Muscle+Thriftiness+month+year,datac)
print(summary(lm1))
write.csv(summary(lm1)$coefficients, 'lm1.csv')
#iws <- datac$idv_wgt^2
lm2 <- lm(Price~ NoHead + I(NoHead^2) + idv_wgt+ I(idv_wgt^2) +lcf +cf+margin+
          cv_c+cv_lc +PreCond+PreCond:idv_wgt+Horns+Horns:idv_wgt+Sex+Sex:idv_wgt+Color+Frame
          +Frame:idv_wgt+Muscle+Muscle:idv_wgt+Thriftiness+Thriftiness:idv_wgt+month+year,datac)
Jing <- lm(Price~ NoHead + I(NoHead^2) + idv_wgt+ I(idv_wgt^2) +lcf+ lcf:idv_wgt +cf+ cf:idv_wgt+margin:I(idv_wgt^2) + margin:idv_wgt
                    +cv_c:idv_wgt+cv_lc:idv_wgt +PreCond+PreCond:idv_wgt+Horns+Horns:idv_wgt+Sex+Sex:idv_wgt+Color+Color:idv_wgt+Frame
                    +Frame:idv_wgt+Muscle+Muscle:idv_wgt+Thriftiness+Thriftiness:idv_wgt+month:I(idv_wgt^2)+month:idv_wgt+year,datac)

ds <- lm(Price~ lcf + cf + idv_wgt + I(idv_wgt^2) + Sex:I(idv_wgt^2) + Sex:idv_wgt + lcf:idv_wgt + lcf:I(idv_wgt^2) +  cf:idv_wgt + cf:I(idv_wgt^2) + margin:idv_wgt 
                + margin:I(idv_wgt^2) + cv_c:idv_wgt + cv_lc:idv_wgt + NoHead + I(NoHead^2) + Color + month:I(idv_wgt^2) + month:idv_wgt, datac)
           


print(summary(lm2))
write.csv(summary(lm2)$coefficients, 'lm2.csv')

print(summary(Jing))
write.csv(summary(Jing)$coefficients, 'Jing.csv')

print(summary(ds))
write.csv(summary(ds)$coefficients, 'ds.csv')


#datas3 <- datac[idv_wgt<600&idv_wgt>300&Sex==1]
#lm3 <- lm(Price~ NoHead + idv_wgt + lcf +cf +margin+cv_c+cv_lc+ PreCond + Horns +Color + Frame +Muscle +Thriftiness + month + year,datas3)
#print(summary(lm3))


#datah3 <- datac[idv_wgt<600&idv_wgt>300&Sex==2]
#lm4 <- lm(Price~ NoHead + idv_wgt + lcf +cf +margin+cv_c+cv_lc + PreCond + Horns +Color + Frame +Muscle +Thriftiness + month +year,datah3)
#print(summary(lm4))
#write.csv(lm4$coefficients,'lm4.csv')


#datas6 <- datac[idv_wgt<900&idv_wgt>600&Sex==1]
#lm5 <- lm(Price~ NoHead + idv_wgt + lcf +cf +margin+cv_c+cv_lc + PreCond + Horns +Color + Frame +Muscle +Thriftiness + month +year,datas6)
#print(summary(lm5))
#write.csv(lm5$coefficients,'lm5.csv')



#datah6 <- datac[idv_wgt<900&idv_wgt>600&Sex==2]
#lm6 <- lm(Price~ NoHead + idv_wgt + lcf +cf +margin+cv_c+cv_lc + PreCond + Horns +Color + Frame +Muscle +Thriftiness + month + year,datah6)
#print(summary(lm6))
#write.csv(lm6$coefficients,'lm6.csv')

#Save data as RData
save(datac, file = 'datac.RData')
save(lm2, file = 'lm2.RData')
save(lm1, file = 'lm1.RData')
save(Jing, file = 'Jing.RData')
save(ds, file = 'ds.RData')

write.csv(datac,'datac.csv')





