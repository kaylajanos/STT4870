## Alan Arnholt
## Chapter 7 RR with R and RStudio
## 2/16/14
##
# load WDI package
library(WDI)
# Searches names and descriptions of available WDI series
WDIsearch("fertilizer consumption")   
# fertilizer consumption per hectare of arable land
FertConsumpData <- WDI(indicator = "AG.CON.FERT.ZS")
head(FertConsumpData)
# table(FertConsumpData$country)
# table(FertConsumpData$year)
str(FertConsumpData)
summary(FertConsumpData)
dim(FertConsumpData)
summary(FertConsumpData$AG.CON.FERT.ZS)
head(FertConsumpData)
# Melt data...must be melted (long format) before it can be cast (wide format)
library(reshape2)
# Read about melt
MoltenFert <- melt(data = FertConsumpData,
                   id.vars = c("iso2c", "country", "year"),
                   measure.vars = c("AG.CON.FERT.ZS"))
head(MoltenFert)
summary(MoltenFert)
# Cast MoltenFert to year wide format
# Read about dcast/cast
WideFert <- dcast(data = MoltenFert,
                  formula = iso2c + country ~ year,
                  value_var = "AG.CON.FERT.ZS")
head(WideFert)
# Order WideFert by country
WideFert <- WideFert[order(WideFert$country), ]
head(WideFert)
#### Melt WideFert
MoltenFert <- melt(data = WideFert,
                   id.vars = c("iso2c", "country"))
head(MoltenFert)
# Renaming Variables
# Use package plyr
MoltenFert <- plyr::rename(x = MoltenFert,
                           replace = c("variable" = "year",
                                       "value" = "FertilizerConsumption"))
head(MoltenFert)
#### Order MoltenFert by country-year
MoltenFert <- MoltenFert[order(MoltenFert$country, MoltenFert$year), ]
head(MoltenFert)
## Subsetting data
FertOutliers <- subset(x = MoltenFert, FertilizerConsumption > 1000)
FertOutliers
MoltenFertSub <- subset(x = MoltenFert, FertilizerConsumption <= 1000)
head(MoltenFertSub)
# Remove "Arab World" countries
MoltenFertSubNoArab <- subset(x = MoltenFertSub, country != "Arab World")
# Remove NA values from FertilizerConsumption
MF <- subset(x = MoltenFertSubNoArab, 
             !is.na(FertilizerConsumption))
summary(MF$FertilizerConsumption)
MF[MF$country =='Korea, Rep.', ]
# Recode country =='Korea, Rep.' to 'South Korea'
MF$country[MF$country =='Korea, Rep.'] <- 'South Korea'
MF[MF$country =='South Korea', ]
#
summary(MF$FertilizerConsumption)
WHO <- which(MF$FertilizerConsumption==0)
MF[WHO, ]
MF[MF$iso2c =='FM',]
MF[MF$iso2c =='ER',]
MF[MF$iso2c =='KW',]
MF[MF$iso2c =='MH',]
MF[MF$iso2c =='QA',]
MF[MF$iso2c =='UZ',]
# This is me...but I think the zeros are more likely NA values
# so replace the zeros with NAs
MF$FertilizerConsumption[MF$FertilizerConsumption == 0] <- NA
MF[MF$iso2c =='UZ',]
# Create a new variable
MF$logFC <- log(MF$FertilizerConsumption)
head(MF)
summary(MF$logFC)
### Create Quartile Factor
QS <- quantile(MF$FertilizerConsumption, na.rm = TRUE)
MF$FCfactor <-  cut(MF$FertilizerConsumption, breaks = QS, 
                    include.lowest = FALSE, 
                    labels = c("Q1", "Q2", "Q3", "Q4"))
head(MF)
library(ggplot2)
p <- ggplot(data = MF, aes(x = FertilizerConsumption))
p + geom_density(fill = "pink") + 
  facet_grid(FCfactor ~ .) + 
  theme_bw()
####  Remove NA rows
MFnoNA <- na.omit(MF)
summary(MFnoNA)
####
p <- ggplot(data = MFnoNA, aes(x = FertilizerConsumption))
p + geom_density(fill = "pink") + 
  facet_grid(FCfactor ~ .) + 
  theme_bw()
####
p <- ggplot(data = MFnoNA, aes(x = FertilizerConsumption))
p + geom_density(fill = "pink") + 
  theme_bw() + 
  labs(x = "Fertilizer Consumption \n(kilograms per hectare of arable land)")
#
p <- ggplot(data = MFnoNA, aes(x = logFC))
p + geom_density(fill = "pink") + 
  theme_bw() + 
  labs(x = "Logarithm of Fertilizer Consumption \n(kilograms per hectare of arable land)")
####
#### The Merge Command
####
## First read in the data (From Chapter 5)
site1 <- "https://dl.dropbox.com/u/12581470/code/Replicability_code/Fin_Trans_Replication_Journal/Data/public.fin.msm.model.csv"
FinRegulatorData <- repmis::source_data(site1)
site2 <- "https://raw.github.com/christophergandrud/Disproportionality_Data/master/Disproportionality.csv"
DispropData <- repmis::source_data(site2)
###
###  Note the code in the book is off...neither FinRegulatorData nor DispropData have
### an iso2c variable! but they do have a country variable...
### Add iso2c codes to FinRegulatorData and DispropData
### as ID variables for merging
###
# Load countrycode
library(countrycode)

# FinRegulatorData
FinRegulatorData$iso2c <- countrycode(FinRegulatorData$country, 
                                      origin = "country.name",
                                      destination = "iso2c")

# DispropData
DispropData$iso2c <- countrycode(DispropData$country, 
                                 origin = "country.name",
                                 destination = "iso2c")


MergeData1 <- merge(x = FinRegulatorData, y = DispropData, by = union("iso2c", "year"),  all = TRUE)
head(MergeData1)
MergeData2 <- merge(x = MergeData1, y = MF, by = union("iso2c", "year"), all = TRUE)
head(MergeData2)
MergeData2[50:60, 9:12]
### Duplicate values
DataDuplicates <- MergeData2[duplicated(MergeData2[, 1:2]), ]
nrow(DataDuplicates)
DataDuplicates
DataNotDuplicates <- MergeData2[!duplicated(MergeData2[, 1:2]), ]
## Duplicate columns
## remove country.y, country, and idn
FinalCleanedData <- gdata::remove.vars(data = DataNotDuplicates, 
                                       names = c("country.y", "country", "idn"))
names(FinalCleanedData)
FinalCleanedData <- plyr::rename(FinalCleanedData, replace = c("country.x" = "country"))
names(FinalCleanedData)
