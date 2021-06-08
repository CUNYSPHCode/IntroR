?c
c(1, 2, 3, 4, 5)
1:5
seq(from = 1, to = 5, by = 1)

# logical vector
c(TRUE, FALSE)

# character vector
c("A", "B", "C", "DEF")

?factor
letters
factor(letters, labels = "letter")

factor(x = c("A", "B", "C"), labels = c("a", "b", "c") )

## error: x is not the same length as labels
factor(x = 1:5 , labels = c("a", "b", "c"))

factor(x = 1:5 , labels = "a")

## have a look at more datasets
data()


data("mtcars")
class(mtcars)
?mtcars

factor(
    x = mtcars$am,
    levels = c(0, 1),
    labels = c("automatic", "manual")
)

c(1, 3, NA)
is.na( c(1, 3, NA) )

mtcars

data("ToothGrowth")
ToothGrowth
data("airquality")
length(letters)
length(c("A", "B"))

matrix(data = letters, nrow = 2, ncol = 13)

class(
    matrix(data = letters, nrow = 2, ncol = 13)
)

# Code run in class

# Mixed data types vector
c("a", 1, TRUE, NA)

## mixed data types default to character
c(1, 3, 5, "1")

Mean(1:10)
mean(1:10)

mean( x = c(3, 5, 7, 9) )

mean( x = 5, 3, 7, 9 )


sum(c(3, 5, 7, 9)) / 4



class(1:10)
class(c(TRUE, FALSE))
class("A")

?data.frame

data.frame(
    fruit = c("banana", "orange", "apple"),
    price = c(.50, .25, .80),
    quantity = c(10, 20, 5)
)

?head
head(x = mtcars, n = 3)
tail(x = mtcars, n = 3)

dim(mtcars)

colnames(mtcars)
names(mtcars)

rownames(mtcars)

?sapply
sapply(mtcars, class)
class(mtcars$mpg)

# install a package
install.packages("tibble")
# error: object 'tibble' not found
# install.packages(tibble)

# load the package
library("tibble")
# library(tibble)

tibble(
    fruit = c("banana", "orange", "apple"),
    price = c(.50, .25, .80),
    quantity = c(10, 20, 5)
)

as_tibble(mtcars)

fruit_stand <- data.frame(
    fruit = c("banana", "orange", "apple"),
    price = c(.50, .25, .80),
    quantity = c(10, 20, 5)
)

fruit_stand

## review

## relative path
"~/github/IntroR/Data/"
## absolute
"/Users/mramos/github/IntroR/Data/"

## change your working directory
setwd("~/github/IntroR/Data")
## inspect your working directory
getwd()

## point to a file relative to the working directory
"femaleMiceWeights.csv"

read.csv(file =
    "/Users/mramos/github/IntroR/Data/femaleMiceWeights.csv")

## assign data to object called 'mice'
mice <- read.csv(file =
    "/Users/mramos/github/IntroR/Data/femaleMiceWeights.csv")

?read.csv

## read csv file from URL
read.csv(file = "https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/femaleMiceWeights.csv")
read.csv("https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/femaleMiceWeights.csv")

## Download file from github
?download.file

normalizePath("~")

## Dataset provided by Data Analysis for the Life Sciences by Rafael Irizarry and Michael I. Love
download.file(
    url = "https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/femaleMiceWeights.csv",
    destfile =  "~/femaleMiceWeights.csv"
)

file.exists("/home/rstudio/Downloads/femaleMiceWeights.csv")

file.choose()

download.file("https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/babies.txt",
    destfile = "~/Downloads/babies.txt")

## Example dataset from http://www.ats.ucla.edu/stat/spss/examples/chp/chpspss_dl.htm
download.file("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav",
    destfile = "~/Downloads/p010.sav")
## install.packages("haven")
library(haven)
read_spss("~/Downloads/p010.sav")

library(downloader)
download("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav",
    destfile = "~/Downloads/p010.sav")


## assign an object named mice from a CSV file
mice <- read.csv("/Users/mramos/Downloads/femaleMiceWeights.csv")

## check if file is in that path
file.exists("/Users/mramos/Downloads/femaleMiceWeights.csv")


## relative file path
read.csv("~/Downloads/femaleMiceWeights.csv")

## absolute file path
read.csv("/Users/mramos/Downloads/femaleMiceWeights.csv")

### export
?write.table
write.table(mice, "~/Downloads/micedata.txt")
## check to see if it was written
file.exists("~/Downloads/micedata.txt")

write.table(x = mice, file = "~/Downloads/micedata2.txt")
write.table(file = "~/Downloads/micedata2.txt", x = mice)

## ERROR
## write.table("~/Downloads/micedata2.txt", mice)

# Packages for importing data
library(readr)
library(readxl)
library(haven)
myPackages <- c("readr", "readxl", "haven")
install.packages(myPackages)

install.packages("readr")

read_sav("~/../Downloads/p010.sav")
read_sav("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav")

