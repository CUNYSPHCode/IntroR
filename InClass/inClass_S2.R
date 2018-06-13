# Code run in class

# Mixed data types vector
c("a", 1, TRUE, NA)

## mixed data types default to character
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
download.file("https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/femaleMiceWeights.csv",
    destfile = "~/Downloads/femaleMiceWeights.csv")

download.file("https://raw.githubusercontent.com/CUNYSPHCode/IntroR/master/Data/babies.txt",
    destfile = "~/Downloads/babies.txt")

## Example dataset from http://www.ats.ucla.edu/stat/spss/examples/chp/chpspss_dl.htm
download("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav",
    destfile = "~/../Downloads/p010.sav")

library(downloader)
download("http://www.ats.ucla.edu/stat/spss/examples/chp/p010.sav",
    destfile = "~/../Downloads/p010.sav")


## assign an object named mice from a CSV file 
mice <- read.csv("C:/Users/mramos/Downloads/IntroR/IntroR/Data/femaleMiceWeights.csv")

## check if file is in that path
file.exists("C:/Users/mramos/Downloads/IntroR/IntroR/Data/femaleMiceWeights.csv")


## relative file path
read.csv("~/../Downloads/femaleMiceWeights.csv")

## absolute file path
read.csv("C:/Users/mramos/Downloads/femaleMiceWeights.csv")

### export
?write.table
write.table(mice, "~/../Downloads/micedata.txt")

write.table(x = mice, file = "~/../Downloads/micedata2.txt")
write.table(file = "~/../Downloads/micedata2.txt", x = mice)

## ERROR
## write.table("~/../Downloads/micedata2.txt", mice)

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

read_excel("Data/SampleData.xlsx", sheet = 2)

sampDat <- read_excel("Data/SampleData.xlsx")

sampDat$OrderDate

?as.Date()

as.Date(sampDat$OrderDate, origin = "1899-12-30")

## Classes

# Vector types

( characterVector <- c("a", "b", "c") )
( numericVector <- c(1, 2, 3) )
( logicalVector <- c(TRUE, FALSE, TRUE) )
( integerVector <- 1L:5L )



# Named vector
namedNumericVector <- c("a" = 1, "b" = 2, "c" = 3)

# Logical operations

truth <- c(TRUE, FALSE, NA)

!truth

truth | !truth

## logic tables
TRUE | FALSE # returns TRUE
FALSE | FALSE # returns FALSE

## works accross values of the vector
truth & truth

truth && truth

# Factors
charVec <- c("small", "small", "medium", "large", "large", "large")

factor(charVec)

factor(charVec, levels = c("small", "medium"))

factor(charVec, levels = c("small", "medium"), ordered = TRUE)

size <- factor(charVec, levels = c("small", "medium", "large"), ordered = TRUE)

data()
data("airquality")
class(airquality)
head(airquality)
View(airquality)

table(airquality$Month)

newMonth <- factor(airquality$Month, levels = c(5:9),
    labels = c("May", "June", "July", "August", "September"))

contrasts(newMonth)

sexchar <- rep(c("Male", "Female", "Male"), 3)

sexfactor <- factor(sexchar, levels = c("Male", "Female"))

contrasts(sexfactor)

contrasts(relevel(sexfactor, "Female"))

sexfactor2 <- relevel(sexfactor, "Female")

?data.frame

data.frame(var1 = characterVector, var2 = logicalVector, var3 = numericVector)

?data
data()
data("mtcars")
data("airquality")

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
mtcars[, c(TRUE, FALSE, TRUE, FALSE , FALSE)]

## creating a logical vector from a condition
## mice on the chow diet
mice$Diet == "chow"

## take only the mice on the chow diet
mice[ mice$Diet == "chow", ]

## subset rows using numeric, logical and character vectors
mtcars[1:5, ]
mtcars[1:5, c("mpg"), drop = FALSE]
mtcars[c(TRUE, FALSE) , ]
mtcars["Honda Civic" ,]

## install a package
install.packages("dplyr")
library("dplyr")

?`%>%`

mtcars %>% select(mpg, disp)
select(mtcars, mpg, disp)

mtcars[, c("mpg", "disp")]

browseVignettes("dplyr")

mtcars %>% slice(1:10)
mtcars[1:10, ]

## combine multiple verbs
mtcars %>% slice(1:10) %>% select(mpg, disp)

matrix(rnorm(20), nrow = 4)
matrix(letters[1:20], nrow = 4)

myMat <- matrix(letters[1:20], nrow = 4)
rownames(myMat) <- c("row1", "row2", "row3", "row4")
myMat

# Coercion

as.character(numericVector)
as.numeric(c("1", "2", "3", "4"))
as.data.frame(myMat)
?as.integer
?as.complex

# Functions

class(mean)

# Lists

list(a = 1:3, b = 4:8, cc = mtcars)
list(a = mean, b = sd, d = var)

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


