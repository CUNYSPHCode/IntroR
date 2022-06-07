datalocation <- "~/gh/IntroR/Data"

myfilelist <- list.files(datalocation, pattern = ".csv", full.names = TRUE)

for (file in myfilelist) {
  currentfile <- read.csv(file, header = TRUE)
  filedata <- c(basename(file), ncol(currentfile))
  print(filedata)
}
