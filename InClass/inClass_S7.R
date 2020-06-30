# basic assignment
var <- 1:10

# creating a simple vector
c(1, 2, 3)
c("blue", "red", "green")
c(TRUE, FALSE, FALSE)

# vectorized calculations
var + 2

## >=, <=, ==, !=, >, <
## ?Comparison   /   logical operators
5 == 3
1:4 == 3
5 > 3
TRUE & FALSE
TRUE | FALSE
1:5 > 2
"a" %in% letters
letters %in% "a"
letters %in% c("a", "b", "c")

# list objects in the global environment
ls()

# use mtcars as the data example
data("mtcars")
head(mtcars)
# export
write.csv(mtcars, file = "~/IntroR/Data/mtcars.csv")
write.table(mtcars, file = "~/IntroR/Data/mtcars.tsv", sep = "\t")

save(mtcars, file = "mtcars.rda")

# readr::write_*
readr::write_delim(mtcars, path = "~/github/IntroR/Data/mtcars.tsv", delim = "\t")

## Import

# install.packages("haven") # SAS and SPSS
# install.packages("readr") # fast import of files
# install.packages("readxl") # excel type of spreadsheets

library(haven)
help(package = "haven")

file.exists("S:/github/IntroSAS/datasets/classds.sas7bdat")
classds <- read_sas("~/IntroSAS/datasets/classds.sas7bdat")
normalizePath("~")
getwd()
"../IntroSAS/datasets/classds.sas7bdat"

?type.convert
class(classds$boro_char)
# as.numeric(classds$boro_char)
classds$boro_num <- type.convert(classds$boro_char)
head(classds)

classds2 <- readr::type_convert(classds)

# as.numeric(classds$boro_char)

# working with strings
grep("boro", names(classds), ignore.case = TRUE, value = TRUE)

classds[, grep("boro", names(classds), ignore.case = TRUE, value = FALSE)]

grep("boro", names(classds), ignore.case = TRUE, value = FALSE)
?grep

gsub("boro", "BOROUGH", names(classds), ignore.case = FALSE)

borovars <- grep("^boro_", names(classds), ignore.case = TRUE,
  value = FALSE)

borovalues <- grep("^boro_", names(classds), ignore.case = TRUE,
  value = TRUE)

names(classds)[borovars] <- gsub("boro", "BOROUGH", borovalues)
head(classds)

# summarizing
borotab <- table(classds$BOROUGH)
prop.table(borotab)
round(prop.table(borotab) * 100, 1)

classds$BOROUGH == 99

classds[classds$BOROUGH == 99, "BOROUGH"] <- NA
table(classds$BOROUGH, useNA = "always")

classds$BOROUGH != 99

bronx1 <- classds[classds$BOROUGH == 1, ]
table(bronx1$BOROUGH, useNA = "always")

bronx2 <- classds[classds$BOROUGH == 1 & !is.na(classds$BOROUGH), ]

dim(bronx1)
dim(bronx2)

# subset by the columns
classds[, borovars]

# subset by the columns
classds[, c("gender", "race", "AGE", "ZIP")]

## dplyr::select
dplyr::select(classds, gender, race, AGE, ZIP)

## reshaping
## see lecture 4 examples
?tidyr::pivot_longer
?tidyr::pivot_wider
help(package = "reshape2")
?stats::reshape

## summarize / aggregate
data(mtcars)

## removing factor-type variables
mtcarsnum <- mtcars[, -which(names(mtcars) %in% c("am", "vs"))]
mtcarsnum <- mtcars[, ! names(mtcars) %in% c("am", "vs")]
mtcarsnum <- mtcars[, names(mtcars) != "am" ]

aggregate(. ~ cyl, data = mtcarsnum, mean)
aggregate(mpg ~ cyl, data = mtcarsnum, mean)
aggregate(hp ~ cyl, data = mtcarsnum, mean)

library(dplyr)
mtcarsnum %>% group_by(cyl) %>% summarize(avg_mpg = mean(mpg),
  sd1 = sd(mpg), n = n())

mtcarsnum <- mtcars[, -which(names(mtcars) %in% c("am", "vs", "cyl"))]

## graphing / EDA

psych::pairs.panels(mtcarsnum)

hist(mtcars$mpg)
boxplot(mpg  ~ cyl, data = mtcars)

with(mtcars, plot(drat, qsec))
plot(mtcars$drat, mtcars$qsec)

# import
mtcars <- read.csv("~/IntroR/Data/mtcars.csv", row.names = 1)

# haven package for importing external data (SAS, SPSS)
help(package = "haven")

## exploratory functions
## our main data class is data.frame
head(mtcars)
tail(mtcars)
names(mtcars)
colnames(mtcars)
rownames(mtcars)
dim(mtcars)
class(mtcars)
str(mtcars)

# cleaning operations
mtcars$vs2 <- factor(mtcars$vs, levels = 0:1,
  labels = c("v-shaped", "straight"))
mtcars$am2 <- factor(mtcars$am, levels = 0:1,
  labels = c("automatic", "manual"))

# factor releveling
contrasts(mtcars$am2)

# 0 "automatic" is the reference
# set to "manual"
relevel(mtcars$am2, ref = "manual")

## re-add the new variable to the data
mtcars$am2 <- relevel(mtcars$am2, ref = "manual")

# subsetting
## by the rows
mtcars[mtcars$cyl == 4, ]
subset(mtcars, mtcars$cyl == 4)

## by the columns
head(mtcars[, c("mpg", "cyl")])

# even by class
sapply(mtcars, class) == "numeric"

# a logical vector
mtcars[, sapply(mtcars, class) == "numeric"]

## dropping columns
library(dplyr)
select(mtcars, -vs)

## negative indices
mtcars[, -8]

## base R
names(mtcars)
names(mtcars) == "vs"
! names(mtcars) == "vs"

mtcars[, ! names(mtcars) == "vs" ]

mtcars[ , -which(names(mtcars) == "vs")]
mtcars[ , c(-7, -8, -9) ]

## dplyr::arrange and order functions

# ANALYTIC FUNCTIONS

# t-test example
with(mtcars,
    t.test(mpg[vs == 0], mpg[vs == 1])
)

## example use of with
with(mtcars, vs == 0)

## wrong input
t.test(mtcars$mpg, mtcars$vs)

## formula notation input
t.test(mpg ~ vs, data = mtcars)

## objects with periods ('.')
orange.lm <- lm(circumference ~ age, data = Orange)

## apply over the columns of a dataset, give it just the data.frame as input
## lapply will always return a list
lapply(mtcars, is.numeric)
## sapply is a simplified output whenever possible
sapply(mtcars, is.numeric)

## all the same (FUN.VALUE has to return TRUE to is.logical(X))
vapply(mtcars, is.numeric, FUN.VALUE = logical(1L))
vapply(mtcars, FUN = is.numeric, FUN.VALUE = TRUE)
vapply(mtcars, is.numeric, FUN.VALUE = FALSE)

class(orange.lm)
summary(orange.lm)
?summary.lm

mtcarslm <- lm(qsec ~ drat, data = mtcars)
abline(mtcarslm, col = "blue", lwd = 3)

orange.lm <- lm(circumference ~ age, data = Orange)
with(Orange, plot(age, circumference))
abline(orange.lm)

abline(orange.lm, col = "red", lwd = 3)

# logistic regression
?glm
