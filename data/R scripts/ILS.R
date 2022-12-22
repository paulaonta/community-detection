setwd("/home/paula/Escritorio/community detection/data")
library(RVCompare)
library(ggplot2)

csv_data_50 <-read.csv("datuak_ils_originala_hibridoa50.csv", sep=',')
ILS50<- csv_data_50$'ILS'
ILS.arrunta50<- csv_data_50$'ILS.originala'
balioa<-csv_data_50$num

csv_data_100 <-read.csv("datuak_ils_originala_hibridoa100.csv", sep=',')
ILS100<- csv_data_100$'ILS'
ILS.arrunta100<- csv_data_100$'ILS.originala'

csv_data_200 <-read.csv("datuak_ils_originala_hibridoa200.csv", sep=',')
ILS200<- csv_data_200$'ILS'
ILS.arrunta200<- csv_data_200$'ILS.originala'

csv_data_300 <-read.csv("edaVSils_300.csv", sep=';')
ILS300<- csv_data_300$'ILS'
ILS.arrunta300<- csv_data_300$'ILS.arrunta'


setwd("/home/paula/Escritorio/community detection/data/ILS")
if (length(ILS50) != length(ILS.arrunta50))
{
  stop("length(ILS50) != length(ILS.arrunta50)")
}

if (length(ILS100) != length(ILS.arrunta100))
{
  stop("length(ILS100) != length(ILS.arrunta100)")
}

if (length(ILS200) != length(ILS.arrunta200))
{
  stop("length(ILS200) != length(ILS.arrunta200)")
}

if (length(ILS300) != length(ILS.arrunta300))
{
  stop("length(ILS300) != length(ILS.arrunta300)")
}
#data <- data.frame(
 # name <- c( rep("ILS",length(ILS50)), rep('ILS.arrunta',length(ILS.arrunta50)), rep("ILS",length(ILS100)), rep('ILS.arrunta',length(ILS.arrunta100)), rep("ILS",length(ILS200)), rep('ILS.arrunta',length(ILS.arrunta200)),rep("ILS",length(ILS300)), rep('ILS.arrunta',length(ILS.arrunta300))),
#  value <- c(ILS50, ILS.arrunta50,ILS100, ILS.arrunta100,ILS200, ILS.arrunta200,ILS300, ILS.arrunta300),
 # size<- c(rep("50",2*length(ILS50)), rep('100',2*length(ILS.arrunta100)), rep("200",2*length(ILS200)), rep('300',2*length(ILS.arrunta300))))
data<-data.frame(
  name<-c(balioa,balioa,balioa,balioa,balioa,balioa,balioa,balioa),
  value<-c(ILS50, ILS.arrunta50,ILS100, ILS.arrunta100,ILS200, ILS.arrunta200,ILS300, ILS.arrunta300),
  size<- c(rep("50",length(ILS50)),rep("50 arrunta",length(ILS50)), rep('100',length(ILS.arrunta100)),rep('100 arrunta',length(ILS.arrunta100)), rep("200",length(ILS200)),rep("200 arrunta",length(ILS200)),  rep('300',length(ILS.arrunta300)),rep("300 arrunta",length(ILS300))))

ggplot(data,aes(y=value, x=name,group=size,color=size)) + 
 geom_line()
ggsave("violin.png",p, width = 125, height = 125, dpi = 300, units = "mm", device='png')


is_minimization <- FALSE
p<-cumulative_difference_plot(ILS50, ILS.arrunta50,
                              isMinimizationProblem = is_minimization,
                              labelA = "ILS", labelB = "ILS.arrunta", ignoreMinimumLengthCheck = TRUE)
ggsave("Diamond50.pdf",p, width = 125, height = 125, dpi = 300, units = "mm", device='pdf')

is_minimization <- FALSE
p<-cumulative_difference_plot(ILS100, ILS.arrunta100,
                           isMinimizationProblem = is_minimization,
                           labelA = "ILS", labelB = "ILS.arrunta", ignoreMinimumLengthCheck = TRUE)
ggsave("Diamond100.pdf",p, width = 125, height = 125, dpi = 300, units = "mm", device='pdf')

is_minimization <- FALSE
p<-cumulative_difference_plot(ILS200, ILS.arrunta200,
                           isMinimizationProblem = is_minimization,
                           labelA = "ILS", labelB = "ILS.arrunta", ignoreMinimumLengthCheck = TRUE)
ggsave("Diamond200.pdf",p, width = 125, height = 125, dpi = 300, units = "mm", device='pdf')

is_minimization <- FALSE
p<-cumulative_difference_plot(ILS300, ILS.arrunta300,
                           isMinimizationProblem = is_minimization,
                           labelA = "ILS", labelB = "ILS.arrunta", ignoreMinimumLengthCheck = TRUE)
ggsave("Diamond300.pdf",p, width = 125, height = 125, dpi = 300, units = "mm", device='pdf')