read_csv("~/Downloads/femaleMiceWeights.csv")
read_sas("http://crn.cancer.gov/resources/ctcodes-procedures.sas7bdat")

download("https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/SampleData.xlsx",
    destfile = "~/Downloads/SampleData.xlsx")

library(readxl)
getwd()
read_excel("SampleData.xlsx", sheet = 2)

sampDat <- read_excel("SampleData.xlsx")

sampDat$OrderDate
class(sampDat)
class(sampDat$OrderDate)

sampDat$Region
class(sampDat$Region)

mice$Diet
class(mice)


?as.Date()

as.Date(sampDat$OrderDate, origin = "1899-12-30")

## Classes

# Vector types

( characterVector <- c("a", "b", "c") )
( numericVector <- c(1, 2, 3) )
( logicalVector <- c(TRUE, FALSE, TRUE) )
( integerVector <- 1L:5L )



# Named vector
( namedNumericVector <- c("a" = 1, "b" = 2, "c" = 3) )

# Logical operations

( truth <- c(TRUE, FALSE, NA) )

!truth

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE
TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

truth | !truth

## logic tables
TRUE | FALSE # returns TRUE
FALSE | FALSE # returns FALSE

## works accross values of the vector
truth & truth

truth && truth

# Factors
( charVec <- c("small", "small", "medium", "large", "large", "large") )
class(charVec)

factor(charVec)

factor(charVec, levels = c("small", "medium"))

factor(charVec,
    levels = c("small", "medium"),
    ordered = TRUE)

(
size <-
    factor(charVec,
        levels = c("small", "medium", "large"),
        ordered = TRUE)
)

data()
data("airquality")
class(airquality)
head(airquality)
View(airquality)

table(airquality$Month)
class(airquality$Month)

month <- airquality$Month

newMonth <-
    factor(month, levels = c(5:9),
    labels = c("May", "June", "July", "August", "September"))
class(newMonth)

contrasts(newMonth)

( sexchar <- rep(c("Male", "Female", "Male"), 3) )
length(sexchar)

( sexfactor <- factor(sexchar, levels = c("Male", "Female")) )

contrasts(sexfactor)

relevel(sexfactor, "Female")

sexfactor2 <- relevel(sexfactor, "Female")

contrasts(sexfactor2)

?data.frame

data.frame(
    var1 = characterVector,
    var2 = logicalVector,
    var3 = numericVector
)

?data
data()
data("mtcars")
data("airquality")

head(mtcars)

library(tibble)
as_tibble(mtcars)

# Example of Iris array
data("iris3")

data("cars")

head(mtcars)
tail(mtcars)
names(mtcars)
colnames(mtcars)
rownames(mtcars)
dim(mtcars)
length(mtcars)

sapply(mtcars, class)

## Subsetting
## using character, numeric or logical vectors
mtcars[ , c("disp", "hp")]
mtcars[, 1:3]
mtcars[, c(2, 4, 1)]

1:3 * 2
# 1:3 * c(2, 2, 2)

length(mtcars)

sub <- c(TRUE, FALSE, TRUE, FALSE , FALSE)

head( mtcars[, sub] )

c(rep(sub, 2), sub[1])


## creating a logical vector from a condition
## mice on the chow diet
class(mice$Diet)

mice$Diet == "chow"

## take only the mice on the chow diet
mice[ mice$Diet == "chow", ]

## subset rows using numeric, logical and character vectors
mtcars[1:5, ]

mtcars[1:5, "mpg", drop = TRUE]
mtcars[1:5, "mpg", drop = FALSE]
mtcars[c(TRUE, FALSE) , ]
mtcars["Honda Civic", ]

## install a package
install.packages("tidyverse")

install.packages("dplyr")
library("dplyr")

?`%>%`

mtcars %>% select(mpg, disp)

select(mtcars, mpg, disp)
## not an object here
## mpg

mtcars[, c("mpg", "disp")]

browseVignettes("dplyr")

## tidyverse
mtcars %>% slice(1:10)

## r base
mtcars[1:10, ]

## combine multiple verbs
mtcars %>% slice(1:10) %>% select(mpg, disp)

matrix(rnorm(20), nrow = 4)
matrix(letters[1:20], nrow = 4)

## warning number of rows not a factor of the vector (20)
matrix(letters[1:20], nrow = 7)


myMat <- matrix(letters[1:20], nrow = 4)
rownames(myMat) <- c("row1", "row2", "row3", "row4")
myMat

# Coercion

# as.character(numericVector)
as.numeric(c("1", "2", "3", "4"))
as.data.frame(myMat)
as_tibble(mtcars)
?as.integer
?as.complex

# Functions

class(mean)

# Lists

list(a = 1:3, b = 4:8, cc = mtcars)
list(a = mean, b = sd, d = var)

# Linear Model function (lm)
?lm

## Use the example from lm()

ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)

class(lm.D9)

attributes(lm.D9)

coefficients(lm.D9)


