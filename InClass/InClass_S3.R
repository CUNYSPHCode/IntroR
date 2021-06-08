## releveling factors

fruit <- c("banana", "strawberry", "kiwi")
fruitfactor <- factor(fruit)
contrasts(fruitfactor)

fruitfactor <- relevel(fruitfactor, ref = "kiwi")
contrasts(fruitfactor)

fruitpref <- rep(fruit, each = 10)
factor(fruitpref)

## NOTES
## Setting the levels of a factor

ranks <- c("low", "medium", "high")
(sampleRanks <- sample(ranks, size = 20, replace = TRUE))

factor(sampleRanks, levels = c("low", "medium", "high"))

(sampRank <- factor(sampleRanks, levels = c("high", "medium", "low")))
## create factor with two levels only
(sampRank <- factor(sampleRanks, levels = c("medium", "low")))
## include levels that were not observed in data
(sampRank <- factor(sampleRanks, levels = c("medium", "low", "very high")))

# collapse categories
factor(sampRank, labels = c("medium", "medium", "low"))

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


randnumb <- rnorm(n = 10, mean = 5, sd = 1)

numfactor <- factor(ceiling(randnumb))
## correctly coerce "numeric" factor to numeric
as.numeric(as.character(numfactor))

## matrices

?matrix
matrix()
matrix(rnorm(20), nrow = 4)
matrix(letters, nrow = 2)

## load mtcars data
data("mtcars")
mtcars

mtcars$cyl

mtcars$cyl == 4

mtcars[ mtcars$cyl == 4 , ]

## what vehicles have 4 cylinders and HP greater than 70?

mtcars$cyl == 4
mtcars$hp > 70

mtcars$cyl == 4 & mtcars$hp > 70

cylhp <- mtcars$cyl == 4 & mtcars$hp > 70

mtcars[cylhp, ]

## only evaluates the first element of each vector
mtcars$cyl == 4 && mtcars$hp > 70

## use with to avoid typing data.frame name
with(mtcars, cyl == 4 & hp > 70)

# bad practice because it pollutes global environment
# attach(mtcars)
cyl <- 1:10

## lists

list()

list(c("row1", "row2"), c("C.1", "C.2", "C.3"))

list(mean, sd, sqrt)

alist <- list(a = 1:3, b = c("a", "b", "c"))

alist[1]
class(alist[1])

alist[[1]]
class(alist[[1]])

alist[[1]][[1]]
class(alist[[1]][[1]])

## data.frames
as.data.frame(alist)

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

table(mtcars$cyl)

## Subset by rows AND columns
mtcars[1:3, c("mpg", "disp")]

head(mtcars[, 1:3])
head(mtcars[1:3])

## tidyverse method
library(dplyr)
mtcars %>%
    slice(1:3) %>%
        select(mpg, disp)

dplyr::slice
dplyr::slice(mtcars, 1:3)

## piping with %>%
mtcars %>%
    select(mpg, disp) %>% head


## Subsets with
## Double bracket notation

mtcars[["mpg"]]
mtcars$mpg
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

## tidyverse verb
mutate(mtcars, highMPG = mpg > 20)

## base R
mtcars$highMPG <- mtcars$mpg > 20
head(mtcars)


## practical example of factors using airquality data
data("airquality")

table(airquality$Month)

(
airquality$Month2 <-
    factor(airquality$Month,
        levels = 5:9,
        labels = c("May", "June", "July",
            "August", "September"))
)

head(airquality)
table(airquality$Month2)

airquality$Month2 == "May"


airquality[ airquality$Month2 == "May", ]

# Sorting data

airquality
(aq <- airquality[1:10, ])

order(aq$Temp)
order(aq$Temp, decreasing = TRUE)

aq[ order(aq$Temp),  ]

## dplyr alternative
## tidyverse

library(dplyr)
arrange(aq, Temp)
arrange(aq, -Temp)

## Checking for duplicated rows (none found)
duplicated(airquality)
duplicated(
    rbind(airquality, airquality[5, ])
)
head(airquality)

unique(airquality$Day)

?complete.cases
dim(airquality)

airquality[1:5, ]
complete.cases(airquality[1:5, ])

airquality[ complete.cases(airquality), ]


## Aggregate data

## formula notation
class(a ~ b)
class(. ~ Month)

aggregate(. ~ Month, data = airquality, mean)

data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
xtabs(Freq ~ Gender + Admit, DF)

## dplyr alternative
library(dplyr)

mean(c(1, 2, NA))
mean(c(1, 2, NA), na.rm = TRUE)

airquality %>%
  group_by(Month2) %>%
  summarise_each(
      list(mean = ~ mean(., na.rm = TRUE)))

airquality %>%
  group_by(Month2) %>%
  summarise_each(
      list(mean = ~ mean(., na.rm = TRUE),
           sd = ~ sd(., na.rm = TRUE))
  )

# finding NA values within a vector
is.na(airquality$Solar.R)

# using logical vector to subset
airquality[!is.na(airquality$Solar.R), ]

## Merging
rownames(mtcars)

shuffle <- sample(nrow(mtcars))

A <- mtcars[shuffle, 5:9]
B <- mtcars[, 1:4]


merge(x = A, y = B, by = "row.names")

# merge(x = A, y = B, by.x = A$ID, by.y = B$ID2)
# merge(x = A, y = B, by = "IDvar")
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
## by the columns
cbind(
letters[1:10],
rev(letters[11:20])
)

cbind.data.frame(
first = letters[1:10],
second = rev(letters[11:20])
)

## stacking
rbind(
    letters[1:10],
    rev(letters[11:20])
)

(aa <-
    rbind.data.frame(
        letters[1:10],
        rev(letters[11:20])
    )
)

## set names in a data.frame
colnames(aa) <- letters[1:10]

## ERROR: differing number of rows
cbind(A, B2)

## Binning
##      install.packages("Hmisc")
library(Hmisc)
?cut2
set.seed(5)
num <- floor(rnorm(20, 20, 5))

range(num)

cut2(num, cuts = 20)
cut2(num, cuts = c(18, 24))

cut2(num, g = 4)

# Put 10 observations in each group
cut2(num, m = 10)

## Transformations

## Adding a variable in base R
mtcars$logDis <- log(mtcars$disp)

head(mtcars)

## with the tidyverse (dplyr)

mtcars %>% mutate(lDis = log(disp))
mtcars %>% transmute(lDis = log(disp))
