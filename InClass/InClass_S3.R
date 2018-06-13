## recap

fruit <- c("banana", "strawberry", "kiwi")
fruitfactor <- factor(fruit)
contrasts(fruitfactor)

fruitfactor <- relevel(fruitfactor, ref = "kiwi")
contrasts(fruitfactor)

## matrices

?matrix
matrix()
matrix(rnorm(20), nrow = 4)
matrix(letters, nrow = 2)

## lists 

list()

list(c("row1", "row2"), c("C.1", "C.2", "C.3"))

list(mean, sd, sqrt)

alist <- list(a = 1:3, b = c("a", "b", "c"))

## data.frames
as.data.frame(alist)

## NOTES
## Setting the levels of a factor

ranks <- c("low", "medium", "high")
sampleRanks <- sample(ranks, size = 20, replace = TRUE)

factor(sampleRanks, levels = c("low", "medium", "high"))

sampRank <- factor(sampleRanks, levels = c("high", "medium", "low"))

levels(sampRank) <- c("a", "b", "c")

sampRank

## Renaming factors
levels(x) <- c("new", "names")

## converting numeric factors to JUST numeric (tricky)

fac <- factor(as.character(10:18))

as.numeric(fac)

as.numeric(as.character(fac))

## Factors are stored as numbers internally
as.numeric(sampRank)


## Vector subsets
vec <- c("a" = 1, "b" = 2, "c" = 3)
vec
vec["a"]

vec[1]

vec[c(TRUE, FALSE, FALSE)]

ranks

ranks["a"]

## Use of dollar sign operator $
data("mtcars")
mtcars$mpg
mtcars[, "mpg"]

mtcars[, c("mpg", "disp")]
mtcars[, c(1, 3)]

table(mtcars$am)

## Subset by rows and columns
mtcars[1:3, c("mpg", "disp")]
mtcars %>% slice(1:3) %>% select(mpg, disp)


head(mtcars[, 1:3])
head(mtcars[1:3])


## Subsets with
## Double bracket notation

mtcars[["mpg"]]
# Error: mtcars[[c("mpg", "disp")]]

aList <- list(a = 1:3, b = letters[1:3])

aList[[1]]

aList[["b"]]

# Dollar sign accessor
aList$a

aList$b

mtcars$hp

## Using Conditions to subset
mtcars$mpg
mtcars$mpg > 20

mtcars[mtcars$mpg > 20, ]
mtcars[mtcars[["mpg"]] > 20, ]


mtcars[mtcars$mpg > 20, "mpg", drop = FALSE]

sum(mtcars$mpg > 20)

mtcars$highMPG <- mtcars$mpg > 20

head(mtcars)

mutate(mtcars, highMPG = mpg > 20)

mtcars

mtcars[ mtcars$mpg > 20, ]

data("airquality")

table(airquality$Month)

airquality$Month2 <- factor(airquality$Month,
  levels = 5:9, labels = c("May", "June", "July",
  "August", "September"))
head(airquality)
table(airquality$Month2)

airquality$Month2 == "May"


airquality[ airquality$Month2 == "May", ]

# Sorting data

airquality
aq <- airquality[1:10, ]

aq[ order(aq$Temp),  ]

order(airquality$Temp)

## tidyverse arrange
arrange(aq, Temp)

airquality[ order(airquality$Temp), ]

airquality[ order(airquality$Temp, decreasing = TRUE), ]

## dplyr alternative

library(dplyr)

arrange(airquality, Temp)
arrange(airquality, -Temp)

## Checking for duplicated rows (none found)
duplicated(airquality)
head(airquality)

unique(airquality$Day)

?complete.cases
complete.cases(airquality)

airquality[ complete.cases(airquality), ]


## Aggregate data

## formula notation
class(a ~ b)

aggregate(. ~ Month, data = airquality, mean)

## dplyr alternative
library(dplyr)

mean(c(1, 2, NA))
mean(c(1, 2, NA), na.rm = TRUE)

airquality %>%
  group_by(Month2) %>%
  summarise_each(funs(mean(., na.rm = TRUE)))

## Merging

shuffle <- sample(nrow(mtcars))

A <- mtcars[shuffle, 5:9]
B <- mtcars[, 1:4]

merge(x = A, y = B, by = "row.names")
merge(x = A, y = B, by.x = A$ID, by.y = B$ID2)
?merge


B <- mtcars[1:20, 1:4]

merge(A, B, by = "row.names")
merge(B, A, by = "row.names")

A$ID1 <- shuffle
B$ID2 <- seq_len(nrow(B))
B2 <- B[1:20, ]

merge(A, B2, by.x = "ID1", by.y = "ID2")

## Note: for dplyr see cheatsheet for joins

## Binding
## Adding rows and columns
cbind(
letters[1:10],
rev(letters[11:20])
)

rbind(
letters[1:10],
rev(letters[11:20])
)

rbind()
cbind()
cbind(A, B2)

## Binning

library(Hmisc)
?cut2
set.seed(3)
num <- floor(rnorm(20, 20, 5))
range(num)

cut2(num, cuts = 20)
size <- cut2(num, cuts = c(18, 24))

cut2(num, g = 4)

# Put 10 observations in each group
cut2(num, m = 10)

## Transformations 

## Adding a variable
mtcars$logDis <- log(mtcars$disp)
head(mtcars)

## with dplyr

mtcars %>% mutate(lDis = log(disp))
mtcars %>% transmute(lDis = log(disp))
