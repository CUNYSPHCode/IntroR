# Code run in class

# Mixed data types vector
c("a", 1, TRUE, NA)

c(1, 3, 5, "1")

?plot
var_x <- rnorm(1000)
var_y <- var_x + rnorm(1000)

## from ?plot: plot(x, y, ...)
plot(var_x, var_y, pch = 18)
plot(var_x, var_y, pch = 18, main = "My first Scatterplot")
plot(var_x, var_y, pch = 18, main = "My first Scatterplot", xlim = c(-5, 5))

var1 <- c("blue", "black", "yellow")
var2 <- 1L:5L
var2.5 <- 3.5:6.5
var3 <- c(TRUE, FALSE, TRUE, TRUE)

## Download file from github
## Dataset provided by Data Analysis for the Life Sciences by Rafael Irizarry and Michael I. Love
download.file("https://raw.githubusercontent.com/LiNk-NY/IntroR/master/Data/femaleMiceWeights.csv",
              destfile = "~/Downloads/femaleMiceWeights.csv")

download.file("https://raw.githubusercontent.com/LiNk-NY/IntroR/master/Data/babies.txt",
              destfile = "~/Downloads/babies.txt")

## Example dataset from http://www.ats.ucla.edu/stat/spss/examples/chp/chpspss_dl.htm
download.file("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav",
              destfile = "~/Downloads/p010.sav")

library(downloader)
download("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav",
              destfile = "~/Downloads/p010.sav")

# Packages for importing data
library(readr)
library(readxl)
library(haven)

read_spss("~/Downloads/p010.sav")
read_csv("~/Downloads/femaleMiceWeights.csv")
read_sas("http://crn.cancer.gov/resources/ctcodes-procedures.sas7bdat")

download("https://raw.githubusercontent.com/LiNk-NY/IntroR/master/Data/SampleData.xlsx",
         destfile = "~/Downloads/SampleData.xlsx")

read_excel("~/Downloads/SampleData.xlsx", sheet = 2)
sampDat <- read_excel("~/Downloads/SampleData.xlsx")

sampDat$OrderDate

?as.Date()

as.Date(b$OrderDate, origin = "1899-12-30")

## Classes

# Vector types

( characterVector <- c("a", "b", "c") )
( numericVector <- c(1, 2, 3) )
( logicalVector <- c(TRUE, FALSE, TRUE) )
( integerVector <- 1L:5L )

# Named vector
namedNumericVector <- c("a" = 1, "b" = 2, "c" = 3)

# Factors
charVec <- c("small", "small", "medium", "large")

factor(charVec)

factor(charVec, levels = c("small", "medium"))

factor(charVec, levels = c("small", "medium"), ordered = TRUE)

size <- factor(charVec, levels = c("small", "medium", "large"), ordered = TRUE)

data("airquality")
head(airquality)
table(airquality$Month)

newMonth <- factor(airquality$Month, levels = c(5:9), labels = c("May", "June", "July", "August", "September"))


?data.frame

data.frame(var1 = characterVector, var2 = logicalVector, var3 = numericVector)

?data
data("mtcars")
data("airquality")

# Example of Iris array
data("iris3")

data("cars")
