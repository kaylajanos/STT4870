### Secure file from Dropbox Public folder
wrestP <- repmis::source_data("https://dl.dropboxusercontent.com/u/134274843/data/HSWRESTLER.csv")
### Secure file from non-public Dropbox folder 
# https://www.dropbox.com/s/36r9k12fdyzc9zp/HSWRESTLER.csv
wrestNP <- repmis::source_DropboxData("HSWRESTLER.CSV", "36r9k12fdyzc9zp")
####
### Read the same file from Github now with source_data()
### https://raw2.github.com/alanarnholt/Data/master/HSWRESTLER.csv
wrestG <- repmis::source_data("https://raw2.github.com/alanarnholt/Data/master/HSWRESTLER.csv")
### Use RCurl package to read data from Github now
###
site <- "https://raw2.github.com/alanarnholt/Data/master/HSWRESTLER.csv"
DataUrl <- RCurl::getURL(site, ssl.verifypeer = FALSE)
wrestMMS <- read.table(textConnection(DataUrl), sep = ",", header = TRUE)
wrestMMScsv <- read.csv(textConnection(DataUrl))
###
head(repmis::source_data("http://www1.appstate.edu/~arnholta/Data/NCBirths2004.csv"))

head(wrestMMS)
head(wrestMMScsv)
#### Download data from:
#### Data Downloads ? Haringey - Priory Park South
# http://www.londonair.org.uk/london/asp/datasite.asp?CBXSpecies1=NOm&CBXSpecies4=O3m&day1=1&month1=jan&year1=2013&day2=31&month2=jan&year2=2013&period=15min&ratidate=&site=HG4&res=6&Submit=Plot+graph
# Save to Public Data folder on Dropbox LaqnData.csv 02/09/14
# https://dl.dropboxusercontent.com/u/134274843/data/LaqnData.csv
AD <- repmis::source_data("https://dl.dropboxusercontent.com/u/134274843/data/LaqnData.csv")
#
plot(AD$Value[AD$Species=="NO"], type = "l", col = "red")
lines(AD$Value[AD$Species=="O3"], type = "l", col = "blue")
#
library(ggplot2)
ggplot(data = AD, aes(x = ReadingDateTime, y = Value, group = Species, color = Species)) + geom_line() + labs(x = "", y = "")
### Read from git hub now
### https://raw2.github.com/alanarnholt/SEMINAR/master/Alan/summaries/data/LaqnData.csv
site <- "https://raw2.github.com/alanarnholt/SEMINAR/master/Alan/summaries/data/LaqnData.csv"
ADg <- repmis::source_data(site)
ggplot(data = ADg, aes(x = ReadingDateTime, y = Value, group = Species, color = Species)) + geom_line() + labs(x = "", y = "")
