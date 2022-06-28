?duplicated

mtcars2x <- rbind(mtcars, mtcars)

duplicated(mtcars2x)

dim(mtcars2x)
nrow(mtcars2x)

length(duplicated(mtcars2x))

nondup <- mtcars2x[ !duplicated(mtcars2x), ]

dim(nondup)












frutti <- data.frame(
  fruits = c("banana", "pineapple", "tomato")
)

prezzi <- data.frame(
  price = c(0.5, 5, 0.75)
)

dim(frutti)
dim(prezzi)

fruitsA <- cbind(frutti, prezzi)

extrafruits <- data.frame(
  fruits2021 = c("cherry", "grapes", "oranges", "watermelon"),
  price = rep(1, times = 4)
)

extrafruits

# cbind(fruitsA, extrafruits)
rbind(fruitsA, extrafruits)




dim(extrafruits)

rbind(frutti, extrafruits)

?merge

merge(frutti, extrafruits, by = "fruits", all = TRUE)

merge(x = frutti, y = extrafruits,
      by.x = "fruits2020", by.y = "fruits2021", all = TRUE)

merge(x = frutti, y = extrafruits,
      by.x = "fruits2020", by.y = "fruits2021")

merge(extrafruits, frutti, by = "fruits", all = FALSE)

library(dplyr)
library("dplyr")
frutti <- data.frame(
  fruits = c("banana", "pineapple", "tomato")
)
extrafruits <- data.frame(
  fruits = c("cherry", "grapes", "oranges", "watermelon"),
  price = rep(1, times = 4)
)

full_join(frutti, extrafruits, by = "fruits")

?`dplyr-package`



cube <- function(number = 1) {
    number^3
}

cube

cube()

cube(2)

cube(3843)

cube <- function(number) {
  number^3
}

cube()

cube(2)


data("mtcars")

## anonymous functions (unnamed)
aggregate(x = mtcars$mpg, by = list(mtcars$cyl),
        FUN = function(number) {
          c(sum(number), mean(number), sd(number))
        })

aggregate(x = mtcars$mpg,
          by = list(mtcars$cyl),
          FUN = mean)

aggregate(x = mtcars$mpg,
          by = list(mtcars$cyl),
          FUN = sum)

aggregate(x = mtcars$mpg,
          by = list(mtcars$cyl),
          FUN = sd)


### SPEC DATA Example

getwd()

file.exists("Data/specdata/001.csv")
file.choose()

spec1 <- read.csv("Data/specdata/001.csv", header = TRUE)


head(spec1)
dim(spec1)
summary(spec1$sulfate)

folder <- "Data/specdata/"

files <- list.files("Data/specdata", pattern = ".csv", full.names = TRUE)
spec <- read.csv("Data/specdata/001.csv", header = TRUE)
head(spec)
mean(spec$sulfate, na.rm = TRUE)
mean_stat <- "A"

mean_sulfate <- function(folder = "Data/specdata") {

  files <- list.files(folder, pattern = ".csv", full.names = TRUE)
  ## allocate and fill
  # mean_stat <- rep(0, times = length(files))
  mean_stat <- vector(mode = "numeric", length = length(files))

  names(mean_stat) <- basename(files)

  for (i in seq_along(files)) {
    monitor_df <- read.csv(files[i], header = TRUE)
    sulfate_levels <- monitor_df[["sulfate"]]
    mean_stat[i] <- round(mean(sulfate_levels, na.rm = TRUE), digits = 2)
  }

  return(mean_stat)
}

mean_sulfate(folder = "Data/specdata/")

mean_readings <- mean_sulfate("Data/specdata/")

barplot(mean_readings)



## Data Analysis
# install.packages("gmodels")
data("mtcars")

table(mtcars$cyl)
?prop.table
prop.table(table(mtcars$cyl)) * 100

mean(mtcars$mpg)
sd(mtcars$mpg)


# install.packages("gmodels")
library("gmodels")
CrossTable(mtcars$cyl, mtcars$vs)

## combining logical conditions
mtcars[ mtcars$cyl == 4 & mtcars$vs == 0, ]


xtabs(~ cyl + vs, data = mtcars)

table(mtcars$cyl, mtcars$vs)

## Ideally, we don't want to overwrite original data variables
mtcars$vs2 <- factor(mtcars$vs, levels = c(0, 1),
  labels = c("v-shaped", "straight"))
table(mtcars$vs2)

CrossTable(mtcars$cyl, mtcars$vs2)

newTable <- table(mtcars$cyl, mtcars$vs2)

# install.packages("vcd")
library(vcd)

data("HairEyeColor")
mosaic(HairEyeColor, shade = TRUE)


## Chi-square test
chisq.test(newTable)

## Fisher's Exact Test
fisher.test(newTable)

## student's t-test
?t.test

## Student's sleep data
data("sleep")
head(sleep)
plot(extra ~ group , data = sleep)

table(sleep$group)
## Using formula notation
?t.test
# NUMERIC ~ GROUPING
t.test(extra ~ group, data = sleep)

x <- sleep$extra[sleep$group == 1]
y <- sleep$extra[sleep$group == 2]
t.test(x = x, y = y)

## UCLA Linear Regression Examples
browseURL("https://stats.idre.ucla.edu/r/seminars/introduction-to-regression-in-r/")
summary(mtcars)

## Example
data("faithful")

head(faithful, 10)

file.choose
cbind.data.frame

eruption_lm <- lm(eruptions ~ waiting, data = faithful)
# eruptionLm
class(eruption_lm)

plot(formula = eruptions ~ waiting, data= faithful)
plot(x = faithful$waiting, y = faithful$eruptions)

abline(eruption_lm, lwd = 3)

dim(faithful)

head(cbind(
  fitted(eruption_lm), faithful$waiting, predict(eruption_lm)
))

summary(eruption_lm)

## if waiting time to next eruption is 90 min
## what will be the predicted eruption time?
predict(eruption.lm, data.frame(waiting = 90), interval = "predict")

residuals(eruption.lm)

## to obtain coefficients
coef(eruption.lm)
confint(eruption.lm)

## using the broom package
library(broom)

tidy(eruption_lm)
head( augment(eruption_lm) )
glance(eruption_lm)

## Logistic regression using GLM
browseURL("https://stats.idre.ucla.edu/r/dae/logit-regression/")

mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

head(mydata)

summary(mydata)

mydata$rank2 <- factor(mydata$rank)
mydata$admit2 <- factor(mydata$admit, levels = c(0,1),
    labels = c("reject", "admit"))

summary(mydata)

## two-way contigency table
xtabs(~ admit + rank, data = mydata)

# we can also use gmodels
library(gmodels)
CrossTable(mydata$admit2, mydata$rank2, prop.c = FALSE, prop.t = FALSE)

# We fit a logistic regression
mylogit <- glm(admit2 ~ gre + gpa + rank2, data = mydata, family = "binomial")
summary(mylogit)

library(broom)
resultsTab <- tidy(mylogit)
resultsTab$OR <- exp(resultsTab$estimate)
resultsTab

cbind(resultsTab, exp(confint(mylogit)))

library(aod)
wald.test(b = coef(mylogit), Sigma = vcov(mylogit), Terms = 4:6)

## predicted probabilities
predict(mylogit, type = "response")
