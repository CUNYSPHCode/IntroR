## generating data.frame

data.frame()
data.frame(column1 = 1:3, column2 = c("a", "b", "c"))

## ERROR
data.frame(column1 = 1:3, column2 = c("a", "b", "c", "d"))

options("stringsAsFactors")

data.frame(column1 = 1:3, column2 = c("a", "b", "c"),
    stringsAsFactors = FALSE)

# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

head(flights)
dim(flights)
table(flights$carrier)

unique(flights$carrier)
length(unique(flights$carrier))

head(airlines)

summary_flights <-
  flights %>%
  group_by(carrier) %>%
  summarize(
    avg_depdelay = mean(dep_delay, na.rm = TRUE),
    count = n()
  ) %>%
  left_join(airlines) %>%
  arrange(avg_depdelay)

left_join(flights, airlines)

flights$CarrierName <-
  airlines[ match(flights$carrier, airlines$carrier), "name"][[1]]

flights


length(flights$carrier)

flights %>% group_by(carrier)

group_by(flights, carrier)


library(tidycensus)


data("iris")
install.packages("tidyr")
library(tidyr)
longiris <-
    iris %>%
    gather(key = measure, n, Sepal.Length:Petal.Width) %>%
  separate(measure, c("type", "dimension"))

longiris %>% group_by(Species, type, dimension)
# Graphing

# from tidyr
relig_income %>%
  gather(income, n, -religion) %>%
  group_by(income) %>%
  summarize(totals = sum(n)) %>%
  arrange(totals)

# Generate random numbers
rating <- rnorm(200)

head(rating)

rating2 <- rnorm(200, mean = .8)

dat <- data.frame(
    cond = factor(rep(c("A", "B"), each = 200)),
    rating = c(rating, rating2))

hist(rating)

hist(rating, breaks = 20, col = "#CCCCFF", freq = FALSE)

## clear graphics output
dev.off()

## Scatterplots
set.seed(777)
newData <- data.frame(a = 1:20 + rnorm(20, sd=3),
                  b = 1:20 + rnorm(20,sd=3),
                  cc = 1:20 + rnorm(20,sd=3))

head(newData)

plot(newData$a, newData$b)

plot(b ~ a, data = newData)

fitLine <- lm(b ~ a, data = newData)

abline(fitLine, col = "blue", lwd = 3)

## lowess smoothing

plot(cars, main = "lowess(cars)")
lines(lowess(cars), col = 2, lwd = 2)
lines(lowess(cars, f = .2), col = 3, lwd = 2)
legend(5, 120, c(paste("f = ", c("2/3", ".2"))), lty = 1, col = 2:3)

polygon(x = c(5, 10, 10, 5), y = c(60, 60, 80, 80))
segments(x0 = 5, x1 = 15, y0 = 40, y1 = 100)

?polygon
?segments

## Scatterplot Matrix

plot(newData[, 1:3])

library(psych)

pairs.panels(newData)

psych::pairs.panels(newData)

library(car)
scatterplotMatrix(newData, diagonal = "histogram", smooth = TRUE)

## Boxplot

boxplot(mpg ~ factor(cyl), data = mtcars,
        main = "myboxplot", xlab = "cylinders",
        ylab = "Miles per Gallon (mpg)")
text(x = 2, y = 25, "this is text", cex = 3)

boxplot(mpg ~ factor(cyl), data = mtcars, axes = FALSE)
axis(side = 1, at = 1:3, labels = letters[1:3])
axis(side = 2, at = 20:30)
title(main = "Custom Plot 1")
abline(h = 22)

## boxplot with dots
library(ggplot2)
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

p <- ggplot(ToothGrowth, aes(x=dose, y=len)) +
    geom_boxplot()
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

## Violin plot (ggplot2)
qplot(factor(cyl), mpg, data = mtcars, geom = "violin")

## Q-Q plots

set.seed(183)
x <- rnorm(80, mean = 50, sd = 5)
z <- runif(80)

## plot with normal dist
qqnorm(x)
qqline(x)

## plot with transformed normal
qqnorm(x^4)
qqline(x^4)

## plot with uniform dist
qqnorm(z)
qqline(z)

## Add multiple plots in one display
par(mfrow = c(2,2))

## Rerun QQ plots above ##

## Fun with `rafalib`
library(rafalib)

rafalib::mypar()

mypar()

par(mfrow = c(4, 1))

plot(rnorm(1000), rnorm(1000))
plot(rnorm(1000), rnorm(1000))
plot(rnorm(1000), rnorm(1000))
plot(rnorm(1000), rnorm(1000))

?mypar

plot(cars)

dev.off()

## gglot2

library(reshape2)
head(tips)

sp <- ggplot(tips, aes(x = total_bill, y = tip/total_bill)) + geom_point(shape = 2)
sp
pp <- sp + theme_bw()

pp + facet_grid(sex ~ .)
pp + facet_grid(. ~ sex)

pp + facet_grid(day ~ sex)

pp + facet_wrap(~ day, ncol = 2)

## visualizing categorical data
## install.packages("vcd")
library(vcd)
mosaic(HairEyeColor, shade = TRUE, legend = TRUE)

## saving your output
## use a sandwhich

pdf("myPlot.pdf")

# enter plot code here #
mosaic(HairEyeColor, shade = TRUE, legend = TRUE)

dev.off()

pdf("filename.pdf", width = 5, height = 5)

?svg
?png
