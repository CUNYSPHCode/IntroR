## Data Analysis
# install.packages("gmodels")

library(gmodels)
CrossTable(mtcars$cyl, mtcars$vs)

table(mtcars$cyl, mtcars$vs)

## Ideally, we don't want to overwrite original data variables
mtcars$vs2 <- factor(mtcars$vs, levels = c(0, 1),
                     labels = c("vertical", "straight"))

newTable <- table(mtcars$cyl, mtcars$vs2)

## Chi-square test
chisq.test(newTable)

## Fisher's Exact Test
fisher.test(newTable)

## student's t-test
?t.test

## Student's sleep data
plot(extra ~ group , data = sleep)

## Using formula notation
t.test(extra ~ group, data = sleep)

## UCLA Linear Regression Examples
browseURL("http://scc.stat.ucla.edu/page_attachments/0000/0139/reg_1.pdf")

## Logistic regression using GLM
browseURL("http://www.ats.ucla.edu/stat/r/dae/logit.htm")
