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

## Example
data("faithful")

head(faithful, 10)

eruption.lm <- lm(eruptions ~ waiting, data = faithful)

fitted(eruption.lm)
summary(eruption.lm)

## if waiting time to next eruption is 90 min
## what will be the predicted eruption time?
predict(eruption.lm, data.frame(waiting = 90), interval = "predict")

residuals(eruption.lm)

## to obtain coefficients
coef(eruption.lm)
confint(eruption.lm)

## using the broom package
library(broom)

tidy(eruption.lm)
head( augment(eruption.lm) )
glance(eruption.lm)

## Logistic regression using GLM
browseURL("http://www.ats.ucla.edu/stat/r/dae/logit.htm")

mydata <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")

head(mydata)

summary(mydata)

mydata$rank2 <- factor(mydata$rank)
mydata$admit2 <- factor(mydata$admit, levels = c(0,1), labels = c("reject", "admit"))

summary(mydata)

## two-way contigency table
xtabs(~ admit + rank, data = mydata)

# we can also use gmodels
library(gmodels)
CrossTable(mydata$admit2, mydata$rank2, prop.c = FALSE, prop.t = FALSE)

# We fit a logistic regression
mylogit <- glm(admit2 ~ gre + gpa + rank2, data = mydata, family = "binomial")
summary(mylogit)

resultsTab <- tidy(mylogit)
resultsTab$OR <- exp(resultsTab$estimate)
resultsTab

cbind(resultsTab, exp(confint(mylogit)))

library(aod)
wald.test(b = coef(mylogit), Sigma = vcov(mylogit), Terms = 4:6)

## predicted probabilities
predict(mylogit, type = "response")
