# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

head(flights)

table(flights$carrier)

flights %>% group_by(carrier) %>%
  summarize(avg_depdelay = mean(dep_delay, na.rm = TRUE), count = n()) %>%
  left_join(airlines) %>% arrange(avg_depdelay)

data(iris)
install.packages("tidyr")
library(tidyr)
longiris <- gather(tbl_df(iris), key = measure, n, Sepal.Length:Petal.Width) %>%
  separate(measure, c("type", "dimension"))

longiris %>% group_by(Species, type, dimension)
# Graphing

# Generate random numbers
set.seed(123)
rating <- rnorm(200)

head(rating)

rating2 <- rnorm(200, mean = .8)

dat <- data.frame(cond = factor(rep(c("A", "B"), each = 200)),
                  rating = c(rating, rating2))

hist(rating)

hist(rating, breaks = 20, col = "#CCCCFF", freq = FALSE)

boundaries <- seq(-3, 3.6, by = .6)

hist(rating, breaks = boundaries)
text(x = -2, y = 40, labels = "text")

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

## Violin plot (ggplot2)
library(ggplot2)
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
mypar()
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

## saving your output

pdf("myPlot.pdf")
# enter plot code here #
dev.off()

pdf("filename.pdf", width = 5, height = 5)

?svg
?png
