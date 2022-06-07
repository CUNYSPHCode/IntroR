library(reprex)

reprex(
    x = {
        data('mtcars')
        head(mtcars)
        t.test(mpg ~ cyl, data = mtcars)
    }, 
    venue = "slack"
)


##
table(mtcars$cyl)

reprex({
    y <- 1:4
    mean(y)
}, venue = "slack")

reprex({
    x <- 1
    x + 2
})

str(y)
str(mtcars)

?t.test
args(t.test)
args(read.csv)
read.csv()