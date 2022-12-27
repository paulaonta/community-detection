setwd("/home/paula/Escritorio/community detection/data")
library(RVCompare)
library(ggplot2)

csv_data_50 <-read.csv("edaVSils_50.csv", sep=',')
ILS50<- csv_data_50$'ILS'
EDA50<- csv_data_50$'EDA'
balioa<-csv_data_50$num
ilsa50 <- csv_data_50$'ILS.arrunta'

csv_data_100 <-read.csv("edaVSils_100.csv", sep=';')
ILS100<- csv_data_100$'ILS'
EDA100<- csv_data_100$'EDA'
ilsa100 <- csv_data_100$'ILS.arrunta'

csv_data_200 <-read.csv("edaVSils_200.csv", sep=',')
ILS200<- csv_data_200$'ILS'
EDA200<- csv_data_200$'EDA'
ilsa2000 <- csv_data_200$'ILS.arrunta'

csv_data_300 <-read.csv("edaVSils_300.csv", sep=',')
ILS300<- csv_data_300$'ILS'
EDA300<- csv_data_300$'EDA'
ilsa300 <- csv_data_300$'ILS.arrunta'

max(ilsa2000)

setwd("/home/paula/Escritorio/community detection/data")
if (length(ILS50) != length(EDA50))
{
  stop("length(ILS50) != length(EDA50)")
}

if (length(ILS100) != length(EDA100))
{
  stop("length(ILS100) != length(EDA100)")
}

if (length(ILS200) != length(EDA200))
{
  stop("length(ILS200) != length(EDA200)")
}

if (length(ILS300) != length(EDA300))
{
  stop("length(ILS300) != length(EDA300)")
}
data <- data.frame(
  name <- c( rep("ILS",length(ILS50)), rep('EDA',length(EDA50)), rep("ILS",length(ILS100)), rep('EDA',length(EDA100)), rep("ILS",length(ILS200)), rep('EDA',length(EDA200)),rep("ILS",length(ILS300)), rep('EDA',length(EDA300))),
  value <- c(ILS50, EDA50,ILS100, EDA100,ILS200, EDA200,ILS300, EDA300),
  size<- c(rep(" 50",2*length(ILS50)), rep('100',2*length(EDA100)), rep("200",2*length(ILS200)), rep('300',2*length(EDA300))))
library("vioplot")
eda <-c(c(EDA50),c(EDA100),c(EDA200),c(EDA300))
ils <-c(c(ILS50),c(ILS100),c(ILS200),c(ILS300))
mean(EDA100)

#  name<-c(balioa,balioa,balioa,balioa,balioa,balioa,balioa,balioa),
# value<-c(ILS50, EDA50,ILS100, EDA100,ILS200, EDA200,ILS300, EDA300),
#  size<- c(rep("50",length(ILS50)),rep("50 arrunta",length(ILS50)), rep('100',length(EDA100)),rep('100 arrunta',length(EDA100)), rep("200",length(ILS200)),rep("200 arrunta",length(ILS200)),  rep('300',length(EDA300)),rep("300 arrunta",length(ILS300))))

vioplot(EDA50,EDA100,EDA200,EDA300, side = "left", plotCentre = "line", col = 8,names = c("50","100","200","300"))
vioplot(ILS50,ILS100,ILS200,ILS300, side = "right", plotCentre = "line", col = 19,names = c("50","100","200","300"), add = TRUE)
title(xlab = "Size", ylab = "Modularity")
legend("topleft", legend = c("EDA", "ILS"), fill = c(8,19), cex = 1)
