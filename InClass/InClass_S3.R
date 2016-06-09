## NOTES
## Setting the levels of a factor

ranks <- c("low", "medium", "high")
sampleRanks <- sample(ranks, size = 20, replace = TRUE)

factor(sampleRanks, levels = c("low", "medium", "high"))

sampRank <- factor(sampleRanks, levels = c("high", "medium", "low"))

## converting numeric factors to JUST numeric (tricky)

fac <- factor(as.character(10:18))

as.numeric(fac)

as.numeric(as.character(fac))

## Factors are stored as numbers internally
as.numeric(sampRank)


## Vector subsets
vec <- c("a" = 1, "b" = 2, "c" = 3)

vec["a"]

vec[1]

vec[c(TRUE, FALSE, TRUE)]

ranks

ranks["a"]

## Subsets with
## Double bracket notation

mtcars[["mpg"]]

aList <- list(a = 1:3, b = letters[1:3])

aList[[1]]

aList[["b"]]

# Dollar sign accessor
aList$a

aList$b

mtcars$hp

## Using Conditions to subset

mtcars[ mtcars$mpg > 20, ]
airquality[ airquality$Month == "May", ]

# Sorting data

airquality

airquality$Month <- factor(airquality$Month,
                           levels = 5:9,
                           labels = c("May", "June", "July",
                                      "August", "September"))

order(airquality$Temp)

airquality[ order(airquality$Temp), ]
airquality[ order(airquality$Temp, decreasing = TRUE), ]

## dplyr alternative

library(dplyr)

arrange(airquality, Temp)
arrange(airquality, -Temp)

## Checking for duplicated rows (none found)
duplicated(airquality)


unique(airquality$Day)

?complete.cases
complete.cases(airquality)

airquality[complete.cases(airquality) ,]

## Aggregate data

## formula notation

aggregate(. ~ Month, data = airquality, mean)

## dplyr alternative

airquality %>%
  group_by(Month) %>%
  summarise_each(funs(mean(., na.rm = TRUE)))

## Merging

shuffle <- sample(nrow(mtcars))
A <- mtcars[shuffle, 5:9]
B <- mtcars[, 1:4]

merge(x = A, y = B, by = "row.names")

## Note: for dplyr see cheatsheet for joins

## Binding
## Adding rows and columns

rbind()
cbind()

## Binning

library(Hmisc)
?cut2

## Renaming factors
levels(x) <- c("new", "names")

## Transformations 

## Adding a variable
mtcars$logDis <- log(mtcars$disp)
head(mtcars)

## with dplyr

mtcars %>% mutate(lDis = log(disp))
