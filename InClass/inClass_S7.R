data("mtcars")

head(mtcars)

with(mtcars, t.test(mpg[vs == 0], mpg[vs == 1]))

## example use of with
with(mtcars, vs == 0)

## wrong input
t.test(mtcars$mpg, mtcars$vs)

## formula notation input
t.test(mpg ~ vs, data = mtcars)

## objects with periods ('.')
orange.lm <- lm(circumference ~ age, data = Orange)

## apply over the columns of a dataset, give it just the data.frame as input
lapply(mtcars, is.numeric)
vapply(mtcars, is.numeric, FUN.VALUE = logical(1L))
vapply(mtcars, is.numeric, FUN.VALUE = TRUE)

mtcars$vs2 <- factor(mtcars$vs, levels = 0:1,
  labels = c("v-shaped", "straight"))

## dropping columns
select(mtcars, -vs)
mtcars[, -which(names(mtcars) == "vs")]


??order

?order

help(package = "nycflights13")

class(orange.lm)
summary(orange.lm)
?summary.lm

## Import 

install.packages("haven")
install.packages("readr")
install.packages("readxl")

library(haven)
help(package = "haven")

classds <- read_sas("S:/github/IntroSAS/datasets/classds.sas7bdat")

head(classds)
tail(classds)
dim(classds)

dimnames(classds)
rownames(classds)
colnames(classds)
names(classds)

?type.convert
class(classds$boro_char)

classds$boro_num <- type.convert(classds$boro_char)
head(classds)

classds2 <- readr::type_convert(classds)

# working with strings
grep("boro", names(classds), ignore.case = TRUE, value = TRUE)
grep("boro", names(classds), ignore.case = TRUE, value = FALSE)
?grep

gsub("boro", "BOROUGH", names(classds), ignore.case = TRUE)

borovars <- grep("^boro_", names(classds), ignore.case = TRUE,
  value = FALSE)

borovalues <- grep("^boro_", names(classds), ignore.case = TRUE,
  value = TRUE)

names(classds)[borovars] <- gsub("boro", "BOROUGH", borovalues)
head(classds)

table(classds$BOROUGH)

classds[classds$BOROUGH == 99, "BOROUGH"] <- NA
table(classds$BOROUGH, useNA = "always")

classds$BOROUGH != 99

bronx1 <- classds[classds$BOROUGH == 1, ]
bronx2 <- classds[classds$BOROUGH == 1 & !is.na(classds$BOROUGH), ]

!TRUE
!FALSE

dim(bronx1)
dim(bronx2)

# subset by the columns
classds[, borovars]

# subset by the columns
classds[, c("gender", "race", "AGE", "ZIP")]
## dplyr::select
select(classds, gender, race, AGE, ZIP)

## reshaping
library(readr)
(pew <- read_csv("Data/pew.csv"))

library(tidyr)
pew %>% gather(income, n, -religion) %>% head
?tidyr::spread

?stats::reshape
library(reshape2)

summary(Indometh)
wide <- reshape(Indometh, v.names = "conc", idvar = "Subject",
                timevar = "time", direction = "wide")
wide
table(wide$Subject)

## summarize / aggregate
data(mtcars)
mtcarsnum <- mtcars[, -which(names(mtcars) == c("am", "vs"))]
aggregate(. ~ cyl, data = mtcarsnum, mean)

aggregate(mpg ~ cyl, data = mtcarsnum, mean)
aggregate(hp ~ cyl, data = mtcarsnum, mean)


mtcarsnum %>% group_by(cyl) %>% summarize(avg_mpg = mean(mpg),
  sd1 = sd(mpg), n = n())

mtcarsnum <-
  mtcars[, -which(names(mtcars) %in% c("am", "vs", "cyl"))]
psych::pairs.panels(mtcarsnum)

hist(mtcars$mpg)
boxplot(mpg  ~ cyl, data = mtcars)

with(mtcars, plot(drat, qsec))
plot(mtcars$drat, mtcars$qsec)

mtcarslm <- lm(qsec ~ drat, data = mtcars)
abline(mtcarslm, col = "blue", lwd = 3)

