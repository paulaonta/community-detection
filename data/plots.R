setwd("/home/paula/Escritorio/community detection/data")
library(RVCompare)
library(ggplot2)

csv_data <-read.csv("edaVSils_200.csv", sep=',')
ILS<- csv_data$'ILS.arrunta'
EDA<- csv_data$'EDA'

setwd("/home/paula/Escritorio/community detection/data/EDAvsILSORIG_200")
if (length(ILS) != length(EDA))
{
  stop("length(ILS) != length(EDA)")
}

n <- length(ILS)
print(ILS)

# SCATTER
pdf("scatter.pdf")
plot(c(rnorm(length(ILS), mean = 1, sd = 0.2), rnorm(length(EDA), mean = 5, sd = 0.2)),  c(ILS,EDA), xlim = c(0,7), xlab = "ILS                                        EDA")
dev.off()



# HISTOGRAM

nbins = 20

dataHist <- data.frame(
  value=c(ILS,EDA),
  type=c(rep("ILSibridoa", length(ILS)), rep("EDA",  length(EDA)))
)

fig <- ggplot(data=dataHist, aes(x=value, fill=type)) +
  geom_histogram(alpha=0.65, position = 'identity', bins = nbins) +
  scale_fill_manual(values=c("lightgreen", "lightpink")) +
  ggplot2::xlab('fitness') +
  ggplot2::ylab('frekuentzia') +
  ggplot2::theme_minimal() +
  labs(fill="")

ggsave("histogram.pdf", plot=fig,  width = 4, height = 2, device="pdf")



# BOXPLOT
pdf("boxplot.pdf")
boxplot(ILS, EDA, names = c("ILS", "EDA"))
dev.off()



# SIGN TEST (FOR PROBABILITY OF "ILS" > "EDA" or "EDA" > "ILS")

# Measure the number of 'non ties'
n_without_ties <- sum(sign(ILS - EDA) != 0)

# Measure the number of success
n_success <- sum(sign(ILS - EDA) == 1)

binom.test(n_success, n_without_ties, alternative = "two.sided")


# CUMULATIVE DIFFERENCE PLOT

is_minimization <- FALSE
p<-cumulative_difference_plot(ILS, EDA,
                           isMinimizationProblem = is_minimization,
                           labelA = "ILS", labelB = "EDA", ignoreMinimumLengthCheck = TRUE)
ggsave("Diamond.pdf",p, width = 125, height = 125, dpi = 300, units = "mm", device='pdf')

# VIOLIN
data <- data.frame(
  name <- c( rep("ILS",length(ILS)), rep('EDA',length(EDA)) ),
  value <- c(ILS, EDA))

p<-ggplot(data, aes(x=name, y=value, fill=name)) + 
  geom_violin()+stat_summary(fun=median, geom="point", size=2, color="black")
ggsave("violin.png",p, width = 125, height = 125, dpi = 300, units = "mm", device='png')

#DENSITY
df <- data.frame(
  category=factor(rep(c("ILS", "EDA"), each=length(ILS))),
  value=(c(ILS, EDA))
)

# load library
library(ggplot2)

# Basic density plot with custom color
# color property to determine the color of plot
# fill property to determine the color beneath plot
p<-ggplot(df, aes(x=value, color=category, fill=category)) +
  geom_density(alpha=0.3)
ggsave("density.png",p, width = 125, height = 125, dpi = 300, units = "mm", device='png')


#TRIANGLE
bat_ils = sum(ILS)
ILS<-ILS/bat_ils
bat_eda = sum(EDA)
EDA<-EDA/sum(EDA)
test.results <- bSignedRankTest(x=ILS, y=EDA, rope=c(-0.0001, 0.0001))
test.results$posterior.probabilities

p1<-plotSimplex(test.results, plot.density=TRUE, A="ILS",B="EDA", plot.points=TRUE, posterior.label=FALSE, alpha=0.5, point.size=3, font.size = 5)
ggsave("Simplex_Community.png",p1, width = 125, height = 125, dpi = 300, units = "mm", device='png')
colMeans(test.results$posterior)
plot(density(test.results$posterior$Right),xlim=c(0,1), ylim=c(0,40))
lines(density(test.results$posterior$Left))
lines(density(test.results$posterior$Rope))



















