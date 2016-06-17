## Graph examples
# ovView

## Odds ratio plots

## Involved Example
library(rafalib)

results <- data.frame(OR = c(1.05, 2.04, 9.81, 1.91, 3.54, 0.28),
           lowerCI = c(0.43, 0.74, 3.72, 0.56, 1.24, 0.08),
           higherCI = c(2.55, 5.62, 25.87, 6.55, 10.14, 1.00),
           country = c("Allemange", "France", "Italie", "Royaume-Uni",
                       "Suisse", "Belgique"))
results

rafalib::mypar()

plot(x = c(1, 10), y = c(1, 6), ylab = "", ylim = c(0, 6),
     type = "n", axes = FALSE, xlab = "Odds Ratio", log = "x",
     xlim = c(0.01, 15))

axis(side = 1, at = c(0.01, 0.5, 1, 2, 5, 10))

points(x= results[, "OR"], y = 1:6, pch = 18)
segments(x0 = results[["lowerCI"]], x1 = results[["higherCI"]],
         y0 = 1:6, y1 = 1:6)
segments(x0 = 18, x1 = 20, y0 = 3.1, y1 = 3)
segments(x0 = 18, x1 = 20, y0 = 2.9, y1 = 3)
text(x = .02, y = 1:6, labels = results[["country"]], font = 2)
abline(v = 1, lty = 2)
title(main = "Odds Ratios for CVD Risk by Country")

## From website
## https://gist.github.com/seanjtaylor/
## b7441ee2071ae37c4306b9af6ef8e365#file-nfl_officials_analysis-r
## Reading practice

## Regression with penalties ~ team + all officials involved
m <- lm(wide$pens ~ wide$home + team.mat + officials.mat)

broom::tidy(m) %>%
  mutate(team = str_match(term, 'team\\.matteam(.*):factor\\(seas\\)(.*)')[,2],
         seas = str_match(term, 'team\\.matteam(.*):factor\\(seas\\)(.*)')[,3]) %>%
  filter(!is.na(team), seas == 2015) %>%
  ggplot(aes(x = reorder(team, estimate), y = estimate,
             ymin = estimate - 1.96 * std.error,
             ymax = estimate + 1.96 * std.error)) +
  geom_pointrange() +
  coord_flip() +
  ylab('Official-Adjusted Net Penalties per Game') +
  xlab('Team') +
  geom_hline(yintercept = 0.0, linetype = 'dashed') +
  theme_bw()

## ggplot version
library(ggplot2)
library(dplyr)

results %>% ggplot(aes(x = reorder(country, OR), y = OR,
                       ymin = lowerCI,
                       ymax = higherCI)) +
    geom_pointrange(shape = 18) + ylab("Odds Ratio") +
    scale_y_log10() + coord_flip() +
    xlab("Country") + geom_hline(yintercept = 1, linetype = "dashed") +
    theme_bw()

## Repetitive code
## Example from Advanced R by Hadley Wickham
set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, rep = TRUE)))

## Not working but rewritten for reability
df2 <- c(1:10, -99) %>% sample(6, replace = TRUE) %>% replicate(6, .) %>% data.frame
names(df) <- letters[1:6]

## look at df
df

# What you don't want to do but will start out doing...
# repetitive code
df$a[df$a == -99] <- NA
df$b[df$b == -99] <- NA
df$c[df$c == -99] <- NA
df$d[df$d == -99] <- NA
df$e[df$e == -99] <- NA
df$f[df$g == -99] <- NA

# We can try a loop..
# Regenerate the data
set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, rep = TRUE)))
# See it
df
for(i in seq_along(df)) {
    df[, i][ df[,i] == -99 ] <- NA
}
df

## We create a function
fix_missing <- function(a_vector) {
    a_vector[a_vector ==  -99] <- NA
    return(a_vector)
}

# Make sure you have -99 in df
df
names(df) <- letters[1:6]
fix_missing(df$d)

## looking at examples and understanding them

## If you're using windows, drives will have letters
mydatalocation <- "E:/data/specdata/"

list.files(mydatalocation, pattern = ".csv", full.names = TRUE)

complete <- function(directory, id=1:332){
    monitorFile <- list.files(directory, pattern = ".csv", full.names=TRUE)
    nobs <- c()
    for (i in id) {
        nobs <- c(nobs, sum(complete.cases(read.csv(monitorFile[i]))))
    }
    data.frame(filename = basename(monitorFile[id]), nobs=nobs)
}

complete(mydatalocation, id = 1:3)
complete(mydatalocation)

## Functionals 

## *apply family

## lapply
datasets <- list(mtcars, iris, cars)

dim(datasets[[1]])
dim(datasets[[2]])
dim(datasets[[3]])

lapply(datasets, dim)

tapply(X = mtcars$mpg, INDEX = mtcars$cyl, FUN = mean)
tapply(X = mtcars$mpg, INDEX = mtcars$cyl, FUN = sd)
tapply(X = mtcars$mpg, INDEX = mtcars$cyl, FUN = var)

myfun <- list(meanFUN = function(x) {mean(x, na.rm = TRUE)} ,  sdFUN = sd, varFUN = var)
names(myfun)

lapply(myfun, function(f) f(mtcars$mpg) )

lapply(mtcars, mean)
apply(X = mtcars, MARGIN = 2, FUN = mean)
sapply(mtcars, class)

apply(mtcars, 1, mean)
apply(mtcars, 1, max)

apply(matrix(rnorm(100), nrow = 10), 2, sd)

apply(matrix(rnorm(100), nrow = 10), 2, sum)


vapply(X = list(mtcars, iris, cars),FUN = is.data.frame, FUN.VALUE = logical(1L))
sapply(X = list(mtcars, iris, cars), FUN = is.data.frame)

vapply(X = list(mtcars, iris, cars),FUN = is.data.frame, FUN.VALUE = character(1L))