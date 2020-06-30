babies <- read.table("S:/github/IntroR/Data/babies.txt", header = TRUE)

head(babies)

table(babies$smoke)

babies$smoke == 9

babies[babies$smoke == 9, ]

babies[babies$smoke == 9, "smoke"]

babies[babies$smoke == 9, "smoke"] <- NA

any( is.na(babies$smoke) )

babies[is.na(babies$smoke), ]

babies[is.na(babies$smoke), "smoke"]
