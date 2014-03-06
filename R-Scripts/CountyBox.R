library(maps)
map('county','north carolina')
#map.where('county',36.216658, -81.675703)
#map.where('state',36.21, -81.67)
map.where('state',-81.675703, 36.216658)
map('county','north carolina,watauga')
map.axes()

######################################################
## Below is what I think you are asking for....
## Solution implemented with ggplot2...
library(ggplot2)
library(maps)     # package has maps
library(mapproj)  # projections
WC <- map_data('county','north carolina,watauga')
head(WC)
p <- ggplot(data = WC, aes(x = long, y = lat))
p1 <- p + geom_polygon(fill = "lightgreen") + theme_bw() + 
  coord_map("polyconic") + coord_fixed() + labs(title = "Watauga County")
p1
### So what is the range for the long and lat?
RLong <- range(WC$long)
RLong
RLat <- range(WC$lat)
RLat
### Add some random points?
n <- 500  # number of points
set.seed(13)
RpointsLong <- sample(seq(RLong[1], RLong[2], length = 100), n, replace = TRUE)
RpointsLat <- sample(seq(RLat[1], RLat[2], length = 100), n, replace = TRUE)
DF <- data.frame(RpointsLong, RpointsLat)
head(DF)
p1 + geom_point(data = DF, aes(x = RpointsLong, y = RpointsLat), col = "darkgreen")
##### http://www.nceas.ucsb.edu/scicomp/usecases/GenerateConvexHullAndROIForPoints
