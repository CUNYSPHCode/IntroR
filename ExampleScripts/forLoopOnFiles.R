datalocation <- "S:/github/IntroR/Data"

myfilelist <- list.files(datalocation, pattern = ".csv", full.names = TRUE)

for (i in myfilelist) {
  currentfile <- read.csv(i, header = TRUE)
  filedata <- c(basename(i), ncol(currentfile))
  print(filedata)
}
