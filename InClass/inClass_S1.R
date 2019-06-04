# Code to run in class

Help()
help()

# Source code
help

h el p ()
help    (   topic   =    "mean")

1 + 3

## Assignment with arrow "<-"
a <- c(1, 3, 4, 6)
b <- c("marcel", "ramos")

## Assignment with equals sign "="
a = c(1, 3, 4, 7)

## Operation works on each value in `a`
a + 1

object.size(a)

?mean
help("mean")

?reserved

?rnorm()
b <- rnorm(20)

mean(b)

# Arguments
?cor
3 < 5

cc <- rnorm(20)

# Run functions with explicit arguments
cor(x = b, y = cc)

# Run cor function without explicit arguments
cor(b, cc)

# Value section
?mean

# File paths (what are they?)
getwd()

## relative
"~/github"

## absolute
"/Users/mramos/github"

## Change your current working directory
## On Windows
setwd("C:/Users/mramos/Documents/IntroR/IntroR/Data")
## On Mac
setwd("/Users/mramos/github/IntroR/Data")

## list all the contents in a directory
list.files("~/github/IntroR/IntroR/Data/")

## shortcut to home directory '~'
normalizePath("~")

## read a text file from your current working directory
babies <- read.table("babies.txt")
head(babies)

## use headers = TRUE
babies <- read.table("babies.txt", header = TRUE)

head(babies)

# install.packages()
# library()
